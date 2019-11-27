package findwatson.admin.dto;

public class BanDTO {
	private String id;
	private String ip;
	private String reason;
	
	public BanDTO(String id, String ip, String reason) {
		super();
		this.id = id;
		this.ip = ip;
		this.reason = reason;
	}
	
	public BanDTO() {
		super();
	}

	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public String getIp() {
		return ip;
	}
	public void setIp(String ip) {
		this.ip = ip;
	}
	public String getReason() {
		return reason;
	}
	public void setReason(String reason) {
		this.reason = reason;
	}
	
	
}
