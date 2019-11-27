package findwatson.review.dto;

public class ReviewFileDTO {
	private int seq;
	private int articleSeq;
	private String fileName;
	private String oriFileName;
	
	public ReviewFileDTO() {
		super();
	}

	public ReviewFileDTO(int seq, int articleSeq, String fileName, String oriFileName) {
		super();
		this.seq = seq;
		this.articleSeq = articleSeq;
		this.fileName = fileName;
		this.oriFileName = oriFileName;
	}

	public int getSeq() {
		return seq;
	}

	public void setSeq(int seq) {
		this.seq = seq;
	}

	public int getArticleSeq() {
		return articleSeq;
	}

	public void setArticleSeq(int articleSeq) {
		this.articleSeq = articleSeq;
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
