package FrontController;

import java.util.HashMap;

import Controller.AddNoticeController;
import Controller.AddReviewController;
import Controller.AdminMemberDeleteController;
import Controller.AdminMemberListController;
import Controller.AdminMemberUpdateController;
import Controller.AdminReviewController;
import Controller.CheckPasswordController;
import Controller.GetReviewsController;
import Controller.MainController;
import Controller.MemberGenreSelectController;
import Controller.MemberIdConfirmController;
import Controller.MemberJoinController;
import Controller.MemberLoginController;
import Controller.MemberLogoutController;
import Controller.MemberMovieLikeController;
import Controller.MemberMovieSeenController;
import Controller.MemberMyMovieController;
import Controller.MemberMyPageController;
import Controller.MemberUpdateController;
import Controller.MovieContentController;
import Controller.MovieContentViewController;
import Controller.MovieMyReviewController;
import Controller.MovieReviewController;
import Controller.MovieReviewRemoveController;
import Controller.NoticeRemoveController;
import Controller.NoticeViewController;
import Controller.PreviewController;
import Controller.MovieRankController;
import Controller.SearchViewController;
import Controller.SetDataBaseController;
import Controller.UpcomingMovieController;
import Controller.RecommandMovieController;
import Controller.SearchPeopleViewController;
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
		mappings.put("/searchView.do", new SearchViewController());
		mappings.put("/searchMovieView.do", new SearchMovieViewController());
		mappings.put("/searchPeopleView.do", new SearchPeopleViewController());
		mappings.put("/checkPassword.do", new CheckPasswordController());
		mappings.put("/movieReview.do", new MovieReviewController());
		mappings.put("/addReview.do", new AddReviewController());
		mappings.put("/movieRank.do", new MovieRankController());
		mappings.put("/recommandMovie.do", new RecommandMovieController());
		mappings.put("/getReviews.do", new GetReviewsController());
		mappings.put("/movieMyReview.do", new MovieMyReviewController());
		mappings.put("/movieReviewRemove.do", new MovieReviewRemoveController());
		mappings.put("/memberUpdate.do", new MemberUpdateController());
		mappings.put("/movieContent.do", new MovieContentController());
		mappings.put("/addNotice.do", new AddNoticeController());
		mappings.put("/noticeView.do", new NoticeViewController());
		mappings.put("/noticeRemove.do", new NoticeRemoveController());
		mappings.put("/adminMemberList.do", new AdminMemberListController());
		mappings.put("/adminMemberUpdate.do", new AdminMemberUpdateController());
		mappings.put("/adminMemberDelete.do", new AdminMemberDeleteController());
		mappings.put("/adminReview.do", new AdminReviewController());
		mappings.put("/upcomingMovie.do", new UpcomingMovieController());
		mappings.put("/movieContentView.do", new MovieContentViewController());
		mappings.put("/memberMovieLike.do", new MemberMovieLikeController());
		mappings.put("/memberMovieSeen.do", new MemberMovieSeenController());
		mappings.put("/memberMyMovie.do", new MemberMyMovieController());
		mappings.put("/preview.do", new PreviewController());
	}

	public Controller getController(String key) {
		return mappings.get(key);
	}

}
