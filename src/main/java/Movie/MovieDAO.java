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
	
	public List<MovieVO> movieRankByReview(){
		SqlSession session = MybatisConfig.getInstance().openSession(true);
		List<MovieVO> list = session.selectList("mapper.movie.movieRankByReview");
		session.close();
		return list;
	}
	
	public List<MovieVO> movieRankByGrade(){
		SqlSession session = MybatisConfig.getInstance().openSession(true);
		List<MovieVO> list = session.selectList("mapper.movie.movieRankByGrade");
		session.close();
		return list;
	}
	
	public int movieReviewCnt(int movieCd){
		SqlSession session = MybatisConfig.getInstance().openSession(true);
		int cnt = session.selectOne("mapper.movie.movieReviewCnt",movieCd);
		session.close();
		return cnt;
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
	
	public void updateMovie(MovieVO movieVO) {
		SqlSession session = MybatisConfig.getInstance().openSession(true);
		session.update("mapper.movie.updateMovie", movieVO);
		session.close();
	}


	public void deleteMovie(int movieCd) {
		SqlSession session = MybatisConfig.getInstance().openSession(true);
		session.delete("mapper.movie.deleteMovie", movieCd);
		session.close();
	}
}
