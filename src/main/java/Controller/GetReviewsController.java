package Controller;

import java.io.IOException;
import java.util.List;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.google.gson.Gson;

import Board.BoardDAO;
import Board.BoardVO;
import FrontController.Controller;

public class GetReviewsController implements Controller{

	@Override
	public String requestHandler(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		response.setCharacterEncoding("utf-8");
		HttpSession session = request.getSession();
		String movieCd = request.getParameter("movieCd");
		List<BoardVO> reviewList = null;
		if(movieCd.equals("all")) {
			reviewList = BoardDAO.getInstance().getAllBoard();
		}else {
			int movieCdInt = Integer.parseInt(movieCd);
			reviewList = BoardDAO.getInstance().getMovieCdBoard(movieCdInt);
		}
		if(reviewList.size()==0) {
			session.removeAttribute("reviewList");
		}else {
			session.setAttribute("reviewList", reviewList);
		}
		String jsonList = new Gson().toJson(reviewList);
		response.getWriter().write("{\"reviewList\":" + jsonList + "}");
		return null;
	}

}