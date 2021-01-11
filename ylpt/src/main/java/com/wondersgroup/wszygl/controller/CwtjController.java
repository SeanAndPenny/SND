package com.wondersgroup.wszygl.controller;

import java.util.List;

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
import com.wondersgroup.wszygl.manager.CwtjManger;
import com.wondersgroup.wszygl.manager.CwtjXzJgManger;
import com.wondersgroup.wszygl.model.CwtjModel;
import com.wondersgroup.wszygl.model.SslistModel;
@Controller
@RequestMapping("/cwtj")
public class CwtjController extends BaseMybatisController<CwtjModel,String>{
	@Autowired
	public CwtjManger cwtjManger;
	
	@Autowired
	public CwtjXzJgManger cwtjXzJgManger;
	
	@RequestMapping("/cwtj")//床位统计
	public ModelAndView rycxList(HttpServletRequest request, HttpServletResponse response) {
		ModelAndView result = new ModelAndView();
		result.setViewName("wszygl/xqtj");		
		try {
			 /*PageRequest pageRequest = newPageRequest(request); 
			PageResult<CwtjModel> page = cwtjManger.pageSelect(pageRequest);
			 result.addObject("code", 0);
			result.addObject("msg", "success");
			result.addObject("count", page.getTotalCount());
			result.addObject("data", page.getResult());*/
		}catch(Exception e) {
			logger.warn(e.getMessage());
			result.addObject("code", 500);
			result.addObject("msg", e.getMessage());
		}
		return result;

	}
 //床位统计下钻机构
	
	@RequestMapping("/cwtjXzJg")
	public ModelAndView cwtjXzJgList(HttpServletRequest request, HttpServletResponse response) {
	    String id = request.getParameter("p_id");
		ModelAndView result = new ModelAndView();
		result.setViewName("wszygl/cwtjXzJg");
		try { 
			 
			result.addObject("id", id);
			PageRequest pageRequest = newPageRequest(request);
			PageResult<CwtjModel> page = cwtjXzJgManger.pageSelect(pageRequest);
			result.addObject("code", 0);
			result.addObject("msg", "success");
			result.addObject("count", page.getTotalCount());
			result.addObject("data", page.getResult());
		}catch(Exception e) {
			logger.warn(e.getMessage());
			result.addObject("code", 500);
			result.addObject("msg", e.getMessage());
		}
		return result;

	}

	@RequestMapping("/cwtjXzJgecharts")
	public ModelAndView cwtjXzJgecharts(HttpServletRequest request,HttpServletResponse response) {
		ModelAndView result = new ModelAndView();
	 	String id = request.getParameter("p_id");
		try { 
			result.addObject("id", id);
			List<CwtjModel>cwtjXzJgechartsechartsList = cwtjXzJgManger.getCwtjXzJg(id);
			 
			result.addObject("cwtjXzJgechartsechartsList", cwtjXzJgechartsechartsList);
		}catch(Exception e) {
			logger.warn(e.getMessage());
			result.addObject("code", 500);
			result.addObject("msg", e.getMessage());
		}
		return result;
		
	}
	
	
	
	
	
	
	
	
	
	
	
	@Override
	public Class<CwtjModel> getEntityClass() {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public BaseMybatisManager<CwtjModel, String> getBaseManager() {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public String getViewPath() {
		// TODO Auto-generated method stub
		return null;
	}

}
