package Member;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import Util.MybatisConfig;

public class MemberDAO {

	private MemberDAO() {
	}

	static private MemberDAO instance = new MemberDAO();

	static public MemberDAO getInstance() {
		return instance;
	}

	public boolean memberLogin(MemberVO memberVO) {
		SqlSession session = MybatisConfig.getInstance().openSession(true);
		String userId = session.selectOne("mapper.member.memberLogin", memberVO);
		session.close();
		if (userId == null) {
			return false;
		}
		return true;
	}

	public void InsertFavoriteGenre(MemberVO member) {
		SqlSession session = MybatisConfig.getInstance().openSession(true);
		session.selectOne("mapper.member.insertGenre", member);
		session.close();
	}
	
	public List<MemberVO> getAllMember(){
		SqlSession session = MybatisConfig.getInstance().openSession(true);
		List<MemberVO> memberList = session.selectList("mapper.member.getAllMember");
		session.close();
		return memberList;
	}

	public boolean checkValidId(String id) {
		SqlSession session = MybatisConfig.getInstance().openSession(true);
		String userId = session.selectOne("mapper.member.validId", id);
		session.close();
		if (userId == null) {
			return true;
		}
		return false;
	}

	public int addMemberVO(MemberVO memberVO) {
		SqlSession session = MybatisConfig.getInstance().openSession(true);
		int cnt = session.insert("mapper.member.memberInsert", memberVO);
		session.close();
		return cnt;
	}

	public MemberVO getOneUser(String id) {
		SqlSession session = MybatisConfig.getInstance().openSession(true);
		MemberVO memberVO = session.selectOne("mapper.member.getOneMember", id);
		session.close();
		return memberVO;
	}

	public int memberUpdate1(MemberVO memberVO) {
		SqlSession session = MybatisConfig.getInstance().openSession(true);
		int cnt = session.update("mapper.member.memberUpdate1", memberVO);
		session.close();
		return cnt;
	}
	public int memberUpdate2(MemberVO memberVO) {
		SqlSession session = MybatisConfig.getInstance().openSession(true);
		int cnt = session.update("mapper.member.memberUpdate2", memberVO);
		session.close();
		return cnt;
	}

	public int deleteMember(int memberNo) {
		SqlSession session = MybatisConfig.getInstance().openSession(true);
		int cnt = session.insert("mapper.member.memberDelete", memberNo);
		session.close();
		return cnt;
	}

}
