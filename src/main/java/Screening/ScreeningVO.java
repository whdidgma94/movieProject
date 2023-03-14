package Screening;

public class ScreeningVO {
	private int screeningNo;
	private int movieCd;
	private int theaterNo;
	private String startTime;

	public ScreeningVO() {
	}

	public ScreeningVO(int screeningNo, int movieCd, int theaterNo, String startTime) {
		super();
		this.screeningNo = screeningNo;
		this.movieCd = movieCd;
		this.theaterNo = theaterNo;
		this.startTime = startTime;
	}

	public ScreeningVO(int movieCd, int theaterNo, String startTime) {
		super();
		this.movieCd = movieCd;
		this.theaterNo = theaterNo;
		this.startTime = startTime;
	}

	public int getScreeningNo() {
		return screeningNo;
	}

	public void setScreeningNo(int screeningNo) {
		this.screeningNo = screeningNo;
	}

	public int getMovieCd() {
		return movieCd;
	}

	public void setMovieCd(int movieCd) {
		this.movieCd = movieCd;
	}

	public int getTheaterNo() {
		return theaterNo;
	}

	public void setTheaterNo(int theaterNo) {
		this.theaterNo = theaterNo;
	}

	public String getStartTime() {
		return startTime;
	}

	public void setStartTime(String startTime) {
		this.startTime = startTime;
	}

}
