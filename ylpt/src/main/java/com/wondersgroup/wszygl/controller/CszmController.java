package com.wondersgroup.wszygl.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;
import com.wondersgroup.api.mybatis.manager.BaseMybatisManager;
import com.wondersgroup.frame.spr_mybt_mvc.basic.controller.BaseMybatisController;
import com.wondersgroup.wszygl.manager.CszmManger;
import com.wondersgroup.wszygl.model.CszmModel;
 
@Controller
@RequestMapping("/cszm")
public class CszmController extends BaseMybatisController<CszmModel,String>{
	@Autowired
    public CszmManger cszmManger;
	@RequestMapping("/cszm")
	public ModelAndView rycxList(HttpServletRequest request, HttpServletResponse response) {
		String cszm = request.getParameter("p_cszm"); 
		 ModelAndView result = new ModelAndView();
		result.setViewName("wszygl/cszm");
		try { 
			result.addObject("cszm", cszm); ;
			CszmModel cszmVO = cszmManger.getCszm(cszm);
			result.addObject("cszmVO", cszmVO);
			result.addObject("code", 0);
			result.addObject("msg", "success");
		}catch(Exception e) {
			logger.warn(e.getMessage());
			result.addObject("code", 500);
			result.addObject("msg", e.getMessage());
		}
		return result;

	}

	@Override
	public Class<CszmModel> getEntityClass() {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public BaseMybatisManager<CszmModel, String> getBaseManager() {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public String getViewPath() {
		// TODO Auto-generated method stub
		return null;
	}

}
