package Controller;

import java.io.BufferedReader;
import java.io.InputStreamReader;
import java.net.HttpURLConnection;
import java.net.URL;

import org.json.simple.JSONArray;
import org.json.simple.JSONObject;
import org.json.simple.parser.JSONParser;

import Movie.GenreDAO;
import Movie.GenreVO;

public class SetGenreController {
	public void setGenreDb() {

		String apiUrl = "https://api.themoviedb.org/3/genre/movie/list?api_key=a699dda4efd374eb3d9a01da4dacc267&language=ko-KR";
		try {
			URL url = new URL(apiUrl);
			HttpURLConnection conn = (HttpURLConnection) url.openConnection();
			conn.setRequestMethod("GET");
			conn.setRequestProperty("Accept", "application/json");

			if (conn.getResponseCode() != 200) {
				throw new RuntimeException("Failed : HTTP error code : " + conn.getResponseCode());
			}

			BufferedReader br = new BufferedReader(new InputStreamReader((conn.getInputStream())));
			StringBuilder sb = new StringBuilder();
			String output;
			while ((output = br.readLine()) != null) {
				sb.append(output);
			}

			JSONParser parser = new JSONParser();
			JSONObject jb = (JSONObject) parser.parse(sb.toString());
			JSONArray genresArr = (JSONArray) jb.get("genres");
			for (Object obj : genresArr) {
				JSONObject genreObj = (JSONObject) obj;
				String name = (String) genreObj.get("name");
				Long id = (Long) genreObj.get("id");
				GenreVO g = new GenreVO();
				g.setGenreId(Integer.parseInt(id+""));
				g.setGenreName(name);
				GenreDAO.getInstance().insertGenre(g);
			}

			conn.disconnect();

		} catch (Exception e) {
			e.printStackTrace();
		}

	}

}
