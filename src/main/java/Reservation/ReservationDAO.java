package Reservation;

import java.util.List;

import org.apache.ibatis.session.SqlSession;

import Util.MybatisConfig;

public class ReservationDAO {
	private ReservationDAO() {
	}

	static private ReservationDAO instance = new ReservationDAO();

	static public ReservationDAO getInstance() {
		return instance;
	}
	public List<ReservationVO> getAllReservation(){
		SqlSession session = MybatisConfig.getInstance().openSession(true);
		List<ReservationVO> list = session.selectList("mapper.reservation.getAllReservation");
		session.close();
		return list;
	}
	public List<ReservationVO> getMemberReservation(String memberId) {
		SqlSession session = MybatisConfig.getInstance().openSession(true);
		List<ReservationVO> list = session.selectList("mapper.reservation.getMemberReservation", memberId);
		session.close();
		return list;
	}

	public ReservationVO getOneReservation(int reserveNo) {
		SqlSession session = MybatisConfig.getInstance().openSession(true);
		ReservationVO resVO = session.selectOne("mapper.reservation.getOneReservation", reserveNo);
		session.close();
		return resVO;
	}
	public void insertReservation(ReservationVO resVO) {
		SqlSession session = MybatisConfig.getInstance().openSession(true);
		session.insert("mapper.reservation.insertReservation", resVO);
		session.close();
	}
	
	public void deleteReservation(int reserveNo) {
		SqlSession session = MybatisConfig.getInstance().openSession(true);
		session.delete("mapper.reservation.deleteReservation", reserveNo);
	}
}
