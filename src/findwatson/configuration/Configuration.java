package findwatson.configuration;

public class Configuration {
	public static int recordCountPerPage = 10;
	public static int naviCountPerPage = 10;
	
	public static String protectXSS(String input) {
	      input = input.replaceAll("&", "&amp;");
	      input = input.replaceAll("<", "&lt;");
	      input = input.replaceAll(">", "&gt;");
	      
	      return input;
	   }
}
