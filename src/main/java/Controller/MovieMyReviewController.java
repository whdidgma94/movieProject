package Controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import Board.BoardDAO;
import Board.BoardVO;
import FrontController.Controller;
import Movie.MovieDAO;
import Movie.MovieVO;

public class MovieMyReviewController implements Controller{

	@Override
	public String requestHandler(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		HttpSession session = request.getSession();
		String ctx = request.getContextPath();
		if(session.getAttribute("log")==null) {
			return "redirect:"+ctx+"/memberLogin.do";
		}
		List<MovieVO> movieList = MovieDAO.getInstance().getAllMovie();
		List<BoardVO> reviewList = BoardDAO.getInstance().getAllBoard();
		request.setAttribute("movieList", movieList);
		session.setAttribute("reviewList", reviewList);
		return "movieMyReview";
	}

}
