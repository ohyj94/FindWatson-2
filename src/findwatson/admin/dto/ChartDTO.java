package findwatson.admin.dto;

public class ChartDTO {
	private String title;
	private int viewCount;
	public ChartDTO(String title, int viewCount) {
		super();
		this.title = title;
		this.viewCount = viewCount;
	}
	public ChartDTO() {
		super();
	}
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	public int getViewCount() {
		return viewCount;
	}
	public void setViewCount(int viewCount) {
		this.viewCount = viewCount;
	}
	
	
}
