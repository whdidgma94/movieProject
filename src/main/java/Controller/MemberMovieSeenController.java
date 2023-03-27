package Controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import FrontController.Controller;
import Member.MemberPickDAO;
import Member.MemberPickVO;

public class MemberMovieSeenController implements Controller {

	@Override
	public String requestHandler(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		HttpSession session = request.getSession();
		String id = (String)session.getAttribute("log");		
		int movieCd = Integer.parseInt(request.getParameter("movieCd"));
		MemberPickVO vo = MemberPickDAO.getInstance().getMemberPick(id);
		if (vo == null) {
			vo = new MemberPickVO();
			vo.setMemberId(id);
			vo.setMovieSeen(""+movieCd);
			MemberPickDAO.getInstance().addMemberPickSeen(vo);
			return null;
		}
		if(vo.getMovieSeen() == null) {
			vo.setMovieSeen(""+movieCd);
			MemberPickDAO.getInstance().updateMemberPickSeen(vo);
			return null;
		}
		String[] seenList = vo.getMovieSeen().split(",");
		int idx = -1;
		for(int i = 0 ; i < seenList.length ; i++) {
			if(seenList[i].equals(movieCd+"")) {
				idx=i;
				break;
			}
		}
		if(idx==-1) {
			String movieSeen="";
			if(vo.getMovieSeen().length()==0) {
				movieSeen = ""+movieCd;
			}else {
				movieSeen = vo.getMovieSeen()+","+movieCd;
			}
			vo.setMovieSeen(movieSeen);
			MemberPickDAO.getInstance().updateMemberPickSeen(vo);			
		}else {
			String movieSeen="";
			for(int i = 0 ; i < seenList.length ; i++) {
				if(i!=idx) {
					movieSeen+=seenList[i];
				}
				if(i!=seenList.length-1&&i!=seenList.length-2) {
					movieSeen+=",";
				}
			}
			vo.setMovieSeen(movieSeen);
			MemberPickDAO.getInstance().updateMemberPickSeen(vo);
		}
		return null;
	}

}