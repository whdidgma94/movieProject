package Credit;


public class CreditDAO {
	public CreditDAO() {
	}


	static private CreditDAO instance = new CreditDAO();

	static public CreditDAO getInstance() {
		return instance;
	}

}
