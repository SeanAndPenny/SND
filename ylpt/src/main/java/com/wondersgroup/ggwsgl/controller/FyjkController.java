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
import com.wondersgroup.ggwsgl.manager.FyjkManager;
import com.wondersgroup.ggwsgl.model.FyjkModel;
import com.wondersgroup.ggwsgl.model.TbModel;
import com.wondersgroup.ggwsgl.model.YljgModel;

@Controller
@RequestMapping("/fy")
public class FyjkController extends  BaseMybatisController<FyjkModel,String>{
	@Autowired
	private FyjkManager fyjkManager;
	protected final static Logger logger = LoggerFactory.getLogger(BaseMybatisLayuiController.class);
	@RequestMapping("/fybj")
	public ModelAndView fyjkList(HttpServletRequest request,HttpServletResponse response) {
		ModelAndView result = new ModelAndView();
		result.setViewName("ggwsgl/fyJk");
		try {
			List<YljgModel> jgList =  fyjkManager.getAllYljg();
			request.setAttribute("jgList", jgList);
			PageRequest pageRequest = newPageRequest(request);
			PageResult<FyjkModel> page = fyjkManager.pageSelect(pageRequest);
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
	
	@RequestMapping("/fyecharts")
	public ModelAndView zytzbsecharts(HttpServletRequest request,HttpServletResponse response) {
		ModelAndView result = new ModelAndView();
		try {
			String yljgdm = request.getParameter("p_yljgdm");
			String startdate = request.getParameter("p_startdate");
			String enddate = request.getParameter("p_enddate");
			String sfzh = "";
			List<TbModel>tbList = fyjkManager.getAllTb(yljgdm,startdate,enddate,sfzh);
			result.addObject("tbList", tbList);
		}catch(Exception e) {
			logger.warn(e.getMessage());
			result.addObject("code", 500);
			result.addObject("msg", e.getMessage());
		}
		return result;
		
	}
	
	@Override
	public Class<FyjkModel> getEntityClass() {
		
		return FyjkModel.class;
	}

	@Override
	public BaseMybatisManager<FyjkModel, String> getBaseManager() {
		
		return fyjkManager;
	}

	@Override
	public String getViewPath() {
		
		return null;
	}

}
