package Controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import FrontController.Controller;
import Member.MemberDAO;
import Member.MemberVO;

public class MemberUpdateController implements Controller {

	@Override
	public String requestHandler(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		request.setCharacterEncoding("utf-8");
		HttpSession session = request.getSession();
		if (request.getParameter("memberName") == null) {
			return "memberUpdate";
		}
		MemberVO m = new MemberVO();
		String id = (String) session.getAttribute("log");
		m.setId(id);
		if (id.equals("admin")) {
			MemberVO member = (MemberVO)session.getAttribute("member");
			id= member.getId();
			m.setId(id);
		}
		String email_id = request.getParameter("email_id");
		String email_domain = request.getParameter("email_domain");
		String email = email_id + "@" + email_domain;
		m.setMemberName(request.getParameter("memberName"));
		m.setPw(request.getParameter("pw"));
		m.setEmail(email);
		if (!request.getParameter("address1").equals("")) {
			String address1 = request.getParameter("address1");
			String address2 = request.getParameter("address2");
			String address = address1 + " " + address2;
			m.setAddress(address);
			MemberDAO.getInstance().memberUpdate1(m);
		} else {
			MemberDAO.getInstance().memberUpdate2(m);
		}
		String ctx = request.getContextPath();
		id=(String) session.getAttribute("log");
		if (id.equals("admin")) {
			return "redirect:" + ctx + "/adminMemberUpdate.do";
		}else {
			return "redirect:" + ctx + "/memberMyPage.do";			
		}
	}

}
