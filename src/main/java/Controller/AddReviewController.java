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
import Member.MemberPickDAO;
import Member.MemberPickVO;
import Movie.MovieDAO;
import Movie.MovieVO;

public class AddReviewController implements Controller {

	@Override
	public String requestHandler(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		String ctx = request.getContextPath();
		List<MovieVO> movieList = MovieDAO.getInstance().getAllMovie();

		request.setAttribute("movieList", movieList);
		HttpSession session = request.getSession();
		if (request.getParameter("movieCd") == null) {
			MemberPickVO memberPickVO = MemberPickDAO.getInstance().getMemberPick((String) session.getAttribute("log"));
			String[] seenList = null;
			if (memberPickVO != null && memberPickVO.getMovieSeen() != null) {
				seenList = memberPickVO.getMovieSeen().split(",");
			}
			request.setAttribute("seenList", seenList);
			return "movieReviewInsert";
		}
		String writerId = (String) session.getAttribute("log");
		int movieCd = Integer.parseInt(request.getParameter("movieCd"));
		int grade = Integer.parseInt(request.getParameter("grade"));
		String contents = request.getParameter("contents");
		BoardVO vo = new BoardVO(writerId, movieCd, grade, contents);
		BoardDAO.getInstance().addBoard(vo);
		MovieVO m = MovieDAO.getInstance().getOneMovie(movieCd);
		m.setGrade(BoardDAO.getInstance().getAvgGrade(m.getMovieCd()));
		MovieDAO.getInstance().updateMovie(m);
		return "redirect:" + ctx + "/movieReview.do";
	}

}
