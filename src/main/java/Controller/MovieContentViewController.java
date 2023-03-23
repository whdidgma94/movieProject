package Controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import FrontController.Controller;
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
		request.setAttribute("vo", vo);
		request.setAttribute("imageList", imageList);
		return "movieContentView";
	}

}
