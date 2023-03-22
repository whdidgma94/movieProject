package Controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.json.simple.JSONArray;
import org.json.simple.JSONObject;
import org.json.simple.parser.JSONParser;

import FrontController.Controller;
import Movie.GenreDAO;
import Movie.MovieDAO;
import Movie.MovieVO;

public class SetDataBaseController implements Controller {

	@Override
	public String requestHandler(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		MovieVO mvo = new MovieVO();

		String movie = request.getParameter("movie");
		try {
			JSONParser jp = new JSONParser();
			JSONObject jb = (JSONObject) jp.parse(movie);
			System.out.println(jb);
			mvo.setMovieNm((String) jb.get("title"));
			mvo.setMovieCd(Integer.parseInt((Long) jb.get("id") + ""));
			JSONArray genres = (JSONArray) jb.get("genre_ids");
			String genresNm = "";
			for (int i = 0; i < genres.size(); i++) {
				String genreName = GenreDAO.getInstance().getGenreName(Integer.parseInt(genres.get(i) + ""));
				genresNm += genreName;
				if (i != genres.size() - 1)
					genresNm += ",";
			}
			mvo.setGenreNm(genresNm);
			mvo.setWatchGradeNm("test");
			mvo.setOpenDt((String) jb.get("release_date"));
			mvo.setDirector("test");
			mvo.setActor("test");
			mvo.setShowTm(0);
			mvo.setShowTypeNm("test");
			mvo.setAdult((boolean) jb.get("adult"));
			mvo.setPoster_path((String) jb.get("poster_path"));
			mvo.setVideo((boolean) jb.get("video"));
			mvo.setOverview((String) jb.get("overview"));
		} catch (Exception e) {
			e.printStackTrace();
		}
		MovieDAO.getInstance().insertMovie(mvo);
		return null;
	}
}