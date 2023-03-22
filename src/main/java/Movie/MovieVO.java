package Movie;

public class MovieVO {
	private int movieCd;
	private String movieNm;
	private String genreNm;
	private String openDt;
	String subject;
	private double grade;
	private boolean adult;
	private String poster_path;
	private String backdrop_path;
	private String overview;

	public MovieVO() {
	}

	public MovieVO(int movieCd, String movieNm, String genreNm, String openDt, String subject, double grade,
			boolean adult, String poster_path, String backdrop_path, String overview) {
		super();
		this.movieCd = movieCd;
		this.movieNm = movieNm;
		this.genreNm = genreNm;
		this.openDt = openDt;
		this.subject = subject;
		this.grade = grade;
		this.adult = adult;
		this.poster_path = poster_path;
		this.backdrop_path = backdrop_path;
		this.overview = overview;
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

	public String getOpenDt() {
		return openDt;
	}

	public void setOpenDt(String openDt) {
		this.openDt = openDt;
	}

	public String getSubject() {
		return subject;
	}

	public void setSubject(String subject) {
		this.subject = subject;
	}

	public double getGrade() {
		return grade;
	}

	public void setGrade(double grade) {
		this.grade = grade;
	}

	public boolean isAdult() {
		return adult;
	}

	public void setAdult(boolean adult) {
		this.adult = adult;
	}

	public String getPoster_path() {
		return poster_path;
	}

	public void setPoster_path(String poster_path) {
		this.poster_path = poster_path;
	}

	public String getBackdrop_path() {
		return backdrop_path;
	}

	public void setBackdrop_path(String backdrop_path) {
		this.backdrop_path = backdrop_path;
	}

	public String getOverview() {
		return overview;
	}

	public void setOverview(String overview) {
		this.overview = overview;
	}


}
