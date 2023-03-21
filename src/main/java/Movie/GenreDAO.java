package Movie;

import org.apache.ibatis.session.SqlSession;

import Util.MybatisConfig;

public class GenreDAO {
	private GenreDAO() {
	}

	static private GenreDAO instance = new GenreDAO();

	static public GenreDAO getInstance() {
		return instance;
	}
	
	public void insertGenre(GenreVO genreVO) {
		SqlSession session = MybatisConfig.getInstance().openSession(true);
		session.insert("mapper.genre.insertGenre", genreVO);
		session.close();
	}
	
	public String getGenreName(int id) {
		SqlSession session = MybatisConfig.getInstance().openSession(true);
		String genreName = session.selectOne("mapper.genre.getGenreName", id);
		session.close();
		return genreName;
	}
}
