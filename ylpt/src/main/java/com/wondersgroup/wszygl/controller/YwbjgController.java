package com.wondersgroup.wszygl.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.wondersgroup.api.beans.page.PageRequest;
import com.wondersgroup.api.beans.page.PageResult;
import com.wondersgroup.api.mybatis.manager.BaseMybatisManager;
import com.wondersgroup.frame.spr_mybt_mvc.basic.controller.BaseMybatisController;
import com.wondersgroup.wszygl.manager.YwbjgManager;
import com.wondersgroup.wszygl.model.YwbpzModel;
@Controller
@RequestMapping("/ywbjg")
public class YwbjgController extends BaseMybatisController<YwbpzModel, String>{
	@Autowired
	  private YwbjgManager ywbjgManager; 
	@RequestMapping("/ywbjg") 
	
	public ModelAndView queryList(HttpServletRequest request,HttpServletResponse response) {
	     
	    ModelAndView result = new ModelAndView();
	    try {
	      String ywbm = request.getParameter("p_ywbm");
	     
	      PageRequest pageRequest = newPageRequest(request);
	     PageResult<YwbpzModel> page = ywbjgManager.pageSelect(pageRequest);
	      result.addObject("ywbm", ywbm);
	      result.addObject("code", 0);
	      result.addObject("msg", "success");
	      result.addObject("count", page.getTotalCount());
	      result.addObject("data", page.getResult());
	    } catch (Exception e) {
	      logger.warn(e.getMessage());
	      result.addObject("code", 500);
	      result.addObject("msg", e.getMessage());
	    } 
	    result.setViewName("wszygl/ywbjg");
	    return result;
	    
	  }

	@Override
	public Class<YwbpzModel> getEntityClass() {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public BaseMybatisManager<YwbpzModel, String> getBaseManager() {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public String getViewPath() {
		// TODO Auto-generated method stub
		return null;
	}

}
