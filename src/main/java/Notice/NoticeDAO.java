package Notice;

import java.util.List;

import org.apache.ibatis.session.SqlSession;

import Util.MybatisConfig;

public class NoticeDAO {

	private NoticeDAO() {}
	static private NoticeDAO instance = new NoticeDAO();
	static public NoticeDAO getInstance() {
		return instance;
	}
	
	public void addNotice(NoticeVO notice) {
		SqlSession session = MybatisConfig.getInstance().openSession(true);
		session.insert("mapper.notice.insertNotice", notice);
		session.close();
		System.out.println("DAO");
	}
	public List<NoticeVO> getAllNotice(){
		SqlSession session = MybatisConfig.getInstance().openSession(true);
		List<NoticeVO> list = session.selectList("mapper.notice.getAllNotice");
		session.close();
		return list;
	}
}
