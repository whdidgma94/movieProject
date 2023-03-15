package Member;

import org.apache.ibatis.session.SqlSession;
import Util.MybatisConfig;


public class MemberDAO {
	
	private MemberDAO() {}
	static private MemberDAO instance = new MemberDAO();
	static public MemberDAO getInstance() {
		return instance;
	}
	public boolean memberLogin(MemberVO memberVO) {	
		   SqlSession session= MybatisConfig.getInstance().openSession(true);
		   String userId=session.selectOne("mapper.member.memberLogin", memberVO);
		   session.close();
		   if(userId==null) {
			   return false;
		   }
		   return true;
	   }
	   
	   public boolean checkValidId(String id) {
		   SqlSession session= MybatisConfig.getInstance().openSession(true);
		   String userId=session.selectOne("mapper.member.validId", id);
		   session.close();
		   if(userId==null) {
			   return true;
		   }
		   return false;
	   }
	      
	   public int addMemberVO(MemberVO memberVO) {
		   SqlSession session= MybatisConfig.getInstance().openSession(true);
		   int cnt=session.insert("mapper.member.memberInsert", memberVO);
		   session.close();
		   return cnt;
	   }
	   
	   public MemberVO getOneUser(String id) {
		   SqlSession session= MybatisConfig.getInstance().openSession(true);
		   MemberVO memberVO = session.selectOne("mapper.member.getOneMember",id);
		   session.close();
		   return memberVO;
	   }

	   
	   public int userUpdate(MemberVO memberVO) {
		   SqlSession session= MybatisConfig.getInstance().openSession(true);
		   int cnt= session.update("mapper.member.memberUpdate",memberVO);
		   session.close();
		   return cnt;
	   }
	   
	   public int removeUser(String id) {
		   SqlSession session= MybatisConfig.getInstance().openSession(true);
		   int cnt=session.insert("mapper.user.memberDelete", id);
		   session.close();
		   return cnt;
	   }
}
