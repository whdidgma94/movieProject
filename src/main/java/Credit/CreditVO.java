package Credit;

public class CreditVO {
	private int id;
	private String name;
	private String profile_path;
	private String charac;
	private String job;

	public CreditVO() {
	}

	public CreditVO(int id, String name, String profile_path, String charac, String job) {
		super();
		this.id = id;
		this.name = name;
		this.profile_path = profile_path;
		this.charac= charac;
		this.job = job;
	}

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
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

	public String getCharac() {
		return charac;
	}

	public void setCharac(String charac) {
		this.charac = charac;
	}

	public String getJob() {
		return job;
	}

	public void setJob(String job) {
		this.job = job;
	}

}
