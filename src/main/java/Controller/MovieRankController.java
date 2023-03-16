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
		List<MovieVO> movieRankList = MovieDAO.getInstance().movieRankList();
		request.setAttribute("movieRankList", movieRankList);
		return "movieRank";
	}

}
