package Controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import FrontController.Controller;
import Movie.MovieDAO;
import Movie.MovieVO;

public class SearchMovieViewController implements Controller {

	@Override
	public String requestHandler(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		String inputVal = request.getParameter("inputVal");
		List<MovieVO> searchList = MovieDAO.getInstance().getSearchMovie(inputVal);
		HttpSession session = request.getSession();
		session.setAttribute("searchList", searchList);
		if(searchList.size()==0) {
			response.getWriter().print("null");
		}else {
			response.getWriter().print("notNull");
		}
		return null;
	}

}
