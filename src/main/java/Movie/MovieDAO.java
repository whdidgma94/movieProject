package Movie;

import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStreamReader;
import java.io.UnsupportedEncodingException;
import java.net.HttpURLConnection;
import java.net.MalformedURLException;
import java.net.ProtocolException;
import java.net.URL;
import java.net.URLEncoder;
import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.json.simple.JSONArray;
import org.json.simple.JSONObject;
import org.json.simple.parser.JSONParser;
import org.json.simple.parser.ParseException;

import Movie.MovieDAO;
import Util.MybatisConfig;

public class MovieDAO {

	private MovieDAO() {
	}

	static private MovieDAO instance = new MovieDAO();

	static public MovieDAO getInstance() {
		return instance;
	}

	public List<MovieVO> getAllMovie() {
		SqlSession session = MybatisConfig.getInstance().openSession(true);
		List<MovieVO> list = session.selectList("mapper.movie.getAllMovie");
		session.close();
		return list;
	}

	public List<MovieVO> getSearchMovie(String inputVal) {
		SqlSession session = MybatisConfig.getInstance().openSession(true);
		List<MovieVO> list = session.selectList("mapper.movie.getSearchMovie", inputVal);
		session.close();
		return list;
	}

	public MovieVO getOneMovie(int movieCd) {
		SqlSession session = MybatisConfig.getInstance().openSession(true);
		MovieVO resVO = session.selectOne("mapper.movie.getOneMovie", movieCd);
		session.close();
		return resVO;
	}

	public String getMovieName(int movieCd) {
		SqlSession session = MybatisConfig.getInstance().openSession(true);
		String movieNm = session.selectOne("mapper.movie.getMovieName", movieCd);
		session.close();
		return movieNm;
	}

	public List<MovieVO> movieRankList() {
		SqlSession session = MybatisConfig.getInstance().openSession(true);
		List<MovieVO> list = session.selectList("mapper.movie.movieRankList");
		session.close();
		return list;
	}

	public List<MovieVO> genreMovieList(String genreNm) {
		SqlSession session = MybatisConfig.getInstance().openSession(true);
		List<MovieVO> list = session.selectList("mapper.movie.genreMovieList", genreNm);
		session.close();
		return list;
	}

	public List<String> getGenreList() {
		SqlSession session = MybatisConfig.getInstance().openSession(true);
		List<String> list = session.selectList("mapper.movie.getGenreList");
		session.close();
		return list;
	}

	public void insertMovie(MovieVO movieVO) {
		SqlSession session = MybatisConfig.getInstance().openSession(true);
		session.insert("mapper.movie.insertMovie", movieVO);
		session.close();
	}

	public void deleteMovie(int movieCd) {
		SqlSession session = MybatisConfig.getInstance().openSession(true);
		session.delete("mapper.movie.deleteMovie", movieCd);
		session.close();
	}

	public String getImgUrl(String movieNm) {

		String clientId = "h0TEopSBA8P6j0SDM4NV"; 
		String clientSecret = "B5neLh3HSS";
		String text = null;
		try {
			text = URLEncoder.encode(movieNm, "UTF-8");
		} catch (UnsupportedEncodingException e) {
			throw new RuntimeException("검색어 인코딩 실패", e);
		}

		String apiURL = "https://openapi.naver.com/v1/search/movie?query=" + text; // JSON 결과

		URL url = null;
		try {
			url = new URL(apiURL);
		} catch (MalformedURLException e1) {
			e1.printStackTrace();
		}
		HttpURLConnection con = null;
		try {
			con = (HttpURLConnection) url.openConnection();
		} catch (IOException e1) {
			e1.printStackTrace();
		}
		try {
			con.setRequestMethod("GET");
		} catch (ProtocolException e1) {
			e1.printStackTrace();
		}
		con.setRequestProperty("X-Naver-Client-Id", clientId);
		con.setRequestProperty("X-Naver-Client-Secret", clientSecret);
		int responseCode = 0;
		try {
			responseCode = con.getResponseCode();
		} catch (IOException e1) {
			e1.printStackTrace();
		}
		BufferedReader br = null;
		if (responseCode == 200) {
			try {
				br = new BufferedReader(new InputStreamReader(con.getInputStream()));
			} catch (IOException e) {
				e.printStackTrace();
			}
		} else {
			br = new BufferedReader(new InputStreamReader(con.getErrorStream()));
		}
		String inputLine;
		StringBuffer rp = new StringBuffer();
		try {
			while ((inputLine = br.readLine()) != null) {
				rp.append(inputLine);
			}
		} catch (IOException e1) {
			e1.printStackTrace();
		}
		try {
			br.close();
		} catch (IOException e1) {
			e1.printStackTrace();
		}
		JSONParser jp = new JSONParser();
		JSONObject jb = null;
		try {
			jb = (JSONObject) jp.parse(rp.toString());
		} catch (ParseException e) {
			e.printStackTrace();
		}
		JSONArray infoArray = (JSONArray) jb.get("items");
		JSONObject itemObject = (JSONObject) infoArray.get(0);
		return itemObject.get("image").toString();

	}
}
