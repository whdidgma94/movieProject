package Controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import FrontController.Controller;
import Member.MemberDAO;
import Member.MemberVO;

public class CheckPasswordController implements Controller{

	@Override
	public String requestHandler(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		HttpSession session = request.getSession();	
		String id = (String) session.getAttribute("log");
		String pw = request.getParameter("password");
		MemberVO member = MemberDAO.getInstance().getOneUser(id);
		if(member.getPw().equals(pw)) {
			response.getWriter().print(1);
		}else {
			response.getWriter().print(0);
		}
		return null;
	}

}
