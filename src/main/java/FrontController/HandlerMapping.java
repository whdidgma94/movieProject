package FrontController;

import java.util.HashMap;

import Controller.MainController;
import Controller.MemberGenreSelectController;
import Controller.MemberIdConfirmController;
import Controller.MemberJoinController;
import Controller.MemberLoginController;
import Controller.MemberLogoutController;
import Controller.SetDataBaseController;


public class HandlerMapping {

	 private HashMap<String, Controller> mappings;
	 public HandlerMapping() {
		  mappings=new HashMap<String, Controller>();	
		  mappings.put("/memberJoin.do", new MemberJoinController());
		  mappings.put("/memberIdConfirm.do", new MemberIdConfirmController());
		  mappings.put("/memberLogin.do", new MemberLoginController());
		  mappings.put("/_main.do", new MainController());
		  mappings.put("/memberLogout.do", new MemberLogoutController());
		  mappings.put("/setDataBase.do", new SetDataBaseController());
		  mappings.put("/memberGenreSelect.do", new MemberGenreSelectController());
	 }
	 public Controller getController(String key) { 
		  return mappings.get(key);
	  }

}
