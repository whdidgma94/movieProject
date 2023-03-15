package Controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import FrontController.Controller;
import Member.MemberDAO;
import Member.MemberVO;

public class MemberJoinController implements Controller{

	@Override
	public String requestHandler(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		
		request.setCharacterEncoding("utf-8");
		if(request.getParameter("id")==null) {
			return "memberJoin";
		}
		
		String address1 = request.getParameter("address1");
		String address2 = request.getParameter("address2");
		String address = address1+" "+address2;
		String email_id = request.getParameter("email_id");
		String email_domain = request.getParameter("email_domain");
		String email = email_id+"@"+email_domain;
		MemberVO m = new MemberVO();
		m.setMemberName(request.getParameter("memberName"));
		m.setId(request.getParameter("id"));
		m.setPw(request.getParameter("pw"));
		m.setBirthDay(request.getParameter("age"));
		m.setEmail(email);
		m.setBirthDay(request.getParameter("birthDay"));
		m.setAddress(address);
		m.setFavoriteGenre(request.getParameter("favoriteGenre"));
		m.setGender(request.getParameter("gender"));
		int check = MemberDAO.getInstance().addMemberVO(m);
		String ctx = request.getContextPath();
		if(check>0) {
			return "redirect:"+ctx+"/memberLogin.do";
		}else {
			return "redirect:"+ctx+"/memberJoin.do";
		}		
	}
}


