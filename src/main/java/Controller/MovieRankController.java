package Controller;

import java.io.IOException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import FrontController.Controller;
import Movie.GenreDAO;
import Movie.MovieDAO;
import Movie.MovieVO;
import Util.Util;

public class MovieRankController implements Controller {

	@Override
	public String requestHandler(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		String type = request.getParameter("type");
		List<MovieVO> movieRankList = null;
		List<Integer> audiCnt = new ArrayList<Integer>();
		List<Integer> reviewCnt = new ArrayList<Integer>();
		if (type.equals("box")) {
			List<HashMap<String, Object>> movieList = Util.getInstance().getBoxOfficeList();
			movieRankList = new ArrayList<MovieVO>();
			for (int i = 0; i < movieList.size(); i++) {
				MovieVO vo = setMovieVo(movieList.get(i));
				movieRankList.add(vo);
				audiCnt.add(Integer.parseInt((String) movieList.get(i).get("audiCnt")));
			}
		} else if (type.equals("review")) {
			movieRankList = MovieDAO.getInstance().movieRankByReview();
			for (MovieVO m : movieRankList) {
				reviewCnt.add(MovieDAO.getInstance().movieReviewCnt(m.getMovieCd()));
			}
		} else if (type.equals("grade")) {
			movieRankList = MovieDAO.getInstance().movieRankByGrade();
		}
		request.setAttribute("type", type);
		request.setAttribute("audiCnt", audiCnt);
		request.setAttribute("reviewCnt", reviewCnt);
		request.setAttribute("movieRankList", movieRankList);
		return "movieRank";
	}

	public MovieVO setMovieVo(HashMap<String, Object> movieMap) {
		MovieVO vo = new MovieVO();
		int movieCd = Integer.parseInt(movieMap.get("movieCd").toString());
		vo.setMovieCd(movieCd);
		vo.setMovieNm(movieMap.get("movieNm").toString());
		String genreNm = movieMap.get("genreNm").toString();
		genreNm = genreNm.replace("[", "").replace("]", "").trim();
		if (!genreNm.equals("")) {
			String[] genres = genreNm.split(",");
			genreNm = "";
			for (int k = 0; k < genres.length; k++) {
				genreNm += GenreDAO.getInstance().getGenreName(Integer.parseInt(genres[k]));
				if (k != genres.length - 1)
					genreNm += ",";
			}
		} else {
			genreNm = " ";
		}
		vo.setGenreNm(genreNm);
		vo.setOpenDt(movieMap.get("openDt").toString());
		vo.setGrade(0);
		vo.setAdult((boolean) movieMap.get("adult"));
		vo.setPoster_path(movieMap.get("poster_path").toString());
		vo.setBackdrop_path(movieMap.get("backdrop_path").toString());
		vo.setOverview(movieMap.get("overview").toString());
		return vo;
	}
}
