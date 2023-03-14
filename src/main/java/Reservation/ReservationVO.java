package Reservation;

public class ReservationVO {
	private int reserveNo;
	private String memberId;
	private int screeningNo;
	private String[] seatNumber;

	public ReservationVO() {
	}

	public ReservationVO(int reserveNo, String memberId, int screeningNo, String[] seatNumber) {
		super();
		this.reserveNo = reserveNo;
		this.memberId = memberId;
		this.screeningNo = screeningNo;
		this.seatNumber = seatNumber;
	}

	public ReservationVO(String memberId, int screeningNo, String[] seatNumber) {
		super();
		this.memberId = memberId;
		this.screeningNo = screeningNo;
		this.seatNumber = seatNumber;
	}

	public int getReserveNo() {
		return reserveNo;
	}

	public void setReserveNo(int reserveNo) {
		this.reserveNo = reserveNo;
	}

	public String getMemberId() {
		return memberId;
	}

	public void setMemberId(String memberId) {
		this.memberId = memberId;
	}

	public int getScreeningNo() {
		return screeningNo;
	}

	public void setScreeningNo(int screeningNo) {
		this.screeningNo = screeningNo;
	}

	public String[] getSeatNumber() {
		return seatNumber;
	}

	public void setSeatNumber(String[] seatNumber) {
		this.seatNumber = seatNumber;
	}

}
