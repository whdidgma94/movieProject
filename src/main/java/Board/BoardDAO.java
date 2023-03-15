package Board;

public class BoardDAO {

	private BoardDAO() {}
		static private BoardDAO instance = new BoardDAO();
		static public BoardDAO getInstance() {
			return instance;
		}
		
}
