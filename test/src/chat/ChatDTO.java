package chat;

public class ChatDTO {
	private int ch_idx;
	private String toID;
	private String fromID;
	private String ch_content;
	private String ch_time;
	public int getCh_idx() {
		return ch_idx;
	}
	public void setCh_idx(int ch_idx) {
		this.ch_idx = ch_idx;
	}
	public String getToID() {
		return toID;
	}
	public void setToID(String toID) {
		this.toID = toID;
	}
	public String getFromID() {
		return fromID;
	}
	public void setFromID(String fromID) {
		this.fromID = fromID;
	}
	public String getCh_content() {
		return ch_content;
	}
	public void setCh_content(String ch_content) {
		this.ch_content = ch_content;
	}
	public String getCh_time() {
		return ch_time;
	}
	public void setCh_time(String ch_time) {
		this.ch_time = ch_time;
	}

}
