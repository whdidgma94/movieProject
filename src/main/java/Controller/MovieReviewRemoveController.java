package Controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import Board.BoardDAO;
import FrontController.Controller;

public class MovieReviewRemoveController implements Controller{

	@Override
	public String requestHandler(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		int reviewNm =  Integer.parseInt(request.getParameter("reviewNm"));
		BoardDAO.getInstance().removeBoard(reviewNm);
		return null;
	}

}
