package com.wondersgroup.ggwsgl.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.wondersgroup.frame.spr_mybt_mvc.basic.controller.BaseMybatisLayuiController;
import com.wondersgroup.ggwsgl.manager.FyfmxxManager;
import com.wondersgroup.ggwsgl.model.FyfmxxModel;

@Controller
@RequestMapping("ff")
public class FyfmxxController {
	@Autowired
	private FyfmxxManager fyfmxxManager;
	protected final static Logger logger = LoggerFactory.getLogger(BaseMybatisLayuiController.class);
	@RequestMapping("/fyfmxx")
	public ModelAndView fyfmxxList(HttpServletRequest request,HttpServletResponse response,
			String sfzh ) {
		ModelAndView result =new ModelAndView();
		result.setViewName("ggwsgl/fyFmxx");
		List<FyfmxxModel> getFmxx=fyfmxxManager.getFmxx(sfzh);
		result.addObject("getFmxx", getFmxx);
		return result;
	}
}
