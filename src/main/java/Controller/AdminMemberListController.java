package Controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import FrontController.Controller;
import Member.MemberDAO;
import Member.MemberVO;

public class AdminMemberListController implements Controller {

	@Override
	public String requestHandler(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		List<MemberVO> memberList = MemberDAO.getInstance().getAllMember();
		request.setAttribute("memberList", memberList);
		return "adminMemberList";
	}

}
