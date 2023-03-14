package Seats;

import java.util.ArrayList;
import java.util.List;

import org.apache.ibatis.session.SqlSession;

import Util.MybatisConfig;

public class SeatsDAO {
	public ArrayList<SeatsVO> getAllSeats() {
		SqlSession session = MybatisConfig.getInstance().openSession(true);
		ArrayList<SeatsVO> list = session.selectOne("mapper.seats.getAllSeats");
		return list;
	}

	public List<SeatsVO> getValidSeats() {
		SqlSession session = MybatisConfig.getInstance().openSession(true);
		List<SeatsVO> list = session.selectList("mapper.theater.getOneTheater");
		session.close();
		return list;
	}

	public SeatsVO getOneSeats(String seatNum) {
		SqlSession session = MybatisConfig.getInstance().openSession(true);
		SeatsVO seatsVO = session.selectOne("mapper.theater.getOneTheater", seatNum);
		session.close();
		return seatsVO;
	}
	
	
}
