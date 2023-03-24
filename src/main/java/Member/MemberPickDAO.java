package Member;

import org.apache.ibatis.session.SqlSession;
import Util.MybatisConfig;

public class MemberPickDAO {
	
	private MemberPickDAO() {
	}

	static private MemberPickDAO instance = new MemberPickDAO();

	static public MemberPickDAO getInstance() {
		return instance;
	}
	
	public MemberPickVO getMemberPick(String id) {
		SqlSession session = MybatisConfig.getInstance().openSession(true);
		MemberPickVO resVo = session.selectOne("mapper.memberPick.getOneMemberPick", id);
		session.close();
		return resVo;
	}

	public void addMemberPickLike(MemberPickVO vo) {
		SqlSession session = MybatisConfig.getInstance().openSession(true);
		session.selectOne("mapper.memberPick.addMemberPickLike", vo);
		session.close();
	}
	public void addMemberPickSeen(MemberPickVO vo) {
		SqlSession session = MybatisConfig.getInstance().openSession(true);
		session.selectOne("mapper.memberPick.addMemberPickSeen", vo);
		session.close();
	}

	public void updateMemberPickLike(MemberPickVO vo) {
		SqlSession session = MybatisConfig.getInstance().openSession(true);
		session.selectOne("mapper.memberPick.updateMemberPickLike", vo);
		session.close();	
	}
	public void updateMemberPickSeen(MemberPickVO vo) {
		SqlSession session = MybatisConfig.getInstance().openSession(true);
		session.selectOne("mapper.memberPick.updateMemberPickSeen", vo);
		session.close();	
	}
}
