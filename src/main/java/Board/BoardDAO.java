package Board;

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
			int cnt = session.insert("mapper.board.boardInsert", boardVO);
			session.close();
			return cnt;
		}	
	
}
