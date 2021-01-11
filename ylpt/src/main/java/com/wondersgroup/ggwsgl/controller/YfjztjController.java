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
import com.wondersgroup.ggwsgl.manager.YfjztjManager;
import com.wondersgroup.ggwsgl.model.TbModel;
import com.wondersgroup.ggwsgl.model.YfjztjModel;
import com.wondersgroup.ggwsgl.model.YljgModel;

@Controller
@RequestMapping("/yfjz")
public class YfjztjController extends  BaseMybatisController<YfjztjModel,String>{
	@Autowired
	public YfjztjManager yfjztjmanager;
	
	protected final static Logger logger = LoggerFactory.getLogger(BaseMybatisLayuiController.class);
	
	@RequestMapping("/jztj")
	public ModelAndView yfjztjList(HttpServletRequest request,HttpServletResponse response) {
		ModelAndView result = new ModelAndView();
		result.setViewName("ggwsgl/yfjztjList");
		try {
			List<YljgModel> jgList =  yfjztjmanager.getAllYljg();
			request.setAttribute("jgList", jgList);
			PageRequest pageRequest = newPageRequest(request);
			PageResult<YfjztjModel> page = yfjztjmanager.pageSelect(pageRequest);
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
	@RequestMapping("/jztjecharts")
	public ModelAndView jhmyecharts(HttpServletRequest request,HttpServletResponse response) {
		ModelAndView result = new ModelAndView();
		try {
			String yljgdm = request.getParameter("p_yljgdm");
			String startdate = request.getParameter("p_startdate");
			String enddate = request.getParameter("p_enddate");
			List<TbModel>tbList = yfjztjmanager.getAllTb(yljgdm,startdate,enddate);
			result.addObject("tbList", tbList);
		}catch(Exception e) {
			logger.warn(e.getMessage());
			result.addObject("code", 500);
			result.addObject("msg", e.getMessage());
		}
		return result;
		
	}
	@Override
	public Class<YfjztjModel> getEntityClass() {
		// TODO Auto-generated method stub
		return YfjztjModel.class;
	}

	@Override
	public BaseMybatisManager<YfjztjModel, String> getBaseManager() {
		// TODO Auto-generated method stub
		return yfjztjmanager;
	}

	@Override
	public String getViewPath() {
		// TODO Auto-generated method stub
		return null;
	}

}
