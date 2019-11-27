package findwatson.admin.dto;

import java.sql.Timestamp;

public class BoardDTO {
	private int seq;
	private String writer;
	private String header;
	private String title;
	private String content;
	private String ipAddr;
	private int viewCount;
	private Timestamp writeDate;
	
	public BoardDTO(int seq, String writer, String header, String title, String content, String ipAddr, int viewCount,
			Timestamp writeDate) {
		super();
		this.seq = seq;
		this.writer = writer;
		this.header = header;
		this.title = title;
		this.content = content;
		this.ipAddr = ipAddr;
		this.viewCount = viewCount;
		this.writeDate = writeDate;
	}

	public BoardDTO() {
		super();
	}

	public int getSeq() {
		return seq;
	}

	public void setSeq(int seq) {
		this.seq = seq;
	}

	public String getWriter() {
		return writer;
	}

	public void setWriter(String writer) {
		this.writer = writer;
	}

	public String getHeader() {
		return header;
	}

	public void setHeader(String header) {
		this.header = header;
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

	public String getIpAddr() {
		return ipAddr;
	}

	public void setIpAddr(String ipAddr) {
		this.ipAddr = ipAddr;
	}

	public int getViewCount() {
		return viewCount;
	}

	public void setViewCount(int viewCount) {
		this.viewCount = viewCount;
	}

	public Timestamp getWriteDate() {
		return writeDate;
	}

	public void setWriteDate(Timestamp writeDate) {
		this.writeDate = writeDate;
	}
	
	
}
