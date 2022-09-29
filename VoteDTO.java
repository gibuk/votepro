package Pack01;

public class VoteDTO {
	private String name;
	private int cnt;
	public VoteDTO() {}
	public VoteDTO(String name, int cnt) {
		super();
		this.name = name;
		this.cnt = cnt;
	}
	public String getName() {
		return name;
	}
	public int getCnt() {
		return cnt;
	}
	public void setName(String name) {
		this.name = name;
	}
	public void setCnt(int cnt) {
		this.cnt = cnt;
	}
}
