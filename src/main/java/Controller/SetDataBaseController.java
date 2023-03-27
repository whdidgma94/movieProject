package Controller;

import java.io.IOException;
import java.util.HashMap;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import Board.BoardDAO;
import Board.BoardVO;
import Credit.CreditDAO;
import Credit.CreditVO;
import FrontController.Controller;
import Member.MemberDAO;
import Movie.GenreDAO;
import Movie.GenreVO;
import Movie.MovieDAO;
import Movie.MovieVO;
import Notice.NoticeDAO;
import Util.Util;

public class SetDataBaseController implements Controller {

	@Override
	public String requestHandler(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");

		setGenreDb();
		for (int i = 1; i < 3; i++) {
			setMovieDb(i);
		}
		setDummyData();
		setBoardDb();
		return null;
	}

	public void setMovieDb(int pagenum) {
		MovieDAO mdao = MovieDAO.getInstance();

		String[] subjects = { "now_playing", "popular", "top_rated", "upcoming" };

		for (int j = 0; j < subjects.length; j++) {
			List<HashMap<String, Object>> movieList = Util.getInstance().getMovieList(subjects[j], pagenum + "");

			for (int i = 0; i < movieList.size(); i++) {
				MovieVO vo = new MovieVO();
				int movieCd = Integer.parseInt(movieList.get(i).get("movieCd").toString());
				vo.setMovieCd(movieCd);
				setCreditDb(movieCd);
				vo.setMovieNm(movieList.get(i).get("movieNm").toString());
				String genreNm = movieList.get(i).get("genreNm").toString();
				genreNm = genreNm.replace("[", "").replace("]", "").trim();
				if (!genreNm.equals("")) {
					String[] genres = genreNm.split(",");
					genreNm = "";
					for (int k = 0; k < genres.length; k++) {
						genreNm += GenreDAO.getInstance().getGenreName(Integer.parseInt(genres[k]));
						if (k != genres.length - 1)
							genreNm += ",";
					}
				} else {
					genreNm = " ";
				}
				vo.setGenreNm(genreNm);
				vo.setOpenDt(movieList.get(i).get("openDt").toString());
				vo.setSubject(movieList.get(i).get("subject").toString());
				vo.setGrade(0);
				vo.setAdult((boolean) movieList.get(i).get("adult"));
				vo.setPoster_path(movieList.get(i).get("poster_path").toString());
				vo.setBackdrop_path(movieList.get(i).get("backdrop_path").toString());
				vo.setOverview(movieList.get(i).get("overview").toString());
				if (mdao.getOneMovie(vo.getMovieCd()) == null) {
					mdao.insertMovie(vo);
				}
			}
		}
	}

	public void setGenreDb() {
		GenreDAO gdao = GenreDAO.getInstance();
		List<GenreVO> genreList = Util.getInstance().getGenreList();
		for (GenreVO g : genreList) {
			gdao.insertGenre(g);
		}
	}

	public void setCreditDb(int movieCd) {
		CreditDAO cdao = CreditDAO.getInstance();
		List<CreditVO> creditList = Util.getInstance().getCreditList(movieCd);
		for (CreditVO c : creditList) {
			if (cdao.getOneCredit(c.getId()) == null) {
				cdao.insertCredit(c);
			}
		}
	}

	public void setBoardDb() {
		List<BoardVO> list = BoardDAO.getInstance().getAllBoard();
		for (BoardVO b : list) {
			MovieVO m = MovieDAO.getInstance().getOneMovie(b.getMovieCd());
			m.setGrade(BoardDAO.getInstance().getAvgGrade(m.getMovieCd()));
			MovieDAO.getInstance().updateMovie(m);
		}
	}

	public void setDummyData() {
		MemberDAO.getInstance().setDummyData();
		NoticeDAO.getInstance().setDummyData();
		BoardDAO.getInstance().setDummyData();
	}
}