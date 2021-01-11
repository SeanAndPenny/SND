package com.wondersgroup.wszygl.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;


@Controller
@RequestMapping("/csdata")
public class CsController {
	@RequestMapping("/csdata")
	public ModelAndView rycxList(HttpServletRequest request, HttpServletResponse response) {
		 
		 ModelAndView result = new ModelAndView();
		result.setViewName("wszygl/csdata"); 
		return result;

	}
}
