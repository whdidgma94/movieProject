package Controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import FrontController.Controller;
import Movie.MovieDAO;
import Movie.MovieVO;

public class MovieRankController implements Controller {

	@Override
	public String requestHandler(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		String type = request.getParameter("type");
		List<MovieVO> movieRankList = null;
		if(type.equals("box")) {
			movieRankList = MovieDAO.getInstance().movieRankList();
		}else if(type.equals("review")) {
			movieRankList = MovieDAO.getInstance().movieRankByReview();
		}else if(type.equals("grade")) {
			movieRankList = MovieDAO.getInstance().movieRankByGrade();
		}
		request.setAttribute("type", type);
		request.setAttribute("movieRankList", movieRankList);
		return "movieRank";
	}

}
