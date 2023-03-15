package Controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import FrontController.Controller;

public class MemberGenreSelectController implements Controller{

	@Override
	public String requestHandler(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		if(request.getParameter("genre")==null) {
			return "memberSelectFavoriteGenre";
		}
		String[] genre = request.getParameterValues("genre");
		for(String gen:genre) {
			System.out.println(gen);
		}
		return null;
	}
	
}
