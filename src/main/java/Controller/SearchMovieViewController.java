package Controller;

import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStreamReader;
import java.io.UnsupportedEncodingException;
import java.net.HttpURLConnection;
import java.net.URL;
import java.net.URLEncoder;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.json.simple.JSONArray;
import org.json.simple.JSONObject;
import org.json.simple.parser.JSONParser;
import org.json.simple.parser.ParseException;

import FrontController.Controller;

public class SearchMovieViewController implements Controller {

	@Override
	public String requestHandler(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		HttpSession session = request.getSession();
		request.setCharacterEncoding("UTF-8");
		String data = request.getParameter("inputVal");
		String clientId = "h0TEopSBA8P6j0SDM4NV";
		String clientSecret = "B5neLh3HSS";
		String text = null;
		try {
			text = URLEncoder.encode(data, "UTF-8");
		} catch (UnsupportedEncodingException e) {
			throw new RuntimeException("검색어 인코딩 실패", e);
		}

		String apiURL = "https://openapi.naver.com/v1/search/movie?query=" + text;

		URL url = new URL(apiURL);
		HttpURLConnection con = (HttpURLConnection) url.openConnection();
		con.setRequestMethod("GET");
		con.setRequestProperty("X-Naver-Client-Id", clientId);
		con.setRequestProperty("X-Naver-Client-Secret", clientSecret);
		int responseCode = con.getResponseCode();
		BufferedReader br;
		if (responseCode == 200) {
			br = new BufferedReader(new InputStreamReader(con.getInputStream()));
		} else {
			br = new BufferedReader(new InputStreamReader(con.getErrorStream()));
		}
		String inputLine;
		StringBuffer rp = new StringBuffer();
		while ((inputLine = br.readLine()) != null) {
			rp.append(inputLine);
		}
		br.close();
		JSONParser jp = new JSONParser();
		JSONObject jb = null;
		try {
			jb = (JSONObject) jp.parse(rp.toString());
		} catch (ParseException e) {
			e.printStackTrace();
		}
		JSONArray searchList = (JSONArray) jb.get("items");
		List<String> imgList = new ArrayList<String>();
		if (searchList.size() == 0) {
			response.getWriter().print("null");
		} else {
			response.getWriter().print("notNull");
		}
		for (int i = 0; i < searchList.size(); i++) {
			JSONObject jo = (JSONObject) searchList.get(i);
			String imageUrl = jo.get("image").toString();
			String fileName = imageUrl.substring(imageUrl.lastIndexOf("/") + 1);
			String[] tmp = fileName.split("_");
			tmp[1]="P100";
			fileName=tmp[0]+"_"+tmp[1]+"_"+tmp[2];
			imageUrl=imageUrl.substring(0,imageUrl.lastIndexOf("/")+1);
			imageUrl+=fileName;
			imgList.add(imageUrl);
		}
		session.setAttribute("imgList", imgList);
		session.setAttribute("searchList", searchList);
		return null;
	}

}
