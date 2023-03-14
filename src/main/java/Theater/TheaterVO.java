package Theater;

public class TheaterVO {
	private int theaterNo;
	private String theaterName;
	private String theaterLocation;
	private int seatCnt;

	public TheaterVO() {
	}

	public TheaterVO(int theaterNo, String theaterName, String theaterLocation, int seatCnt) {
		super();
		this.theaterNo = theaterNo;
		this.theaterName = theaterName;
		this.theaterLocation = theaterLocation;
		this.seatCnt = seatCnt;
	}

	public TheaterVO(String theaterName, String theaterLocation, int seatCnt) {
		super();
		this.theaterName = theaterName;
		this.theaterLocation = theaterLocation;
		this.seatCnt = seatCnt;
	}

	public int getTheaterNo() {
		return theaterNo;
	}

	public void setTheaterNo(int theaterNo) {
		this.theaterNo = theaterNo;
	}

	public String getTheaterName() {
		return theaterName;
	}

	public void setTheaterName(String theaterName) {
		this.theaterName = theaterName;
	}

	public String getTheaterLocation() {
		return theaterLocation;
	}

	public void setTheaterLocation(String theaterLocation) {
		this.theaterLocation = theaterLocation;
	}

	public int getSeatCnt() {
		return seatCnt;
	}

	public void setSeatCnt(int seatCnt) {
		this.seatCnt = seatCnt;
	}

}
