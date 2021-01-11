package com.wondersgroup.ggwsgl.controller;



import java.io.IOException;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;



@Controller
@RequestMapping("/gwsc")
public class GwscController {
	@RequestMapping("/gwsc")
	public ModelAndView gwsc(HttpServletRequest request,HttpServletResponse response) throws IOException {
		
//		response.sendRedirect("http://172.26.201.164/medWeb/Login_loginIn.action");
//		return new ModelAndView("redirect:http://172.26.201.164/medWeb/Login_loginIn.action");
		ModelAndView result = new ModelAndView();
		result.setViewName("ggwsgl/gwsc");
		return result;
	}
}
