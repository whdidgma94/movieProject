package Controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import Board.BoardDAO;
import Board.BoardVO;
import FrontController.Controller;
import Movie.MovieDAO;
import Movie.MovieVO;

public class MovieReviewController implements Controller{

	@Override
	public String requestHandler(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		List<MovieVO> movieList = MovieDAO.getInstance().getAllMovie();
		List<BoardVO> reviewList = BoardDAO.getInstance().getAllBoard();
		request.setAttribute("movieList", movieList);
		request.setAttribute("reviewList", reviewList);
		return "movieReview";
	}

}
