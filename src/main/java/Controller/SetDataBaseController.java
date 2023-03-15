package Controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.json.simple.JSONArray;
import org.json.simple.JSONObject;
import org.json.simple.parser.JSONParser;

import FrontController.Controller;
import Movie.MovieDAO;
import Movie.MovieVO;

public class SetDataBaseController implements Controller {

	@Override
	public String requestHandler(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		String movieList = request.getParameter("movieList");
		System.out.println(movieList);
		MovieVO mvo = new MovieVO();
		try {
			JSONParser jp = new JSONParser();
			for (int i = 0; i < 10; i++) {
				JSONObject jb = (JSONObject) jp.parse(movieList);
				mvo.setMovieCd(Integer.parseInt((String) jb.get("movieCd")));
				mvo.setMovieNm((String) jb.get("movieNm"));
				mvo.setOpenDt((String) jb.get("openDt"));
				mvo.setAudiCnt(Integer.parseInt((String) jb.get("audiAcc")));
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		String movie = request.getParameter("movie");
		System.out.println(movie);

		try {
			JSONParser jp2 = new JSONParser();
			for (int i = 0; i < 10; i++) {
				JSONObject jb2 = (JSONObject) jp2.parse(movie);
				JSONArray audits = (JSONArray) jb2.get("audits");
				JSONObject watchGradeNm = (JSONObject) audits.get(0);
				mvo.setWatchGradeNm((String) watchGradeNm.get("watchGradeNm"));
				JSONArray directors = (JSONArray) jb2.get("directors");
				JSONObject firstDirector = (JSONObject) directors.get(0);
				mvo.setDirector((String) firstDirector.get("peopleNm"));
				JSONArray actors = (JSONArray) jb2.get("actors");
				if (actors != null && actors.size() > 0) {
					JSONObject firstActor = (JSONObject) actors.get(0);
					mvo.setActor((String) firstActor.get("peopleNm"));
				}
				mvo.setShowTm(Integer.parseInt((String) jb2.get("showTm")));
				mvo.setShowTypeNm((String) jb2.get("showTypeNm"));
				System.out.println((String) jb2.get("genres[0]"));
				mvo.setGenreNm((String) jb2.get("genres[0]"));
				MovieDAO.getInstance().insertMovie(mvo);
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return null;
	}

}
