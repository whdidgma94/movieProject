package Movie;

public class MovieVO {
	private int movieCd;
	private String movieNm;
	private String genreNm;
	private String watchGradeNm;
	private String openDt;
	private String director;
	private String actor;
	private int showTm;
	private String showTypeNm;
	private double grade;
	private int audiCnt;
	private int ranking;
	private boolean adult;
	private String poster_path;
	private boolean video;
	private String overview;

	public MovieVO() {
	}

	public MovieVO(int movieCd, String movieNm, String genreNm, String watchGradeNm, String openDt, String director,
			String actor, int showTm, String showTypeNm, double grade, int audiCnt, int ranking, boolean adult,
			String poster_path, boolean video, String overview) {
		super();
		this.movieCd = movieCd;
		this.movieNm = movieNm;
		this.genreNm = genreNm;
		this.watchGradeNm = watchGradeNm;
		this.openDt = openDt;
		this.director = director;
		this.actor = actor;
		this.showTm = showTm;
		this.showTypeNm = showTypeNm;
		this.grade = grade;
		this.audiCnt = audiCnt;
		this.ranking = ranking;
		this.adult = adult;
		this.poster_path = poster_path;
		this.video = video;
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

	public String getActor() {
		return actor;
	}

	public void setActor(String actor) {
		this.actor = actor;
	}

	public int getShowTm() {
		return showTm;
	}

	public void setShowTm(int showTm) {
		this.showTm = showTm;
	}

	public String getShowTypeNm() {
		return showTypeNm;
	}

	public void setShowTypeNm(String showTypeNm) {
		this.showTypeNm = showTypeNm;
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

	public int getRanking() {
		return ranking;
	}

	public void setRanking(int ranking) {
		this.ranking = ranking;
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

	public boolean isVideo() {
		return video;
	}

	public void setVideo(boolean video) {
		this.video = video;
	}

	public String getOverview() {
		return overview;
	}

	public void setOverview(String overview) {
		this.overview = overview;
	}


}
