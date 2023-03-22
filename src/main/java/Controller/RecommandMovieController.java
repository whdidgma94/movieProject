package Controller;

import java.io.IOException;
import java.util.HashSet;
import java.util.LinkedHashMap;
import java.util.List;
import java.util.Set;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import FrontController.Controller;
import Member.MemberDAO;
import Member.MemberVO;
import Movie.MovieDAO;
import Movie.MovieVO;

public class RecommandMovieController implements Controller {

	@Override
	public String requestHandler(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		HttpSession session = request.getSession();
		String log = (String) session.getAttribute("log");
		MemberVO mvo = MemberDAO.getInstance().getOneUser(log);
		String genre = mvo.getFavoriteGenre();

		if (genre.contains("기타")) {
			genre = genre.replace("기타", "");
			if (genre.length() == 0) {
				request.setAttribute("genreMap", null);
				return "recommandMovie";
			} else {
				genre = genre.substring(0, genre.length() - 1);
			}
		}

		List<String> list = MovieDAO.getInstance().getGenreList();
		Set<String> genreSet = new HashSet<String>();
		for (String g : list) {
			String tmp[] = g.split(",");
			for (int i = 0; i < tmp.length; i++) {
				genreSet.add(tmp[i]);
			}
		}
		String[] genres = null;
		LinkedHashMap<String, MovieVO> genreMap = new LinkedHashMap<String, MovieVO>();
		if (genre.contains(",")) {
			genres = genre.split(",");
		} else {
			genres = new String[1];
			genres[0] = genre;
		}
		for (String g : genres) {
			if (genreSet.contains(g)) {
				List<MovieVO> lists = MovieDAO.getInstance().genreMovieList(g);
				for (MovieVO vo : lists) {
					if (vo.getGenreNm().contains(g)) {
						if (!genreMap.containsValue(vo)) {
							genreMap.put(vo.getGenreNm(), vo);
						}
					}
				}
			}
		}
		request.setAttribute("genreMap", genreMap);
		return "recommandMovie";
	}
}
