package Controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import Board.BoardDAO;
import Board.BoardVO;
import FrontController.Controller;
import Member.MemberDAO;
import Member.MemberVO;
import Movie.MovieDAO;
import Movie.MovieVO;

public class AdminReviewController implements Controller{

	@Override
	public String requestHandler(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		List<BoardVO> reviewList = BoardDAO.getInstance().getAllBoard();
		List<MemberVO> memberList = MemberDAO.getInstance().getAllMember();
		List<MovieVO> movieList = MovieDAO.getInstance().getAllMovie();
		request.setAttribute("reviewList", reviewList);
		request.setAttribute("memberList", memberList);
		request.setAttribute("movieList", movieList);
		return "adminReview";
	}

}
