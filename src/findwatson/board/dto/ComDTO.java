package findwatson.board.dto;

import java.sql.Timestamp;

public class ComDTO {
	private int comSeq;
	private int boardSeq;
	private String writer;
	private String content;
	private String ipAddr;
	private Timestamp writeDate;
	public ComDTO() {
		super();
	}
	public ComDTO(int comSeq, int boardSeq, String writer, String content, String ipAddr, Timestamp writeDate) {
		super();
		this.comSeq = comSeq;
		this.boardSeq = boardSeq;
		this.writer = writer;
		this.content = content;
		this.ipAddr = ipAddr;
		this.writeDate = writeDate;
	}
	public int getComSeq() {
		return comSeq;
	}
	public void setComSeq(int comSeq) {
		this.comSeq = comSeq;
	}
	public int getBoardSeq() {
		return boardSeq;
	}
	public void setBoardSeq(int boardSeq) {
		this.boardSeq = boardSeq;
	}
	public String getWriter() {
		return writer;
	}
	public void setWriter(String writer) {
		this.writer = writer;
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
	public Timestamp getWriteDate() {
		return writeDate;
	}
	public void setWriteDate(Timestamp writeDate) {
		this.writeDate = writeDate;
	}
	
	
	
}

