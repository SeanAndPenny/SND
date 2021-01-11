package com.wondersgroup.wszygl.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.stereotype.Component;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.wondersgroup.wszygl.model.JtysModel;

@Component
@RequestMapping("/xqtj_new")
public class XqtjController {
	@RequestMapping("/xqtj_new")
	public ModelAndView rycxList(HttpServletRequest request, HttpServletResponse response) {
		 
		ModelAndView result = new ModelAndView();
		result.setViewName("wszygl/xqtj_new");
		 
		return result;

	}
}
