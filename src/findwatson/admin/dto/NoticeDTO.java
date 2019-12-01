package findwatson.admin.dto;

import java.sql.Timestamp;
import java.text.SimpleDateFormat;

public class NoticeDTO {
	private int seq;
	private String title;
	private String content;
	private Timestamp writeDate;
	private int viewCount;
	
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

	public String getFormedDate() {
		SimpleDateFormat sdf = new SimpleDateFormat("YYYY-MM-dd");
		long date = this.writeDate.getTime();
		long current_date = System.currentTimeMillis();

		return sdf.format(date);


	}


}
