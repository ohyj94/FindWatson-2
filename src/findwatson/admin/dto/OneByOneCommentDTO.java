package findwatson.admin.dto;

import java.sql.Timestamp;

public class OneByOneCommentDTO {
	private int seq;
	private int onebyoneSeq;
	private String comment;
	private Timestamp writeDate;
	public OneByOneCommentDTO(int seq, int onebyoneSeq, String comment, Timestamp writeDate) {
		super();
		this.seq = seq;
		this.onebyoneSeq = onebyoneSeq;
		this.comment = comment;
		this.writeDate = writeDate;
	}
	public OneByOneCommentDTO() {
		super();
	}
	public int getSeq() {
		return seq;
	}
	public void setSeq(int seq) {
		this.seq = seq;
	}
	public int getOnebyoneSeq() {
		return onebyoneSeq;
	}
	public void setOnebyoneSeq(int onebyoneSeq) {
		this.onebyoneSeq = onebyoneSeq;
	}
	public String getComment() {
		return comment;
	}
	public void setComment(String comment) {
		this.comment = comment;
	}
	public Timestamp getWriteDate() {
		return writeDate;
	}
	public void setWriteDate(Timestamp writeDate) {
		this.writeDate = writeDate;
	}
	
	
}
