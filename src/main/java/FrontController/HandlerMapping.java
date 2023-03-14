package FrontController;

import java.util.HashMap;

import Controller.MemberIdConfirmController;
import Controller.MemberJoinController;


public class HandlerMapping {

	 private HashMap<String, Controller> mappings;
	 public HandlerMapping() {
		  mappings=new HashMap<String, Controller>();	
		  mappings.put("/memberJoin.do", new MemberJoinController());
		  mappings.put("/memberIdConfirm.do", new MemberIdConfirmController());
	 }
	 public Controller getController(String key) { 
		  return mappings.get(key);
	  }

}
