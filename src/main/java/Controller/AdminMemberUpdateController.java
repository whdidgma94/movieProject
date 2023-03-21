package Controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import FrontController.Controller;
import Member.MemberDAO;
import Member.MemberVO;

public class AdminMemberUpdateController implements Controller {

	@Override
	public String requestHandler(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		if (request.getParameter("memberId") == null) {
			List<MemberVO> memberList = MemberDAO.getInstance().getAllMember();
			request.setAttribute("memberList", memberList);
			return "adminMemberUpdate";
		}
		String memberId = request.getParameter("memberId");
		MemberVO member = MemberDAO.getInstance().getOneUser(memberId);
		HttpSession session = request.getSession();
		session.setAttribute("member", member);
		return "memberUpdate";
	}

}
