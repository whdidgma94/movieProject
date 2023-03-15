package Controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;


import org.json.simple.JSONObject;
import org.json.simple.parser.JSONParser;

import FrontController.Controller;

public class SetDataBaseController implements Controller {

	@Override
	public String requestHandler(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		String movieList = request.getParameter("movieList"); // jsonString 타입
		System.out.println(movieList);
		try {
			JSONParser jp = new JSONParser(); 
			JSONObject jb = (JSONObject) jp.parse(movieList); 
			

			}catch(Exception e) {
				e.printStackTrace();
			}

		return null;
	}

}
