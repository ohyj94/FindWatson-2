package findwatson.board.dto;

public class FilesDTO {
	private int filesSeq;
	private int boardSeq;
	private String fileName;
	private String oriFileName;
	public FilesDTO() {
		super();
	}
	public FilesDTO(int filesSeq, int boardSeq, String fileName, String oriFileName) {
		super();
		this.filesSeq = filesSeq;
		this.boardSeq = boardSeq;
		this.fileName = fileName;
		this.oriFileName = oriFileName;
	}
	public int getFilesSeq() {
		return filesSeq;
	}
	public void setFilesSeq(int filesSeq) {
		this.filesSeq = filesSeq;
	}
	public int getBoardSeq() {
		return boardSeq;
	}
	public void setBoardSeq(int boardSeq) {
		this.boardSeq = boardSeq;
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
