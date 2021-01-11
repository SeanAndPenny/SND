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
import com.wondersgroup.wszygl.manager.JcXzKsManger;
import com.wondersgroup.wszygl.model.JcModel;

@Controller
@RequestMapping("/JcXzKs")
public class JcXzKsController extends BaseMybatisController<JcModel,String>{
	
	@Autowired
    public JcXzKsManger jcXzKsManger;
	
    @RequestMapping("/JcXzKs")
	public ModelAndView rycxList(HttpServletRequest request, HttpServletResponse response) {
		String sfws = request.getParameter("p_sfws");
		String yljgdm = request.getParameter("p_yljgdm");
	 	ModelAndView result = new ModelAndView();
		result.setViewName("wszygl/JcXzKs");
		try {
			result.addObject("yljgdm", yljgdm);
			result.addObject("sfws", sfws);
			PageRequest pageRequest = newPageRequest(request);
			PageResult<JcModel> page = jcXzKsManger.pageSelect(pageRequest);
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

	@RequestMapping("/JcXzKsecharts")
	public ModelAndView ryxzecharts(HttpServletRequest request,HttpServletResponse response) {
		ModelAndView result = new ModelAndView();
		String sfws = request.getParameter("p_sfws");
		String yljgdm = request.getParameter("p_yljgdm");
		try {
			result.addObject("sfws", sfws);
			result.addObject("yljgdm", yljgdm); 
			List<JcModel>JcXzKsechartslist = jcXzKsManger.getJcXzKs(sfws,yljgdm);
			result.addObject("JcXzKsechartslist", JcXzKsechartslist);
		}catch(Exception e) {
			logger.warn(e.getMessage());
			result.addObject("code", 500);
			result.addObject("msg", e.getMessage());
		}
		return result;
		
	}


	@Override
	public Class<JcModel> getEntityClass() {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public BaseMybatisManager<JcModel, String> getBaseManager() {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public String getViewPath() {
		// TODO Auto-generated method stub
		return null;
	}

}
