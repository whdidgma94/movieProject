package FrontController;

import java.util.HashMap;

import Controller.AddReviewController;
import Controller.CheckPasswordController;
import Controller.GetReviewsController;
import Controller.MainController;
import Controller.MemberGenreSelectController;
import Controller.MemberIdConfirmController;
import Controller.MemberJoinController;
import Controller.MemberLoginController;
import Controller.MemberLogoutController;
import Controller.MemberMyPageController;
import Controller.MovieReviewController;
import Controller.MovieRankController;
import Controller.SearchMovieController;
import Controller.SetDataBaseController;
import Controller.RecommandMovieController;
import Controller.SearchMovieViewController;

public class HandlerMapping {

	private HashMap<String, Controller> mappings;

	public HandlerMapping() {
		mappings = new HashMap<String, Controller>();
		mappings.put("/memberJoin.do", new MemberJoinController());
		mappings.put("/memberIdConfirm.do", new MemberIdConfirmController());
		mappings.put("/memberLogin.do", new MemberLoginController());
		mappings.put("/_main.do", new MainController());
		mappings.put("/memberLogout.do", new MemberLogoutController());
		mappings.put("/setDataBase.do", new SetDataBaseController());
		mappings.put("/memberGenreSelect.do", new MemberGenreSelectController());
		mappings.put("/memberMyPage.do", new MemberMyPageController());
		mappings.put("/searchMovie.do", new SearchMovieController());
		mappings.put("/searchViewMovie.do", new SearchMovieViewController());
		mappings.put("/checkPassword.do", new CheckPasswordController());
		mappings.put("/movieReview.do", new MovieReviewController());
		mappings.put("/addReview.do", new AddReviewController());
		mappings.put("/movieRank.do", new MovieRankController());
		mappings.put("/recommandMovie.do", new RecommandMovieController());
		mappings.put("/getReviews.do", new GetReviewsController());
	}

	public Controller getController(String key) {
		return mappings.get(key);
	}

}
