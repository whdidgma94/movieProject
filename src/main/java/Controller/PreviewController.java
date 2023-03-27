package Controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import FrontController.Controller;
import Util.Util;

public class PreviewController implements Controller {

	@Override
	public String requestHandler(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		int movieCd = Integer.parseInt(request.getParameter("movieCd"));
		String videoKey = Util.getInstance().getVideoKey(movieCd);
		response.getWriter().print(videoKey);
		return null;
	}

}
