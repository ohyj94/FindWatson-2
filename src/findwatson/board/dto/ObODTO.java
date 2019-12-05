package findwatson.board.dto;

import java.sql.Timestamp;
import java.text.SimpleDateFormat;

public class ObODTO {
	private int seq;
	private String writer;
	private String anserOK;
	private String header;
	private String title;
	private String content;
	private String tiAddr;
	private Timestamp writeDate;
	
	public String getDate() throws Exception {
		long exDate = System.currentTimeMillis();
		long processedWrite_date = writeDate.getTime();
		long sec = (exDate - processedWrite_date) / 1000;
		int min = (int) (sec / 60.0) + 1;
		int hour = (int) (sec / 360.0) + 1;

		if (sec < 60) {
			return sec + "초 전";
		} else if (min < 60) {
			return min + "분 전";
		} else if (hour < 24) {
			return "오늘";
		} else {
			SimpleDateFormat sdf = new SimpleDateFormat("yyyy.MM.dd.");
			return sdf.format(processedWrite_date);
		}
	}

	public ObODTO() {
		super();
	}
	
	public ObODTO(int seq, String writer, String anserOK, String header, String title, String content, String tiAddr,
			Timestamp writeDate) {
		super();
		this.seq = seq;
		this.writer = writer;
		this.anserOK = anserOK;
		this.header = header;
		this.title = title;
		this.content = content;
		this.tiAddr = tiAddr;
		this.writeDate = writeDate;
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

	public String getAnserOK() {
		return anserOK;
	}

	public void setAnserOK(String anserOK) {
		this.anserOK = anserOK;
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

	public String getTiAddr() {
		return tiAddr;
	}

	public void setTiAddr(String tiAddr) {
		this.tiAddr = tiAddr;
	}

	public Timestamp getWriteDate() {
		return writeDate;
	}

	public void setWriteDate(Timestamp writeDate) {
		this.writeDate = writeDate;
	}
}
