package findwatson.admin.dto;

import java.sql.Timestamp;
import java.text.SimpleDateFormat;

public class HospitalReviewDTO {
	private int seq;
	private int articleSeq;
	private int score;
	private String title;
	private String content;
	private String header;
	private String writer;
	private Timestamp writeDate;
	private String ipAddr;
	private int likeCount;
	
	public String getDate() throws Exception{
	      long exDate = System.currentTimeMillis();
	      long processedWrite_date = writeDate.getTime();
	      long sec = (exDate - processedWrite_date)/1000;
	      int min = (int)(sec/60.0) + 1;
	      int hour = (int)(sec/360.0) + 1;
	      
	      if(sec < 60) {
	         return sec + "초 전";
	      }else if(min < 60){
	         return min + "분 전";
	      }else if(hour < 24) {
	         return "오늘";
	      }else {
	         SimpleDateFormat sdf = new SimpleDateFormat("yy년 MM월 dd일");
	         return sdf.format(processedWrite_date);
	      }
	   }
	
	public HospitalReviewDTO(int seq, int articleSeq, int score, String title, String content, String header, String writer,
			Timestamp writedDate, String ipAddr, int likeCount) {
		super();
		this.seq = seq;
		this.articleSeq = articleSeq;
		this.score = score;
		this.title = title;
		this.content = content;
		this.header = header;
		this.writer = writer;
		this.writeDate = writedDate;
		this.ipAddr = ipAddr;
		this.likeCount = likeCount;
		
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
		return writeDate;
	}

	public void setWritedDate(Timestamp writedDate) {
		this.writeDate = writedDate;
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

	
}
