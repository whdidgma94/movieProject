package Movie;

public class GenreVO {
	int genreId;
	String genreName;

	public GenreVO() {
	}

	public GenreVO(int genreId, String genreName) {
		super();
		this.genreId = genreId;
		this.genreName = genreName;
	}

	public int getGenreId() {
		return genreId;
	}

	public void setGenreId(int genreId) {
		this.genreId = genreId;
	}

	public String getGenreName() {
		return genreName;
	}

	public void setGenreName(String genreName) {
		this.genreName = genreName;
	}

}
