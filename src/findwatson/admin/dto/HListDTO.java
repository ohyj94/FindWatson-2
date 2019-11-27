package findwatson.admin.dto;

import java.sql.Timestamp;

public class HListDTO {
	private int seq;
	private String hosptName;
	private int postcode;
	private String address1;
	private String address2;
	private String phone;
	private String homepage;
	private String img;
	private String medicalAnimal;
	private String openTime;
	private Timestamp registDate;
	
	public HListDTO(int seq, String hosptName, int postcode, String address1, String address2, String phone,
			String homepage, String img, String medicalAnimal, String openTime, Timestamp registDate) {
		super();
		this.seq = seq;
		this.hosptName = hosptName;
		this.postcode = postcode;
		this.address1 = address1;
		this.address2 = address2;
		this.phone = phone;
		this.homepage = homepage;
		this.img = img;
		this.medicalAnimal = medicalAnimal;
		this.openTime = openTime;
		this.registDate = registDate;
	}
	public HListDTO(int seq, String hosptName) {
		this.seq = seq;
		this.hosptName = hosptName;
	}
	public HListDTO() {
		super();
	}
	public int getSeq() {
		return seq;
	}
	public void setSeq(int seq) {
		this.seq = seq;
	}
	public String getHosptName() {
		return hosptName;
	}
	public void setHosptName(String hosptName) {
		this.hosptName = hosptName;
	}
	public int getPostcode() {
		return postcode;
	}
	public void setPostcode(int postcode) {
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
	public String getPhone() {
		return phone;
	}
	public void setPhone(String phone) {
		this.phone = phone;
	}
	public String getHomepage() {
		return homepage;
	}
	public void setHomepage(String homepage) {
		this.homepage = homepage;
	}
	public String getImg() {
		return img;
	}
	public void setImg(String img) {
		this.img = img;
	}
	public String getMedicalAnimal() {
		return medicalAnimal;
	}
	public void setMedicalAnimal(String medicalAnimal) {
		this.medicalAnimal = medicalAnimal;
	}
	public String getOpenTime() {
		return openTime;
	}
	public void setOpenTime(String openTime) {
		this.openTime = openTime;
	}
	public Timestamp getRegistDate() {
		return registDate;
	}
	public void setRegistDate(Timestamp registDate) {
		this.registDate = registDate;
	}
	
	
	
}