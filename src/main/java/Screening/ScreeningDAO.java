package Screening;

import java.util.List;

import org.apache.ibatis.session.SqlSession;

import Screening.ScreeningDAO;
import Util.MybatisConfig;

public class ScreeningDAO {
	private ScreeningDAO() {
	}

	static private ScreeningDAO instance = new ScreeningDAO();

	static public ScreeningDAO getInstance() {
		return instance;
	}
	public List<ScreeningVO> getAllScreening(){
		SqlSession session = MybatisConfig.getInstance().openSession(true);
		List<ScreeningVO> list = session.selectList("mapper.screening.getAllScreening");
		session.close();
		return list;
	}
	public List<ScreeningVO> getTheaterScreening(){
		SqlSession session = MybatisConfig.getInstance().openSession(true);
		List<ScreeningVO> list = session.selectList("mapper.screening.getTheaterScreening");
		session.close();
		return list;
	}
	public List<ScreeningVO> getMovieScreening(){
		SqlSession session = MybatisConfig.getInstance().openSession(true);
		List<ScreeningVO> list = session.selectList("mapper.screening.getMovieScreening");
		session.close();
		return list;
	}

	public ScreeningVO getOneScreening(int screeningNo) {
		SqlSession session = MybatisConfig.getInstance().openSession(true);
		ScreeningVO screeningVO = session.selectOne("mapper.screening.getOneScreening", screeningNo);
		session.close();
		return screeningVO;
	}
	public void insertScreening(ScreeningVO screeningVO) {
		SqlSession session = MybatisConfig.getInstance().openSession(true);
		session.insert("mapper.screening.insertScreening", screeningVO);
		session.close();
	}
	
	public void deleteScreening(int screeningNo) {
		SqlSession session = MybatisConfig.getInstance().openSession(true);
		session.delete("mapper.Screening.deleteScreening", screeningNo);
	}
}
