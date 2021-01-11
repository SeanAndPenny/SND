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
import com.wondersgroup.ggwsgl.manager.JyqyManager;
import com.wondersgroup.ggwsgl.model.JyqyModel;
import com.wondersgroup.ggwsgl.model.TbModel;
import com.wondersgroup.ggwsgl.model.YljgModel;

@Controller
@RequestMapping("/jyqy")
public class JyqyController extends  BaseMybatisController<JyqyModel,String>{
	
	@Autowired
	public JyqyManager jyqyManager;
	
	protected final static Logger logger = LoggerFactory.getLogger(BaseMybatisLayuiController.class);
	@RequestMapping("/qyxx")
	public ModelAndView jyqyList(HttpServletRequest request,HttpServletResponse response) {
		ModelAndView result = new ModelAndView();
		result.setViewName("ggwsgl/jyqyList");
		try {
			List<YljgModel> jgList =  jyqyManager.getAllYljg();
			request.setAttribute("jgList", jgList);
			PageRequest pageRequest = newPageRequest(request);
			PageResult<JyqyModel> page = jyqyManager.pageSelect(pageRequest);
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
	
	@RequestMapping("/jyqyecharts")
	public ModelAndView jyqyecharts(HttpServletRequest request,HttpServletResponse response) {
		ModelAndView result = new ModelAndView();
		try {
			String yljgdm = request.getParameter("p_yljgdm");
			String startdate = request.getParameter("p_startdate");
			String enddate = request.getParameter("p_enddate");
			List<TbModel>tbList = jyqyManager.getAllTb(yljgdm,startdate,enddate);
			result.addObject("tbList", tbList);
		}catch(Exception e) {
			logger.warn(e.getMessage());
			result.addObject("code", 500);
			result.addObject("msg", e.getMessage());
		}
		return result;
		
	}

	@Override
	public Class<JyqyModel> getEntityClass() {
		// TODO Auto-generated method stub
		return JyqyModel.class;
	}

	@Override
	public BaseMybatisManager<JyqyModel, String> getBaseManager() {
		// TODO Auto-generated method stub
		return jyqyManager;
	}

	@Override
	public String getViewPath() {
		// TODO Auto-generated method stub
		return null;
	}

}
