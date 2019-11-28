package findwatson.donate.dto;

public class DonateDTO {
	private String donateId;
	private int support;
	private int realPayment;
	private String email;
	private String userId;
	private String phone;
	private String addr;
	private String postcode;
	private String passFail;
	public DonateDTO() {
		super();
	}
	public DonateDTO(String donateId, int support, int realPayment, String email, String userId, String phone,
			String addr, String postcode, String passFail) {
		super();
		this.donateId = donateId;
		this.support = support;
		this.realPayment = realPayment;
		this.email = email;
		this.userId = userId;
		this.phone = phone;
		this.addr = addr;
		this.postcode = postcode;
		this.passFail = passFail;
	}
	public String getDonateId() {
		return donateId;
	}
	public void setDonateId(String donateId) {
		this.donateId = donateId;
	}
	public int getSupport() {
		return support;
	}
	public void setSupport(int support) {
		this.support = support;
	}
	public int getRealPayment() {
		return realPayment;
	}
	public void setRealPayment(int realPayment) {
		this.realPayment = realPayment;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public String getUserId() {
		return userId;
	}
	public void setUserId(String userId) {
		this.userId = userId;
	}
	public String getPhone() {
		return phone;
	}
	public void setPhone(String phone) {
		this.phone = phone;
	}
	public String getAddr() {
		return addr;
	}
	public void setAddr(String addr) {
		this.addr = addr;
	}
	public String getPostcode() {
		return postcode;
	}
	public void setPostcode(String postcode) {
		this.postcode = postcode;
	}
	public String getPassFail() {
		return passFail;
	}
	public void setPassFail(String passFail) {
		this.passFail = passFail;
	}
	
	
	
	
}
