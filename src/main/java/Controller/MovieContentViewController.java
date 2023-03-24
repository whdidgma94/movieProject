package Controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import FrontController.Controller;
import Member.MemberPickDAO;
import Member.MemberPickVO;
import Movie.MovieDAO;
import Movie.MovieVO;
import Util.Util;

public class MovieContentViewController implements Controller {

	@Override
	public String requestHandler(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		int movieCd = Integer.parseInt(request.getParameter("movieCd"));
		List<String> imageList = Util.getInstance().getMovieImageList(movieCd);
		MovieVO vo = MovieDAO.getInstance().getOneMovie(movieCd);
		HttpSession session = request.getSession();
		String id = (String) session.getAttribute("log");
		MemberPickVO memberPickVO = MemberPickDAO.getInstance().getMemberPick(id);
		request.setAttribute("like", true);
		request.setAttribute("seen", true);	
		if(memberPickVO != null){
			if(memberPickVO.getMovieLike()!=null) {
				boolean like = memberPickVO.getMovieLike().contains(movieCd+"");
				request.setAttribute("like", !like);
			}
			if(memberPickVO.getMovieSeen()!=null) {
				boolean seen = memberPickVO.getMovieSeen().contains(movieCd+"");
				request.setAttribute("seen", !seen);
			}			
		}
		request.setAttribute("vo", vo);
		request.setAttribute("imageList", imageList);
		return "movieContentView";
	}

}
