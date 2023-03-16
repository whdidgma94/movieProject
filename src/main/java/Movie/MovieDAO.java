package Movie;

import java.util.List;

import org.apache.ibatis.session.SqlSession;

import Movie.MovieDAO;
import Util.MybatisConfig;

public class MovieDAO {

	private MovieDAO() {
	}

	static private MovieDAO instance = new MovieDAO();

	static public MovieDAO getInstance() {
		return instance;
	}

	public List<MovieVO> getAllMovie() {
		SqlSession session = MybatisConfig.getInstance().openSession(true);
		List<MovieVO> list = session.selectList("mapper.movie.getAllMovie");
		session.close();
		return list;
	}

	public List<MovieVO> getSearchMovie(String inputVal) {
		SqlSession session = MybatisConfig.getInstance().openSession(true);
		List<MovieVO> list = session.selectList("mapper.movie.getSearchMovie", inputVal);
		session.close();
		return list;
	}

	public MovieVO getOneMovie(int movieCd) {
		SqlSession session = MybatisConfig.getInstance().openSession(true);
		MovieVO resVO = session.selectOne("mapper.movie.getOneMovie", movieCd);
		session.close();
		return resVO;
	}

	public List<MovieVO> movieRankList() {
		SqlSession session = MybatisConfig.getInstance().openSession(true);
		List<MovieVO> list = session.selectList("mapper.movie.movieRankList");
		session.close();
		return list;
	}
	
	public List<MovieVO> genreMovieList(String genreNm) {
		SqlSession session = MybatisConfig.getInstance().openSession(true);
		List<MovieVO> list = session.selectList("mapper.movie.genreMovieList", genreNm);
		session.close();
		return list;
	}
	
	public List<String> getGenreList() {
		SqlSession session = MybatisConfig.getInstance().openSession(true);
		List<String> list = session.selectList("mapper.movie.getGenreList");
		session.close();
		return list;
	}

	public void insertMovie(MovieVO movieVO) {
		SqlSession session = MybatisConfig.getInstance().openSession(true);
		session.insert("mapper.movie.insertMovie", movieVO);
		session.close();
	}

	public void deleteMovie(int movieCd) {
		SqlSession session = MybatisConfig.getInstance().openSession(true);
		session.delete("mapper.movie.deleteMovie", movieCd);
		session.close();
	}

}
