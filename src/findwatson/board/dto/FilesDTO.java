package findwatson.board.dto;

public class FilesDTO {
   private int seq;
   private int boardSeq;
   private String fileName;
   private String oriFileName;
   
   public FilesDTO() {
      super();
      // TODO Auto-generated constructor stub
   }
   public FilesDTO(int seq, int boardSeq, String fileName, String oriFileName) {
      super();
      this.seq = seq;
      this.boardSeq = boardSeq;
      this.fileName = fileName;
      this.oriFileName = oriFileName;
   }
   public int getSeq() {
      return seq;
   }
   public void setSeq(int seq) {
      this.seq = seq;
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