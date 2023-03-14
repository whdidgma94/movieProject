package FrontController;

import java.util.HashMap;

import Controller.MemberIdConfirmController;
import Controller.MemberJoinController;
import Controller.MemberLoginController;


public class HandlerMapping {

	 private HashMap<String, Controller> mappings;
	 public HandlerMapping() {
		  mappings=new HashMap<String, Controller>();	
		  mappings.put("/memberJoin.do", new MemberJoinController());
		  mappings.put("/memberIdConfirm.do", new MemberIdConfirmController());
		  mappings.put("/memberLogin.do", new MemberLoginController());
	 }
	 public Controller getController(String key) { 
		  return mappings.get(key);
	  }

}
