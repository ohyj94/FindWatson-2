package findwatson.review.dto;

public class ReviewFileDTO {
	private int seq;
	private int hosptReviewSeq;
	private String fileName;
	private String oriFileName;
	
	public ReviewFileDTO() {
		super();
		// TODO Auto-generated constructor stub
	}

	public ReviewFileDTO(int seq, int hosptReviewSeq, String fileName, String oriFileName) {
		super();
		this.seq = seq;
		this.hosptReviewSeq = hosptReviewSeq;
		this.fileName = fileName;
		this.oriFileName = oriFileName;
	}

	public int getSeq() {
		return seq;
	}

	public void setSeq(int seq) {
		this.seq = seq;
	}

	public int getHosptReviewSeq() {
		return hosptReviewSeq;
	}

	public void setHosptReviewSeq(int hosptReviewSeq) {
		this.hosptReviewSeq = hosptReviewSeq;
	}

	public String getFileName() {
		return fileName;
	}

	public void setFileName(String fileName) {
		this.fileName = fileName;
	}

	public String getOriFileName() {
		return oriFileName;
	}

	public void setOriFileName(String oriFileName) {
		this.oriFileName = oriFileName;
	}
	
	
		
}
