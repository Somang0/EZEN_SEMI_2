package com.semi2.login.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.semi2.controller.Controller;

public class MemOutController implements Controller {

	@Override
	public String requestProcess(HttpServletRequest request, HttpServletResponse response) throws Throwable {
		
		
		return "/memOut.jsp";
	}

	@Override
	public boolean isRedirect() {
		return false;
	}
	
}
