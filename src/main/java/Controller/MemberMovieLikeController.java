package Controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import FrontController.Controller;

import Member.MemberPickDAO;
import Member.MemberPickVO;

public class MemberMovieLikeController implements Controller {

	@Override
	public String requestHandler(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		HttpSession session = request.getSession();
		String id = (String) session.getAttribute("log");
		int movieCd = 123;
		// int movieCd = Integer.parseInt((String)request.getAttribute("movieCd"));
		MemberPickVO vo = MemberPickDAO.getInstance().getMemberPick(id);
		if (vo == null) {
			vo = new MemberPickVO();
			vo.setMemberId("123");
			vo.setMovieLike("" + movieCd);
			MemberPickDAO.getInstance().addMemberPickLike(vo);
			return null;
		}

		return null;
	}

}