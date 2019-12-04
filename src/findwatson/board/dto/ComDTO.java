package findwatson.board.dto;

import java.sql.Timestamp;
import java.text.SimpleDateFormat;

public class ComDTO {
	private int comSeq;
	private int boardSeq;
	private String writer;
	private String content;
	private String ipAddr;
	private Timestamp writeDate;
	
	
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

