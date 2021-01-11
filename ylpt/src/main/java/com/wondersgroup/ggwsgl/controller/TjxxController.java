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

import com.wondersgroup.api.beans.page.PageRequest;
import com.wondersgroup.api.beans.page.PageResult;
import com.wondersgroup.api.mybatis.manager.BaseMybatisManager;
import com.wondersgroup.frame.spr_mybt_mvc.basic.controller.BaseMybatisController;
import com.wondersgroup.frame.spr_mybt_mvc.basic.controller.BaseMybatisLayuiController;
import com.wondersgroup.ggwsgl.manager.TjxxManager;
import com.wondersgroup.ggwsgl.model.TbModel;
import com.wondersgroup.ggwsgl.model.TjxxDetailModel;
import com.wondersgroup.ggwsgl.model.TjxxModel;
import com.wondersgroup.ggwsgl.model.YljgModel;

@Controller
@RequestMapping("/tj")
public class TjxxController extends  BaseMybatisController<TjxxModel,String>{
	@Autowired
	public TjxxManager tjxxManager;
	
	
	
	protected final static Logger logger = LoggerFactory.getLogger(BaseMybatisLayuiController.class);
	
	@RequestMapping("/tjxx")
	
	public ModelAndView tjxxList(HttpServletRequest request,HttpServletResponse response) {
		ModelAndView result=new  ModelAndView();
		result.setViewName("ggwsgl/tjxxList");
		try {
			List<YljgModel> jgList =  tjxxManager.getAllYljg();
			request.setAttribute("jgList", jgList);
			PageRequest pageRequest = newPageRequest(request);
			PageResult<TjxxModel> page = tjxxManager.pageSelect(pageRequest);
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
	@RequestMapping("/tjxxecharts")
	public ModelAndView tjxxecharts(HttpServletRequest request,HttpServletResponse response) {
		ModelAndView result = new ModelAndView();
		try {
			String yljgdm = request.getParameter("p_yljgdm");
			String startdate = request.getParameter("p_startdate");
			String enddate = request.getParameter("p_enddate");
			List<TbModel>tbList = tjxxManager.getAllTb(yljgdm,startdate,enddate);
			result.addObject("tbList", tbList);
		}catch(Exception e) {
			logger.warn(e.getMessage());
			result.addObject("code", 500);
			result.addObject("msg", e.getMessage());
		}
		return result;
		
	}
	@RequestMapping("/tjxxdetail")
	public ModelAndView tjxxDetail(HttpServletRequest request,HttpServletResponse response) {
		ModelAndView result = new ModelAndView();
		result.setViewName("ggwsgl/tjxxDetail");
		try {
			String tjbh = request.getParameter("tjbh");
			String yljgdm = request.getParameter("yljgdm");
			
			List<TjxxDetailModel>tjxxDetail = tjxxManager.getTjxxDetail(tjbh, yljgdm);
			request.setAttribute("tjxxDetail", tjxxDetail);
			PageRequest pageRequest = newPageRequest(request);
			PageResult<TjxxModel> page = tjxxManager.pageSelect(pageRequest);
			
			result.addObject("code", 0);
			result.addObject("msg", "success");
			result.addObject("count", page.getTotalCount());
			result.addObject("data", page.getResult());
		}catch(Exception e ) {
			logger.warn(e.getMessage());
			result.addObject("code", 500);
			result.addObject("msg", e.getMessage());
		}
		return result;
	}
	@Override
	public Class<TjxxModel> getEntityClass() {
		// TODO Auto-generated method stub
		return TjxxModel.class;
	}

	@Override
	public BaseMybatisManager<TjxxModel, String> getBaseManager() {
		// TODO Auto-generated method stub
		return tjxxManager;
	}

	@Override
	public String getViewPath() {
		// TODO Auto-generated method stub
		return null;
	}

}
