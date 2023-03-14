package Theater;

import java.util.List;

import org.apache.ibatis.session.SqlSession;

import Util.MybatisConfig;

public class TheaterDAO {
	private TheaterDAO() {
	}

	static private TheaterDAO instance = new TheaterDAO();

	static public TheaterDAO getInstance() {
		return instance;
	}
	public List<TheaterVO> getAllTheater(){
		SqlSession session = MybatisConfig.getInstance().openSession(true);
		List<TheaterVO> list = session.selectList("mapper.theater.getAllTheater");
		session.close();
		return list;
	}
	public List<TheaterVO> getOneTheater(int theaterNo) {
		SqlSession session = MybatisConfig.getInstance().openSession(true);
		List<TheaterVO> list = session.selectList("mapper.theater.getOneTheater", theaterNo);
		session.close();
		return list;
	}

	public int checkSeatCnt(int theaterNo) {
		SqlSession session = MybatisConfig.getInstance().openSession(true);
		int cnt = session.update("mapper.theater.checkSeatCnt", theaterNo);
		session.close();
		return cnt;
	}
	public void updateTheater(int theaterNo) {
		SqlSession session = MybatisConfig.getInstance().openSession(true);
		session.update("mapper.theater.updateTheater", theaterNo);
		session.close();
	}

}
