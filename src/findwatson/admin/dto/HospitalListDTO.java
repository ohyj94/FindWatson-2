package findwatson.admin.dto;

public class HospitalListDTO {
	private int seq;
	private String hosptName;
	private int zipcode;
	private String city;
	private String gu;
	private String dong;
	private String address;
	private String phone;
	private String homepage;
	private String img;
	private String medicalAnimal;
	private String medicalDept;
	private String infoRegist;
	
	public HospitalListDTO(int seq, String hosptName, int zipcode, String city, String gu, String dong, String address,
			String phone, String homepage, String img, String medicalAnimal, String medicalDept, String infoRegist) {
		super();
		this.seq = seq;
		this.hosptName = hosptName;
		this.zipcode = zipcode;
		this.city = city;
		this.gu = gu;
		this.dong = dong;
		this.address = address;
		this.phone = phone;
		this.homepage = homepage;
		this.img = img;
		this.medicalAnimal = medicalAnimal;
		this.medicalDept = medicalDept;
		this.infoRegist = infoRegist;
	}
	
	public HospitalListDTO() {
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
	public int getZipcode() {
		return zipcode;
	}
	public void setZipcode(int zipcode) {
		this.zipcode = zipcode;
	}
	public String getCity() {
		return city;
	}
	public void setCity(String city) {
		this.city = city;
	}
	public String getGu() {
		return gu;
	}
	public void setGu(String gu) {
		this.gu = gu;
	}
	public String getDong() {
		return dong;
	}
	public void setDong(String dong) {
		this.dong = dong;
	}
	public String getAddress() {
		return address;
	}
	public void setAddress(String address) {
		this.address = address;
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
	public String getMedicalDept() {
		return medicalDept;
	}
	public void setMedicalDept(String medicalDept) {
		this.medicalDept = medicalDept;
	}
	public String getInfoRegist() {
		return infoRegist;
	}
	public void setInfoRegist(String infoRegist) {
		this.infoRegist = infoRegist;
	}


}
