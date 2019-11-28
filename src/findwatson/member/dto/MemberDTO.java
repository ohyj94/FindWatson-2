package findwatson.member.dto;

import java.sql.Timestamp;

public class MemberDTO {
	private String id;
	private String pw;
	private String name;
	private String birth;
	private String gender;
	private String email;
	private String phone;
	private String postcode;
	private String address1;
	private String address2;
	private String lovePet;
	private String signPath;
	private Timestamp date;
	
	
	public MemberDTO() {
		super();
	}


	public MemberDTO(String id, String pw, String name, String birth, String gender, String email, String phone,
			String postcode, String address1, String address2, String lovePet, String signPath, Timestamp date) {
		super();
		this.id = id;
		this.pw = pw;
		this.name = name;
		this.birth = birth;
		this.gender = gender;
		this.email = email;
		this.phone = phone;
		this.postcode = postcode;
		this.address1 = address1;
		this.address2 = address2;
		this.lovePet = lovePet;
		this.signPath = signPath;
		this.date = date;
	}


	public String getId() {
		return id;
	}


	public void setId(String id) {
		this.id = id;
	}


	public String getPw() {
		return pw;
	}


	public void setPw(String pw) {
		this.pw = pw;
	}


	public String getName() {
		return name;
	}


	public void setName(String name) {
		this.name = name;
	}


	public String getBirth() {
		return birth;
	}


	public void setBirth(String birth) {
		this.birth = birth;
	}


	public String getGender() {
		return gender;
	}


	public void setGender(String gender) {
		this.gender = gender;
	}


	public String getEmail() {
		return email;
	}


	public void setEmail(String email) {
		this.email = email;
	}


	public String getPhone() {
		return phone;
	}


	public void setPhone(String phone) {
		this.phone = phone;
	}


	public String getPostcode() {
		return postcode;
	}


	public void setPostcode(String postcode) {
		this.postcode = postcode;
	}


	public String getAddress1() {
		return address1;
	}


	public void setAddress1(String address1) {
		this.address1 = address1;
	}


	public String getAddress2() {
		return address2;
	}


	public void setAddress2(String address2) {
		this.address2 = address2;
	}


	public String getLovePet() {
		return lovePet;
	}


	public void setLovePet(String lovePet) {
		this.lovePet = lovePet;
	}


	public String getSignPath() {
		return signPath;
	}


	public void setSignPath(String signPath) {
		this.signPath = signPath;
	}


	public Timestamp getDate() {
		return date;
	}


	public void setDate(Timestamp date) {
		this.date = date;
	}
	
	
	
	
}
