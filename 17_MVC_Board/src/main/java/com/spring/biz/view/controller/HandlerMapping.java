package com.spring.biz.view.controller;

import java.util.HashMap;
import java.util.Map;

import com.spring.biz.view.board.GetBoardListController;
import com.spring.biz.view.user.LoginController;

/*
 * HandlerMapping 요청정보와 처리할 컨트롤러를 연결하는 정보 저장
 * DispatcherServlet 의 init() 호출시 생성
 */
public class HandlerMapping {
	private Map<String, Controller> mappings;
	
	public HandlerMapping() {
		mappings = new HashMap<String, Controller>();
		mappings.put("/login.do", new LoginController());
		mappings.put("/getBoardList.do", new GetBoardListController());
	}
	
	public Controller getController(String path) {
		return mappings.get(path);
	}
}












