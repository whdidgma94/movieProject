package Controller;

public class ViewResolver {
	public static String makeView(String nextPage) {
		   return "/WEB-INF/_main/"+nextPage+".jsp";
	   }
}
