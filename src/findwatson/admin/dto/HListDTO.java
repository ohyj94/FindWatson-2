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
	private int viewCount;
	
	public HListDTO(int seq, String hosptName, int postcode, String address1, String address2, String phone,
			String homepage, String img, String medicalAnimal, String openTime, Timestamp registDate, int viewCount) {
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
		this.viewCount = viewCount;
	}
	public HListDTO(int seq, String hosptName) {
		super();
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

	public int getViewCount() {
		return viewCount;
	}

	public void setViewCount(int viewCount) {
		this.viewCount = viewCount;
	}
	
	public boolean equals(Object o) {
		HListDTO dto = (HListDTO)o;
		if(hosptName.equals(dto.getHosptName()) && postcode == dto.getPostcode() 
				&& address1.equals(dto.getAddress1()) && address2.equals(dto.getAddress2()) 
				&& phone.equals(dto.getPhone()) && homepage.equals(dto.getHomepage()) 
				&& img.equals(dto.getImg()) && medicalAnimal.equals(dto.getMedicalAnimal()) 
				&& openTime.equals(dto.getOpenTime())) {
			return true;
		}
		return false;
	}
	
	public int hashCode() {
		return (hosptName + postcode + address1 + 
				address2 + phone + homepage + img + medicalAnimal
				+ openTime).hashCode();
	}
	
	
}