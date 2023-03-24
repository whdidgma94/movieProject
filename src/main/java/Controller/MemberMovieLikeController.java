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
		String id = (String)session.getAttribute("log");		
		int movieCd = Integer.parseInt(request.getParameter("movieCd"));
		MemberPickVO vo = MemberPickDAO.getInstance().getMemberPick(id);
		if (vo == null) {
			vo = new MemberPickVO();
			vo.setMemberId(id);
			vo.setMovieLike(""+movieCd);
			MemberPickDAO.getInstance().addMemberPickLike(vo);
			return null;
		}
		if(vo.getMovieLike() == null) {
			vo.setMovieLike(""+movieCd);
			MemberPickDAO.getInstance().updateMemberPickLike(vo);
			return null;
		}
		String[] likeList = vo.getMovieLike().split(",");
		int idx = -1;
		for(int i = 0 ; i < likeList.length ; i++) {
			if(likeList[i].equals(movieCd+"")) {
				idx=i;
				break;
			}
		}
		if(idx==-1) {
			String movieLike="";
			if(vo.getMovieLike().length()==0) {
				movieLike = ""+movieCd;
			}else {
				movieLike = vo.getMovieLike()+","+movieCd;
			}
			vo.setMovieLike(movieLike);
			MemberPickDAO.getInstance().updateMemberPickLike(vo);			
		}else {
			String movieLike="";
			for(int i = 0 ; i < likeList.length ; i++) {
				if(i!=idx) {
					movieLike+=likeList[i];
				}
				if(i!=likeList.length-1&&i!=likeList.length-2) {
					movieLike+=",";
				}
			}
			vo.setMovieLike(movieLike);
			MemberPickDAO.getInstance().updateMemberPickLike(vo);
		}
		return null;
	}

}