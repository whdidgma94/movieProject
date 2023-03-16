package Controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import FrontController.Controller;
import Member.MemberDAO;
import Member.MemberVO;

public class RecommandMovieController implements Controller {

	@Override
	public String requestHandler(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		HttpSession session = request.getSession();
		String log = (String) session.getAttribute("log");
		MemberVO mvo = MemberDAO.getInstance().getOneUser(log);
		String genre = mvo.getFavoriteGenre();
		if(genre.equals("기타")) {
			request.setAttribute("genre", null);
		} else {
			request.setAttribute("genre", genre);
			
		}

		return "recommandMovie";
	}

}
