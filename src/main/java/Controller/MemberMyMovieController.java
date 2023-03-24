package Controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import FrontController.Controller;
import Member.MemberPickDAO;
import Member.MemberPickVO;

public class MemberMyMovieController implements Controller{

	@Override
	public String requestHandler(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		HttpSession session = request.getSession();
		String id = (String)session.getAttribute("log");
		MemberPickVO vo = MemberPickDAO.getInstance().getMemberPick(id); 
		if(vo!=null) {
			String[] likeList = vo.getMovieLike().split(",");
			String[] seenList = vo.getMovieSeen().split(",");
			request.setAttribute("likeList", likeList);
			request.setAttribute("seenList", seenList);
		}
		return "memberMyMovie";
	}

}
