package com.wondersgroup.wszygl.controller;

import java.util.List;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;
import com.wondersgroup.api.beans.page.PageRequest;
import com.wondersgroup.api.beans.page.PageResult;
import com.wondersgroup.api.mybatis.manager.BaseMybatisManager;
import com.wondersgroup.frame.spr_mybt_mvc.basic.controller.BaseMybatisController;
import com.wondersgroup.wszygl.manager.JtysFwbXzManger;
import com.wondersgroup.wszygl.model.JtysModel;


@Component
@RequestMapping("/jtysFwbXz")
public class JtysFwbXzController extends BaseMybatisController<JtysModel,String>{
	@Autowired
    public  JtysFwbXzManger jtysFwbXzManger;
	
	@RequestMapping("/jtysFwbXz")
	public ModelAndView rycxList(HttpServletRequest request, HttpServletResponse response) {
	    String fwbid = request.getParameter("p_fwbid");
		ModelAndView result = new ModelAndView();
		result.setViewName("wszygl/jtysFwbXz");
		try { 
			 
			result.addObject("fwbid", fwbid);
			PageRequest pageRequest = newPageRequest(request);
			PageResult<JtysModel> page = jtysFwbXzManger.pageSelect(pageRequest);
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

	@RequestMapping("/jtysFwbXzecharts")
	public ModelAndView ryxzecharts(HttpServletRequest request,HttpServletResponse response) {
		ModelAndView result = new ModelAndView();
		  String fwbid = request.getParameter("p_fwbid");
		try { 
			result.addObject("fwbid", fwbid);
			List<JtysModel>jtysFwbXzechartsList = jtysFwbXzManger.getJtysFwbXz(fwbid);
			result.addObject("jtysFwbXzechartsList", jtysFwbXzechartsList);
		}catch(Exception e) {
			logger.warn(e.getMessage());
			result.addObject("code", 500);
			result.addObject("msg", e.getMessage());
		}
		return result;
		
	}
	
	@Override
	public Class<JtysModel> getEntityClass() {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public BaseMybatisManager<JtysModel, String> getBaseManager() {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public String getViewPath() {
		// TODO Auto-generated method stub
		return null;
	}
}
