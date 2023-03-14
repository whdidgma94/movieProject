package FrontController;

import java.util.HashMap;

import Controller.MemberJoinController;


public class HandlerMapping {

	 private HashMap<String, Controller> mappings;
	 public HandlerMapping() {
		  mappings=new HashMap<String, Controller>();	
		  mappings.put("/memberJoin.do", new MemberJoinController());
	 }
	 public Controller getController(String key) { 
		  return mappings.get(key);
	  }

}
