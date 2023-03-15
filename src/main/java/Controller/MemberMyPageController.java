package Controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import FrontController.Controller;
import Member.MemberDAO;
import Member.MemberVO;

public class MemberMyPageController implements Controller{

	@Override
	public String requestHandler(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		HttpSession session = request.getSession();
		String id = (String) session.getAttribute("log");
		MemberVO member = MemberDAO.getInstance().getOneUser(id);
		session.setAttribute("member", member);
		return "memberMyPage";
	}
	

}
