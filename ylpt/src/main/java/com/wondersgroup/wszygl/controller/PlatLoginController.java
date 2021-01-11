package com.wondersgroup.wszygl.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.util.WebUtils;

import com.wondersgroup.api.beans.page.PageRequest;
import com.wondersgroup.api.beans.page.PageResult;
import com.wondersgroup.api.mybatis.manager.BaseMybatisManager;
import com.wondersgroup.frame.spr_mybt_mvc.basic.controller.BaseMybatisController;
import com.wondersgroup.frame.spr_mybt_mvc.basic.controller.BaseMybatisLayuiController;
import com.wondersgroup.wszygl.manager.SjscjlManager;
import com.wondersgroup.wszygl.manager.PlatLoginDetailManager;
import com.wondersgroup.wszygl.manager.PlatLoginManager;
import com.wondersgroup.wszygl.model.PlatLoginDetailModel;
import com.wondersgroup.wszygl.model.PlatLoginModel;

@Controller
@RequestMapping("/platLogin")
public class PlatLoginController extends  BaseMybatisController<PlatLoginModel, String>{
	@Autowired
	public PlatLoginManager platLoginManager;
	@Autowired
	private SjscjlManager sjscjlManager;
	@Autowired
	private PlatLoginDetailManager platLoginDetailManager;
	
	protected final static Logger logger = LoggerFactory.getLogger(BaseMybatisLayuiController.class);

	@RequestMapping("/queryList")
	public ModelAndView queryList(HttpServletRequest request,HttpServletResponse response) {
		List<Map<String, Object>> jgList =  sjscjlManager.getAllYljg();
		List<Map<String, Object>> xtList =  platLoginManager.getXtList();
		request.setAttribute("jgList", jgList);
		request.setAttribute("xtList", xtList);
		debugAllRequestParams(request);
		ModelAndView result = new ModelAndView();
		result.setViewName("wszygl/platLoginList");
		if("1".equals(request.getParameter("p_getdata"))){
			try {
				PageRequest pageRequest = newPageRequest(request);
				PageResult<PlatLoginModel> page = this.getBaseManager().pageSelect(pageRequest);
				result.addObject("code", 0);
				result.addObject("msg", "success");
				result.addObject("count", page.getTotalCount());
				result.addObject("data", page.getResult());
			} catch (Exception e) {
				logger.warn(e.getMessage());
				result.addObject("code", 500);
				result.addObject("msg", e.getMessage());
			}
		}
		return result;
		
	}

	
	@RequestMapping("/toqueryDetial")
	public ModelAndView toqueryDetial(HttpServletRequest request,HttpServletResponse response) {
		request.setAttribute("platloginname", request.getParameter("platloginname"));
		request.setAttribute("platname", request.getParameter("platname"));
		System.out.println(request.getParameter("platloginname")+"~~~~~~~~~"+request.getParameter("platname"));
		debugAllRequestParams(request);
		ModelAndView result = new ModelAndView();
		result.setViewName("wszygl/platLoginDetail");
		return result;
		
	}
	
	@RequestMapping("/queryDetail")
	public ModelAndView queryDetial(HttpServletRequest request,HttpServletResponse response) {
		debugAllRequestParams(request);
		ModelAndView result = new ModelAndView();
			try {
				PageRequest pageRequest = newPageRequest(request);
				System.out.println("~~~~~~~~~~~~~~~~~"+pageRequest.getFilters().get("platname")+"~~~~~~~~~~"+pageRequest.getFilters().get("platloginname"));
				PageResult<PlatLoginDetailModel> page = platLoginDetailManager.pageSelect(pageRequest);
				result.addObject("code", 0);
				result.addObject("msg", "success");
				result.addObject("count", page.getTotalCount());
				result.addObject("data", page.getResult());
			} catch (Exception e) {
				logger.warn(e.getMessage());
				result.addObject("code", 500);
				result.addObject("msg", e.getMessage());
			}
		return result;		
	}
	
	@RequestMapping("/deletePlatLogin")
	public ModelAndView deletePlatLogin(HttpServletRequest request,HttpServletResponse response) {
		debugAllRequestParams(request);
		ModelAndView result = new ModelAndView();
			try {
				platLoginDetailManager.deletePlatLogin(request.getParameter("tabid"));
				result.addObject("code", 0);
				result.addObject("msg", "success");
			} catch (Exception e) {
				logger.warn(e.getMessage());
				result.addObject("code", 500);
				result.addObject("msg", e.getMessage());
			}
		return result;
	}
	
	@Override
	public Class<PlatLoginModel> getEntityClass() {
		// TODO Auto-generated method stub
		return PlatLoginModel.class;
	}

	@Override
	public BaseMybatisManager<PlatLoginModel, String> getBaseManager() {
		// TODO Auto-generated method stub
		return platLoginManager;
	}

	@Override
	public String getViewPath() {
		// TODO Auto-generated method stub
		return null;
	}

}
