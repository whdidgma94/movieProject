package Credit;

import org.apache.ibatis.session.SqlSession;

import Util.MybatisConfig;

public class CreditDAO {
	public CreditDAO() {
	}


	static private CreditDAO instance = new CreditDAO();

	static public CreditDAO getInstance() {
		return instance;
	}
	
	public void insertCredit(CreditVO creditVO) {
		SqlSession session = MybatisConfig.getInstance().openSession(true);
		session.insert("mapper.credit.insertCredit", creditVO);
		session.close();
	}
	
	public CreditVO getOneCredit(int id) {
		SqlSession session = MybatisConfig.getInstance().openSession(true);
		CreditVO resVo = session.selectOne("mapper.credit.getOneCredit",id);
		session.close();
		return resVo;
	}

}
