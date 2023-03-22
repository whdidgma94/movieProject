package Credit;

public class CreditVO {

	private String name;
	private String profile_path;
	private String character;
	private String job;

	public CreditVO() {
	}

	public CreditVO(String name, String profile_path, String character, String job) {
		super();
		this.name = name;
		this.profile_path = profile_path;
		this.character = character;
		this.job = job;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getProfile_path() {
		return profile_path;
	}

	public void setProfile_path(String profile_path) {
		this.profile_path = profile_path;
	}

	public String getCharacter() {
		return character;
	}

	public void setCharacter(String character) {
		this.character = character;
	}

	public String getJob() {
		return job;
	}

	public void setJob(String job) {
		this.job = job;
	}

}
