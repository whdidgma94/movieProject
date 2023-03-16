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
	
}
