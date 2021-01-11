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
import com.wondersgroup.wszygl.manager.JtysJgXzysManger;
import com.wondersgroup.wszygl.model.JtysModel;
@Component
@RequestMapping("/jtysJgXzys")
public class JtysJgXzysController extends BaseMybatisController<JtysModel,String>{
	@Autowired
    public  JtysJgXzysManger jtysJgXzysManger;
	
	@RequestMapping("/jtysJgXzys")
	public ModelAndView rycxList(HttpServletRequest request, HttpServletResponse response) {
		String tdbh = request.getParameter("p_tdbh");
		String qyjgid = request.getParameter("p_qyjgid");
		ModelAndView result = new ModelAndView();
		result.setViewName("wszygl/jtysJgXzys");
		try { 
			result.addObject("tdbh", tdbh);
			result.addObject("qyjgid", qyjgid);
		    result.addObject("code", 0);
			result.addObject("msg", "success");
			List<JtysModel>jtysJgXzysList = jtysJgXzysManger.getJtysJgXzys(tdbh,qyjgid);
			result.addObject("jtysJgXzysList", jtysJgXzysList);
		}catch(Exception e) {
			logger.warn(e.getMessage());
			result.addObject("code", 500);
			result.addObject("msg", e.getMessage());
		}
		return result;

	}
	 
	@RequestMapping("/jtysJgXzysXx")
	public ModelAndView jtysTdXzHzList(HttpServletRequest request, HttpServletResponse response) {
		String  ysid = request.getParameter("p_ysid"); 
		String tdbh = request.getParameter("p_tdbh");
		String qyjgid = request.getParameter("p_qyjgid");
		ModelAndView result = new ModelAndView();
		try {  
			PageRequest pageRequest = newPageRequest(request);
			PageResult<JtysModel> page = jtysJgXzysManger.pageSelect(pageRequest);
			result.addObject("ysid", ysid);
			result.addObject("tdbh", tdbh);
			result.addObject("qyjgid", qyjgid);
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
