package Controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import FrontController.Controller;
import Member.MemberDAO;
import Member.MemberVO;

public class MemberGenreSelectController implements Controller{

	@Override
	public String requestHandler(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		if(request.getParameter("genre")==null) {
			return "memberSelectFavoriteGenre";
		}
		HttpSession session = request.getSession();	
		String id = (String) session.getAttribute("log");
		String[] genreList = request.getParameterValues("genre");
		String genre = "";
		for(String gen:genreList) {
			genre+=gen+",";
		}
		MemberVO member = MemberDAO.getInstance().getOneUser(id);
		member.setFavoriteGenre(genre.substring(0,genre.length()-1));
		MemberDAO.getInstance().InsertFavoriteGenre(member);
		String ctx = request.getContextPath();
		return "redirect:"+ctx+"/memberMyPage.do";
	}
	
}
