package findwatson.admin.dto;

import java.sql.Timestamp;

public class NoticeDTO {
	private int seq;
	private String title;
	private String content;
	private Timestamp writeDate;
	private int viewCount;
	public NoticeDTO(int seq, String title, String content, Timestamp writeDate, int viewCount) {
		super();
		this.seq = seq;
		this.title = title;
		this.content = content;
		this.writeDate = writeDate;
		this.viewCount = viewCount;
	}
	public NoticeDTO() {
		super();
	}
	public int getSeq() {
		return seq;
	}
	public void setSeq(int seq) {
		this.seq = seq;
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
	public Timestamp getWriteDate() {
		return writeDate;
	}
	public void setWriteDate(Timestamp writeDate) {
		this.writeDate = writeDate;
	}
	public int getViewCount() {
		return viewCount;
	}
	public void setViewCount(int viewCount) {
		this.viewCount = viewCount;
	}
	
	
	
	
}
