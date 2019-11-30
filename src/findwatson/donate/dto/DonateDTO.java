package findwatson.donate.dto;

public class DonateDTO {
	private String donateId;
	private String userId;
	private String name;
	private int support;
	private int realPayment;
	private String payMethod;	
	private String email;	
	private String postcode;
	private String addr1;
	private String addr2;
	private String phone;	
	private String valid;
	
	public DonateDTO() {}

	public DonateDTO(String donateId, String userId, String name, int support, int realPayment, String payMethod,
			String email, String postcode, String addr1, String addr2, String phone, String valid) {
		super();
		this.donateId = donateId;
		this.userId = userId;
		this.name = name;
		this.support = support;
		this.realPayment = realPayment;
		this.payMethod = payMethod;
		this.email = email;
		this.postcode = postcode;
		this.addr1 = addr1;
		this.addr2 = addr2;
		this.phone = phone;
		this.valid = valid;
	}

	public String getDonateId() {
		return donateId;
	}

	public void setDonateId(String donateId) {
		this.donateId = donateId;
	}

	public String getUserId() {
		return userId;
	}

	public void setUserId(String userId) {
		this.userId = userId;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
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

	public String getPayMethod() {
		return payMethod;
	}

	public void setPayMethod(String payMethod) {
		this.payMethod = payMethod;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public String getPostcode() {
		return postcode;
	}

	public void setPostcode(String postcode) {
		this.postcode = postcode;
	}

	public String getAddr1() {
		return addr1;
	}

	public void setAddr1(String addr1) {
		this.addr1 = addr1;
	}

	public String getAddr2() {
		return addr2;
	}

	public void setAddr2(String addr2) {
		this.addr2 = addr2;
	}

	public String getPhone() {
		return phone;
	}

	public void setPhone(String phone) {
		this.phone = phone;
	}

	public String getValid() {
		return valid;
	}

	public void setValid(String valid) {
		this.valid = valid;
	}

	

	
	
}
