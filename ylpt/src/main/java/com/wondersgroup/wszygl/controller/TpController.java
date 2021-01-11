package com.wondersgroup.wszygl.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.wondersgroup.api.beans.page.PageRequest;
import com.wondersgroup.api.beans.page.PageResult;
import com.wondersgroup.wszygl.model.SsywjcModel;

@Controller
@RequestMapping("/xqtp")
public class TpController {
	@RequestMapping("/xqtp")
	public ModelAndView rycxList(HttpServletRequest request, HttpServletResponse response) {
		 
		ModelAndView result = new ModelAndView();
		result.setViewName("wszygl/xqtp");
		 
		return result;

	}

}
