package Board;

public class BoardVO {
	private int boardNo;
	private String writerId;
	private int movieCd;
	private int grade;
	private String contents;

	public BoardVO() {
	}

	public BoardVO(int boardNo, String writerId, int movieCd, int grade, String contents) {
		super();
		this.boardNo = boardNo;
		this.writerId = writerId;
		this.movieCd = movieCd;
		this.grade = grade;
		this.contents = contents;
	}

	public BoardVO(String writerId, int movieCd, int grade, String contents) {
		super();
		this.writerId = writerId;
		this.movieCd = movieCd;
		this.grade = grade;
		this.contents = contents;
	}

	public int getBoardNo() {
		return boardNo;
	}

	public void setBoardNo(int boardNo) {
		this.boardNo = boardNo;
	}

	public String getWriterId() {
		return writerId;
	}

	public void setWriterId(String writerId) {
		this.writerId = writerId;
	}

	public int getMovieCd() {
		return movieCd;
	}

	public void setMovieCd(int movieCd) {
		this.movieCd = movieCd;
	}

	public int getGrade() {
		return grade;
	}

	public void setGrade(int grade) {
		this.grade = grade;
	}

	public String getContents() {
		return contents;
	}

	public void setContents(String contents) {
		this.contents = contents;
	}

}
