package Board;

import java.util.List;
import org.apache.ibatis.session.SqlSession;
import Util.MybatisConfig;

public class BoardDAO {	
	
	private BoardDAO() {}
		static private BoardDAO instance = new BoardDAO();
		static public BoardDAO getInstance() {
			return instance;
	}
	
		public int addBoard(BoardVO boardVO) {
			SqlSession session = MybatisConfig.getInstance().openSession(true);
			int cnt = session.insert("mapper.board.insertBoard", boardVO);
			session.close();
			return cnt;
		}
		
		public List<BoardVO> getAllBoard() {
			SqlSession session = MybatisConfig.getInstance().openSession(true);
			List<BoardVO> list = session.selectList("mapper.board.getAllBoard");
			session.close();
			return list;
		}
		
		public double getAvgGrade(int movieCd) {
			SqlSession session = MybatisConfig.getInstance().openSession(true);
			double avg = 0;
			if(session.selectOne("mapper.board.getAvgGrade", movieCd)==null) {
				return 0;
			}
			avg = session.selectOne("mapper.board.getAvgGrade", movieCd);
			session.close();
			return avg;
		}
		public List<BoardVO> getMovieCdBoard(int movieCd) {
			SqlSession session = MybatisConfig.getInstance().openSession(true);
			List<BoardVO> list = session.selectList("mapper.board.getMovieCdBoard", movieCd);
			session.close();
			return list;
		}
		public List<BoardVO> getMemberIdBoard(String memberId) {
			SqlSession session = MybatisConfig.getInstance().openSession(true);
			List<BoardVO> list = session.selectList("mapper.board.getMemberBoard", memberId);
			session.close();
			return list;
		}
		public int removeBoard(int reviewNm) {
			SqlSession session = MybatisConfig.getInstance().openSession(true);
			int cnt = session.delete("mapper.board.deleteBoard", reviewNm);
			session.close();
			return cnt;
		}
		public void setDummyData() {
			SqlSession session = MybatisConfig.getInstance().openSession(true);
			session.insert("mapper.board.setDummyData");
			session.close();
		}
	
}
