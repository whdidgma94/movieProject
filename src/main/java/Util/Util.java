package Util;

import java.io.BufferedReader;
import java.io.InputStreamReader;
import java.net.HttpURLConnection;
import java.net.URL;
import java.time.LocalDate;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

import org.json.simple.JSONArray;
import org.json.simple.JSONObject;
import org.json.simple.parser.JSONParser;

import Credit.CreditVO;
import Movie.GenreVO;

public class Util {
	private static Util instance = new Util();

	private Util() {
	}

	public static Util getInstance() {
		return instance;
	}

	public List<HashMap<String, Object>> getMovieList(String setSubject, String pageNum) {
		String base_url = "https://api.themoviedb.org/3/movie/";
		String subject = setSubject;
		String api_key = "?api_key=a699dda4efd374eb3d9a01da4dacc267";
		String language = "&language=ko-kr&region=KR";
		String page = "&page=" + pageNum;

		String apiUrl = base_url + subject + api_key + language + page;

		List<HashMap<String, Object>> movieList = null;

		try {

			URL url = new URL(apiUrl);
			HttpURLConnection conn = (HttpURLConnection) url.openConnection();

			conn.setRequestMethod("GET");
			conn.setRequestProperty("Content-Type", "application/json");

			BufferedReader br = new BufferedReader(new InputStreamReader(conn.getInputStream()));
			StringBuilder sb = new StringBuilder();
			String line = null;

			while ((line = br.readLine()) != null) {
				sb.append(line);
			}

			JSONParser parser = new JSONParser();
			JSONObject obj = (JSONObject) parser.parse(sb.toString());

			JSONArray objArray = (JSONArray) obj.get("results");

			movieList = new ArrayList<HashMap<String, Object>>();

			for (int i = 0; i < objArray.size(); i++) {
				HashMap<String, Object> movieMap = new HashMap<>();
				JSONObject jb = (JSONObject) objArray.get(i);
				if (!jb.get("overview").equals("")) {

					movieMap.put("movieCd", jb.get("id"));
					movieMap.put("movieNm", jb.get("title"));
					movieMap.put("genreNm", jb.get("genre_ids"));
					movieMap.put("openDt", jb.get("release_date"));
					movieMap.put("subject", setSubject);
					movieMap.put("adult", jb.get("adult"));
					movieMap.put("poster_path", jb.get("poster_path"));
					if (jb.get("backdrop_path") == null) {
						movieMap.put("backdrop_path", jb.get("poster_path"));
					} else {
						movieMap.put("backdrop_path", jb.get("backdrop_path"));
					}
					movieMap.put("overview", jb.get("overview"));

					movieList.add(movieMap);
				}

			}
			conn.disconnect();
		} catch (Exception e) {
			e.printStackTrace();
		}

		return movieList;

	}

	public List<CreditVO> getCreditList(int movieCd) {
		String base_url = "https://api.themoviedb.org/3/movie/";
		String api_key = "?api_key=a699dda4efd374eb3d9a01da4dacc267";
		String language = "&language=ko-KR";
		String apiUrl = base_url + movieCd + "/credits" + api_key + language;

		List<CreditVO> creditList = null;

		try {
			URL url = new URL(apiUrl);
			HttpURLConnection conn = (HttpURLConnection) url.openConnection();

			conn.setRequestMethod("GET");
			conn.setRequestProperty("Content-Type", "application/json");

			BufferedReader br = new BufferedReader(new InputStreamReader(conn.getInputStream()));
			StringBuilder sb = new StringBuilder();
			String line = null;

			while ((line = br.readLine()) != null) {
				sb.append(line);
			}

			JSONParser parser = new JSONParser();
			JSONObject obj = (JSONObject) parser.parse(sb.toString());

			JSONArray objArray = (JSONArray) obj.get("cast");
			JSONArray objArray2 = (JSONArray) obj.get("crew");

			creditList = new ArrayList<CreditVO>();

			for (int i = 0; i < objArray.size(); i++) {
				JSONObject jb = (JSONObject) objArray.get(i);

				CreditVO vo = new CreditVO();
				if (jb.get("name") != null && jb.get("profile_path") != null && jb.get("character") != null
						&& !jb.get("name").equals("") && !jb.get("profile_path").equals("")
						&& !jb.get("character").equals("")) {
					vo.setId(Integer.parseInt(jb.get("id").toString()));
					vo.setName(jb.get("name").toString());
					vo.setProfile_path(jb.get("profile_path").toString());
					vo.setCharac(jb.get("character").toString());
					vo.setJob("Actor");
				}

				creditList.add(vo);
			}

			for (int i = 0; i < objArray2.size(); i++) {
				JSONObject jb = (JSONObject) objArray2.get(i);
				if (jb.get("job").equals("Director")) {
					CreditVO vo = new CreditVO();
					if (jb.get("name") != null && jb.get("profile_path") != null && jb.get("job") != null
							&& !jb.get("name").equals("") && !jb.get("profile_path").equals("")
							&& !jb.get("job").equals("")) {
						vo.setId(Integer.parseInt(jb.get("id").toString()));
						vo.setName(jb.get("name").toString());
						vo.setProfile_path(jb.get("profile_path").toString());
						vo.setJob(jb.get("job").toString());
					}
					creditList.add(vo);
				}
			}
			conn.disconnect();
		} catch (Exception e) {
			e.printStackTrace();
		}

		return creditList;

	}

	public List<String> getMovieImageList(int movieCd) {
		String base_url = "https://api.themoviedb.org/3/movie/";
		String api_key = "?api_key=a699dda4efd374eb3d9a01da4dacc267";
		String apiUrl = base_url + movieCd + "/images" + api_key;

		List<String> imageList = null;

		try {
			URL url = new URL(apiUrl);
			HttpURLConnection conn = (HttpURLConnection) url.openConnection();

			conn.setRequestMethod("GET");
			conn.setRequestProperty("Content-Type", "application/json");

			BufferedReader br = new BufferedReader(new InputStreamReader(conn.getInputStream()));
			StringBuilder sb = new StringBuilder();
			String line = null;

			while ((line = br.readLine()) != null) {
				sb.append(line);
			}
			JSONParser parser = new JSONParser();
			JSONObject obj = (JSONObject) parser.parse(sb.toString());

			JSONArray objArray = (JSONArray) obj.get("posters");
			JSONArray objArray2 = (JSONArray) obj.get("backdrops");

			imageList = new ArrayList<String>();

			for (int i = 0; i < objArray.size(); i++) {
				JSONObject jb = (JSONObject) objArray.get(i);
				if (jb.get("iso_639_1") != null) {
					if (jb.get("iso_639_1").toString().equals("ko")) {
						imageList.add(jb.get("file_path").toString());
					}
				}
			}
			for (int i = 0; i < objArray2.size(); i++) {
				JSONObject jb = (JSONObject) objArray2.get(i);

				if (jb.get("iso_639_1") != null) {
					if (jb.get("iso_639_1").toString().equals("ko")) {
						imageList.add(jb.get("file_path").toString());
					}
				} else {
					imageList.add(jb.get("file_path").toString());
				}
			}
			conn.disconnect();
		} catch (Exception e) {
			e.printStackTrace();
		}

		return imageList;

	}

	public String getVideoKey(int movieCd) {
		String key = "";

		String base_url = "https://api.themoviedb.org/3/movie/";
		String api_key = "?api_key=a699dda4efd374eb3d9a01da4dacc267";
		String language = "&language=ko-KR";

		String apiUrl = base_url + movieCd + "/videos" + api_key + language;

		try {
			URL url = new URL(apiUrl);
			HttpURLConnection conn = (HttpURLConnection) url.openConnection();

			conn.setRequestMethod("GET");
			conn.setRequestProperty("Content-Type", "application/json");

			BufferedReader br = new BufferedReader(new InputStreamReader(conn.getInputStream()));
			StringBuilder sb = new StringBuilder();
			String line = null;

			while ((line = br.readLine()) != null) {
				sb.append(line);
			}

			JSONParser parser = new JSONParser();
			JSONObject jb = (JSONObject) parser.parse(sb.toString());

			JSONArray objArray = (JSONArray) jb.get("results");

			if (objArray.size() > 0) {
				JSONObject obj = (JSONObject) objArray.get(0);
				key = obj.get("key").toString();
			}
			conn.disconnect();
		} catch (Exception e) {
			e.printStackTrace();
		}
		return key;
	}

	public List<GenreVO> getGenreList() {
		String base_url = "https://api.themoviedb.org/3/genre/movie/list";
		String api_key = "?api_key=a699dda4efd374eb3d9a01da4dacc267";
		String language = "&language=ko-kr";
		String apiUrl = base_url + api_key + language;

		List<GenreVO> genreList = null;
		try {
			URL url = new URL(apiUrl);
			HttpURLConnection conn = (HttpURLConnection) url.openConnection();
			conn.setRequestMethod("GET");
			conn.setRequestProperty("Content-Type", "application/json");

			BufferedReader br = new BufferedReader(new InputStreamReader((conn.getInputStream())));
			StringBuilder sb = new StringBuilder();
			String line = null;

			while ((line = br.readLine()) != null) {
				sb.append(line);
			}

			JSONParser parser = new JSONParser();
			JSONObject jb = (JSONObject) parser.parse(sb.toString());
			JSONArray objArray = (JSONArray) jb.get("genres");
			genreList = new ArrayList<GenreVO>();
			for (Object obj : objArray) {
				JSONObject genreObj = (JSONObject) obj;
				String name = (String) genreObj.get("name");
				Long id = (Long) genreObj.get("id");
				GenreVO g = new GenreVO();
				g.setGenreId(Integer.parseInt(id + ""));
				g.setGenreName(name);
				genreList.add(g);
			}

			conn.disconnect();

		} catch (Exception e) {
			e.printStackTrace();
		}

		return genreList;
	}

	public List<HashMap<String, Object>> getBoxOfficeList() {
		String base_url = "	http://kobis.or.kr/kobisopenapi/webservice/rest/boxoffice/searchDailyBoxOfficeList.json";
		String api_key = "?key=7532377ec0b85020c332a47475218ba2";
		LocalDate today = LocalDate.now();
		LocalDate yesterday = today.minusDays(1);
		String targetDt = yesterday.toString().replace("-", "");

		String apiUrl = base_url + api_key + "&targetDt=" + targetDt;

		List<HashMap<String, Object>> movieList = null;
		try {
			URL url = new URL(apiUrl);
			HttpURLConnection conn = (HttpURLConnection) url.openConnection();
			conn.setRequestMethod("GET");
			conn.setRequestProperty("Content-Type", "application/json");

			BufferedReader br = new BufferedReader(new InputStreamReader((conn.getInputStream())));
			StringBuilder sb = new StringBuilder();
			String line = null;

			while ((line = br.readLine()) != null) {
				sb.append(line);
			}

			JSONParser parser = new JSONParser();
			JSONObject jb = (JSONObject) parser.parse(sb.toString());
			jb = (JSONObject) jb.get("boxOfficeResult");
			JSONArray objArray = (JSONArray) jb.get("dailyBoxOfficeList");

			movieList = new ArrayList<HashMap<String, Object>>();
			for (int i = 0; i < objArray.size(); i++) {
				HashMap<String, Object> movieMap = new HashMap<>();
				jb = (JSONObject) objArray.get(i);
				String movieNm = (String) jb.get("movieNm");
				movieNm = movieNm.replace(" ", "%20");
				movieMap = getMovieInfo(movieNm);
				movieMap.put("audiCnt", jb.get("audiCnt"));
				System.out.println(movieMap.get("movieNm")+","+ movieMap.get("movieCd"));
				movieList.add(movieMap);
			}
			conn.disconnect();

		} catch (Exception e) {
			e.printStackTrace();
		}
		return movieList;
	}

	public HashMap<String, Object> getMovieInfo(String movieNm) {
		String base_url = "https://api.themoviedb.org/3/search/movie";
		String api_key = "?api_key=a699dda4efd374eb3d9a01da4dacc267";
		String language = "&language=ko-kr&region=KR";
		String query = "&query=" + movieNm;
		String apiUrl = base_url + api_key + language + query;
		HashMap<String, Object> movieMap = null;
		try {
			URL url = new URL(apiUrl);
			HttpURLConnection conn = (HttpURLConnection) url.openConnection();
			conn.setRequestMethod("GET");
			conn.setRequestProperty("Content-Type", "application/json");

			BufferedReader br = new BufferedReader(new InputStreamReader((conn.getInputStream())));
			StringBuilder sb = new StringBuilder();
			String line = null;

			while ((line = br.readLine()) != null) {
				sb.append(line);
			}
			movieMap = new HashMap<String, Object>();
			JSONParser parser = new JSONParser();
			JSONObject jb = (JSONObject) parser.parse(sb.toString());
			JSONArray objArray = (JSONArray) jb.get("results");
			for (int i = 0; i < objArray.size(); i++) {
				jb = (JSONObject) objArray.get(i);
				if (!jb.get("overview").equals("")) {
					movieNm = movieNm.replace("%20", " ");
					if (movieNm.contains(jb.get("title").toString())) {
						movieMap.put("movieCd", jb.get("id"));
						movieMap.put("movieNm", jb.get("title"));
						movieMap.put("genreNm", jb.get("genre_ids"));
						movieMap.put("openDt", jb.get("release_date"));
						movieMap.put("adult", jb.get("adult"));
						movieMap.put("poster_path", jb.get("poster_path"));
						if (jb.get("backdrop_path") == null) {
							movieMap.put("backdrop_path", jb.get("poster_path"));
						} else {
							movieMap.put("backdrop_path", jb.get("backdrop_path"));
						}
						movieMap.put("overview", jb.get("overview"));
					}
				}
			}

		} catch (Exception e) {
			e.printStackTrace();
		}
		return movieMap;
	}
}
