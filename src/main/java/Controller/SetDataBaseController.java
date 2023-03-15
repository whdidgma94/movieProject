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
		MovieVO mvo = new MovieVO();
		try {
			JSONParser jp = new JSONParser();
			JSONObject jb = (JSONObject) jp.parse(movieList);
			mvo.setMovieCd(Integer.parseInt((String) jb.get("movieCd")));
			mvo.setMovieNm((String) jb.get("movieNm"));
			mvo.setOpenDt((String) jb.get("openDt"));
			mvo.setAudiCnt(Integer.parseInt((String) jb.get("audiAcc")));
		} catch (Exception e) {
			e.printStackTrace();
		}
		String movie = request.getParameter("movie");

		try {
			JSONParser jp2 = new JSONParser();
			JSONObject jb2 = (JSONObject) jp2.parse(movie);
			JSONArray audits = (JSONArray) jb2.get("audits");
			JSONObject watchGradeNm = (JSONObject) audits.get(0);
			mvo.setWatchGradeNm((String) watchGradeNm.get("watchGradeNm"));
			JSONArray directors = (JSONArray) jb2.get("directors");
			JSONObject firstDirector = (JSONObject) directors.get(0);
			mvo.setDirector((String) firstDirector.get("peopleNm"));
			JSONArray actors = (JSONArray) jb2.get("actors");
			String actor = "";
			if (actors != null && actors.size() > 0) {
				for (int j = 0; j < actors.size(); j++) {
					JSONObject act = (JSONObject) actors.get(j);
					String actorNm = (String) act.get("peopleNm");
					actor += actorNm;
					if (j != actors.size() - 1) {
						actor += ",";
					}
				}
				mvo.setActor(actor);
			}
			mvo.setShowTm(Integer.parseInt((String) jb2.get("showTm")));
			JSONArray showTypes = (JSONArray) jb2.get("showTypes");
			JSONObject showType = (JSONObject) showTypes.get(0);
			String showType2 = null;
			if (showTypes != null && showTypes.size() > 0) {
				showType2 = (String) showType.get("showTypeGroupNm") + "," + (String) showType.get("showTypeNm");
				mvo.setShowTypeNm(showType2);
			}
			JSONArray genres = (JSONArray) jb2.get("genres");
			String gr = "";
			if (genres != null && genres.size() > 0) {
				for (int j = 0; j < genres.size(); j++) {
					JSONObject genre = (JSONObject) genres.get(j);
					String genreNm = (String) genre.get("genreNm");
					gr += genreNm;
					if (j != genres.size() - 1) {
						gr += ",";
					}
				}
				mvo.setGenreNm(gr);
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		MovieDAO.getInstance().insertMovie(mvo);
		System.out.println(mvo.getActor());
		return null;
	}

}
