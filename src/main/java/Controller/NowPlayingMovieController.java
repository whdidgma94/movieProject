package Controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import FrontController.Controller;
import Movie.MovieDAO;
import Movie.MovieVO;

public class NowPlayingMovieController implements Controller{

	@Override
	public String requestHandler(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		List<MovieVO> movieList = MovieDAO.getInstance().getNowPlayingMovie();
		request.setAttribute("movieList", movieList);
		return "nowPlayingMovie";
	}

}
