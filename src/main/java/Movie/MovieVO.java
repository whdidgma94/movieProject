package Movie;

public class MovieVO {
	private int movieCd;
	private String movieNm;
	private String genreNm;
	private String watchGradeNm;
	private String openDt;
	private String director;
	private String[] actor;
	private int showTm;
	private double grade;
	private int audiCnt;
	private String movieInfo;

	public MovieVO() {
	}

	public MovieVO(int movieCd, String movieNm, String genreNm, String watchGradeNm, String openDt, String director,
			String[] actor, int showTm, double grade, int audiCnt, String movieInfo) {
		super();
		this.movieCd = movieCd;
		this.movieNm = movieNm;
		this.genreNm = genreNm;
		this.watchGradeNm = watchGradeNm;
		this.openDt = openDt;
		this.director = director;
		this.actor = actor;
		this.showTm = showTm;
		this.grade = grade;
		this.audiCnt = audiCnt;
		this.movieInfo = movieInfo;
	}

	public int getMovieCd() {
		return movieCd;
	}

	public void setMovieCd(int movieCd) {
		this.movieCd = movieCd;
	}

	public String getMovieNm() {
		return movieNm;
	}

	public void setMovieNm(String movieNm) {
		this.movieNm = movieNm;
	}

	public String getGenreNm() {
		return genreNm;
	}

	public void setGenreNm(String genreNm) {
		this.genreNm = genreNm;
	}

	public String getWatchGradeNm() {
		return watchGradeNm;
	}

	public void setWatchGradeNm(String watchGradeNm) {
		this.watchGradeNm = watchGradeNm;
	}

	public String getOpenDt() {
		return openDt;
	}

	public void setOpenDt(String openDt) {
		this.openDt = openDt;
	}

	public String getDirector() {
		return director;
	}

	public void setDirector(String director) {
		this.director = director;
	}

	public String[] getActor() {
		return actor;
	}

	public void setActor(String[] actor) {
		this.actor = actor;
	}

	public int getShowTm() {
		return showTm;
	}

	public void setShowTm(int showTm) {
		this.showTm = showTm;
	}

	public double getGrade() {
		return grade;
	}

	public void setGrade(double grade) {
		this.grade = grade;
	}

	public int getAudiCnt() {
		return audiCnt;
	}

	public void setAudiCnt(int audiCnt) {
		this.audiCnt = audiCnt;
	}

	public String getMovieInfo() {
		return movieInfo;
	}

	public void setMovieInfo(String movieInfo) {
		this.movieInfo = movieInfo;
	}

}
