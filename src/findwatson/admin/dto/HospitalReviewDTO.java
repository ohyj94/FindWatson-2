package findwatson.admin.dto;

import java.sql.Timestamp;

public class HospitalReviewDTO {
	private int seq;
	private int articleSeq;
	private int score;
	private String title;
	private String content;
	private String header;
	private String writer;
	private Timestamp writedDate;
	private String ipAddr;
	private int likeCount;
	private int viewCount;
	
	public HospitalReviewDTO(int seq, int articleSeq, int score, String title, String content, String header, String writer,
			Timestamp writedDate, String ipAddr, int likeCount, int viewCount) {
		super();
		this.seq = seq;
		this.articleSeq = articleSeq;
		this.score = score;
		this.title = title;
		this.content = content;
		this.header = header;
		this.writer = writer;
		this.writedDate = writedDate;
		this.ipAddr = ipAddr;
		this.likeCount = likeCount;
		this.viewCount = viewCount;
		
	}

	public HospitalReviewDTO() {
		super();
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

	public int getScore() {
		return score;
	}

	public void setScore(int score) {
		this.score = score;
	}

	public String getTitle() {
		return title;
	}

	public void setTitle(String title) {
		this.title = title;
	}

	public String getContent() {
		return content;
	}

	public void setContent(String content) {
		this.content = content;
	}

	public String getHeader() {
		return header;
	}

	public void setHeader(String header) {
		this.header = header;
	}

	public String getWriter() {
		return writer;
	}

	public void setWriter(String writer) {
		this.writer = writer;
	}

	public Timestamp getWritedDate() {
		return writedDate;
	}

	public void setWritedDate(Timestamp writedDate) {
		this.writedDate = writedDate;
	}

	public String getIpAddr() {
		return ipAddr;
	}

	public void setIpAddr(String ipAddr) {
		this.ipAddr = ipAddr;
	}

	public int getLikeCount() {
		return likeCount;
	}

	public void setLikeCount(int likeCount) {
		this.likeCount = likeCount;
	}

	public int getViewCount() {
		return viewCount;
	}

	public void setViewCount(int viewCount) {
		this.viewCount = viewCount;
	}
	
}
