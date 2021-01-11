package com.wondersgroup.wszygl.controller;

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

import com.wondersgroup.api.beans.page.PageRequest;
import com.wondersgroup.api.beans.page.PageResult;
import com.wondersgroup.api.mybatis.manager.BaseMybatisManager;
import com.wondersgroup.frame.spr_mybt_mvc.basic.controller.BaseMybatisController;
import com.wondersgroup.frame.spr_mybt_mvc.basic.controller.BaseMybatisLayuiController;
import com.wondersgroup.wszygl.manager.SjscjlManager;
import com.wondersgroup.wszygl.manager.JkdaLogManager;
import com.wondersgroup.wszygl.manager.JkdaTjManager;
import com.wondersgroup.wszygl.manager.PlatLoginDetailManager;
import com.wondersgroup.wszygl.manager.PlatLoginManager;
import com.wondersgroup.wszygl.model.JkdaLogModel;
import com.wondersgroup.wszygl.model.JkdaTjModel;
import com.wondersgroup.wszygl.model.PlatLoginDetailModel;
import com.wondersgroup.wszygl.model.PlatLoginModel;
import com.wondersgroup.ylfwgl.manager.XdsjManager;
import com.wondersgroup.ylfwgl.model.YljgModel;

@Controller
@RequestMapping("/jkdlLog")
public class JkdaLogController extends  BaseMybatisController<JkdaTjModel, String>{
	@Autowired
	public JkdaLogManager kdaLogManager;
	@Autowired
	public JkdaTjManager jkdaTjManager;
	@Autowired
	public XdsjManager xdsjManager;


	@RequestMapping("/queryList")
	public ModelAndView queryList(HttpServletRequest request,HttpServletResponse response) {
		debugAllRequestParams(request);
		ModelAndView result = new ModelAndView();
		List<YljgModel> jgList =  xdsjManager.getAllYljg();
		request.setAttribute("jgList", jgList);
		result.setViewName("wszygl/query_jkdalog");
		try {
			PageRequest pageRequest = newPageRequest(request);
			PageResult<JkdaTjModel> page = this.getBaseManager().pageSelect(pageRequest);
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


	
	@RequestMapping("/showOne")
	public ModelAndView showOne(HttpServletRequest request,HttpServletResponse response) {
		debugAllRequestParams(request);
		ModelAndView result = new ModelAndView();
		List<YljgModel> jgList =  xdsjManager.getAllYljg();
		request.setAttribute("jgList", jgList);
		result.setViewName("wszygl/jkdalog_show");
		String  days=request.getParameter("s_days");
		String  yljg=request.getParameter("s_yljg");
		
		try {
			PageRequest pageRequest = newPageRequest(request);
			PageResult<JkdaLogModel> page = kdaLogManager.pageSelect(pageRequest);
			result.addObject("code", 0);
			result.addObject("msg", "success");
			result.addObject("count", page.getTotalCount());
			result.addObject("data", page.getResult());
			result.addObject("days", days);
			result.addObject("yljg", yljg);
		} catch (Exception e) {
			logger.warn(e.getMessage());
			result.addObject("code", 500);
			result.addObject("msg", e.getMessage());
		}
		
		return result;
		
	}
	
	
	
	@Override
	public Class<JkdaTjModel> getEntityClass() {
		// TODO Auto-generated method stub
		return JkdaTjModel.class;
	}

	@Override
	public BaseMybatisManager<JkdaTjModel, String> getBaseManager() {
		// TODO Auto-generated method stub
		return jkdaTjManager;
	}

	@Override
	public String getViewPath() {
		// TODO Auto-generated method stub
		return null;
	}

}
