package com.wondersgroup.wszygl.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;
import com.wondersgroup.api.mybatis.manager.BaseMybatisManager;
import com.wondersgroup.frame.spr_mybt_mvc.basic.controller.BaseMybatisController;
import com.wondersgroup.wszygl.manager.AAAManger;
import com.wondersgroup.wszygl.model.AAAModel;

@Controller
@RequestMapping("/aaaa")
public class AAAController extends BaseMybatisController<AAAModel, String> {
	@Autowired
	public AAAManger aaamanger;
	@RequestMapping("/aaaa")
	
	public ModelAndView rycxList(HttpServletRequest request, HttpServletResponse response) {
		ModelAndView result = new ModelAndView();
		
		String yw=aaamanger.getxxx();
		
		
		result.addObject("yw", yw);
		result.setViewName("wszygl/aaaa");
		return result;
	}
	
	
	

	@Override
	public Class<AAAModel> getEntityClass() {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public BaseMybatisManager<AAAModel, String> getBaseManager() {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public String getViewPath() {
		// TODO Auto-generated method stub
		return null;
	}

}
