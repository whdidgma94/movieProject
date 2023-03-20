package Controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import FrontController.Controller;
import Movie.MovieDAO;

public class MovieContentController implements Controller {

	@Override
	public String requestHandler(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		int movieCd = 0;
		if (request.getParameter("movieCd") != null) {
			movieCd = Integer.parseInt((String) request.getParameter("movieCd"));
		} 

		request.setAttribute("vo", MovieDAO.getInstance().getOneMovie(movieCd));
		return "movieContent";
	}

}
