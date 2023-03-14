package Controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import FrontController.Controller;
import Member.MemberDAO;
import Member.MemberVO;

public class MemberLoginController implements Controller{

	@Override
	public String requestHandler(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		
		request.setCharacterEncoding("utf-8");
		String id = request.getParameter("id");
		String pw = request.getParameter("pw");
		if(id==null) {
			return "memberLogin";
		}
		MemberVO member = new MemberVO();
		member.setId(id);
		member.setPw(pw);
		if(MemberDAO.getInstance().memberLogin(member)) {
			HttpSession session = request.getSession();
			session.setAttribute("log", id);
			response.getWriter().print(1);
			return null;
		}else {
			response.getWriter().print(0);
			return null;
		}
	}
	
}
