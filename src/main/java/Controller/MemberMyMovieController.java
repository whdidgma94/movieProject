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

public class MemberMyMovieController implements Controller{

	@Override
	public String requestHandler(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		HttpSession session = request.getSession();
		String id = (String)session.getAttribute("log");
		MemberPickVO vo = MemberPickDAO.getInstance().getMemberPick(id); 
		if(vo!=null) {
			if(vo.getMovieLike()!=null) {
				String[] likeList = vo.getMovieLike().split(",");
				request.setAttribute("likeList", likeList);				
			}
			if(vo.getMovieSeen()!=null) {
				String[] seenList = vo.getMovieSeen().split(",");
				request.setAttribute("seenList", seenList);				
			}
		}
		List<MovieVO> movieList = MovieDAO.getInstance().getAllMovie();
		request.setAttribute("movieList", movieList);
		return "memberMyMovie";
	}

}
