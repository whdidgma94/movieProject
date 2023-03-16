package Controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import Board.BoardDAO;
import Board.BoardVO;
import FrontController.Controller;

public class AddReviewController implements Controller{

	@Override
	public String requestHandler(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		HttpSession session = request.getSession();
		String writerId = (String)session.getAttribute("log");
		int movieCd = Integer.parseInt(request.getParameter("movieCd"));
		int grade = Integer.parseInt(request.getParameter("grade"));
		String contents = request.getParameter("contents");
		BoardVO vo = new BoardVO(writerId,movieCd,grade,contents);
		BoardDAO.getInstance().addBoard(vo);
		String ctx = request.getContextPath();
		return "redirect:"+ctx+"/movieReview.do";
	}

}
