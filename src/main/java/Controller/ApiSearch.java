package Controller;

//네이버 검색 API 예제 - 블로그 검색
import java.io.*;
import java.net.HttpURLConnection;
import java.net.URL;
import java.net.URLEncoder;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.json.simple.JSONArray;
import org.json.simple.JSONObject;
import org.json.simple.parser.JSONParser;
import org.json.simple.parser.ParseException;


import FrontController.Controller;

public class ApiSearch implements Controller {

	@Override
	public String requestHandler(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		String data = request.getParameter("data");
		String clientId = "h0TEopSBA8P6j0SDM4NV"; // 애플리케이션 클라이언트 아이디
		String clientSecret = "B5neLh3HSS"; // 애플리케이션 클라이언트 시크릿
		String text = null;
		try {
			text = URLEncoder.encode(data, "UTF-8");
		} catch (UnsupportedEncodingException e) {
			throw new RuntimeException("검색어 인코딩 실패", e);
		}

		String apiURL = "https://openapi.naver.com/v1/search/movie?query=" + text; // JSON 결과

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
		JSONObject jb=null;
		try {
			jb = (JSONObject) jp.parse(rp.toString());
		} catch (ParseException e) {
			e.printStackTrace();
		}
		JSONArray infoArray = (JSONArray) jb.get("items");
		for(int i=0;i<infoArray.size();i++) {
			JSONObject itemObject = (JSONObject) infoArray.get(i);
			System.out.println(itemObject.get("image"));
			request.setAttribute("info", itemObject.get("image"));
		}
		return null;
	}
}