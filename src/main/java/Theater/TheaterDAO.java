package Theater;

import java.util.ArrayList;

import org.apache.ibatis.session.SqlSession;

import Util.MybatisConfig;

public class TheaterDAO {
	private TheaterDAO() {
	}

	static private TheaterDAO instance = new TheaterDAO();

	static public TheaterDAO getInstance() {
		return instance;
	}
	public ArrayList<TheaterVO> getTheaterList(){
		SqlSession session = MybatisConfig.getInstance().openSession(true);
		ArrayList<TheaterVO> list = session.selectOne("mapper.theater.getTheaterList");
		
		return list;
	}
	public TheaterVO getOneUser(int theaterNo) {
		SqlSession session = MybatisConfig.getInstance().openSession(true);
		TheaterVO theaterVO = session.selectOne("mapper.theater.getOneTheater", theaterNo);
		session.close();
		return theaterVO;
	}

	public int updateTheater(TheaterVO theaterVO) {
		SqlSession session = MybatisConfig.getInstance().openSession(true);
		int cnt = session.update("mapper.member.memberUpdate", theaterVO);
		session.close();
		return cnt;
	}

}
