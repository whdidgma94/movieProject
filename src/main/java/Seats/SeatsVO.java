package Seats;

public class SeatsVO {
	private int theaterNo;
	private String seatNum;
	private boolean checkSeat;

	public SeatsVO(int theaterNo, String seatNum, boolean checkSeat) {
		super();
		this.theaterNo = theaterNo;
		this.seatNum = seatNum;
		this.checkSeat = checkSeat;
	}

	public int getTheaterNo() {
		return theaterNo;
	}

	public void setTheaterNo(int theaterNo) {
		this.theaterNo = theaterNo;
	}

	public String getSeatNum() {
		return seatNum;
	}

	public void setSeatNum(String seatNum) {
		this.seatNum = seatNum;
	}

	public boolean isCheckSeat() {
		return checkSeat;
	}

	public void setCheckSeat(boolean checkSeat) {
		this.checkSeat = checkSeat;
	}

}
