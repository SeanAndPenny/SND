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
import com.wondersgroup.wszygl.manager.JyXzYsManger;
import com.wondersgroup.wszygl.model.JyModel;

@Controller
@RequestMapping("/JyXzYs")
public class JyXzYsController extends BaseMybatisController<JyModel,String>{
	@Autowired
    public JyXzYsManger jyXzYsManger;
	
	@RequestMapping("/JyXzYs")
	public ModelAndView rycxList(HttpServletRequest request, HttpServletResponse response) {
		String sfws = request.getParameter("p_sfws");
		String yljgdm = request.getParameter("p_yljgdm");
		String sqks = request.getParameter("p_sqks");
		
	 	ModelAndView result = new ModelAndView();
		result.setViewName("wszygl/JyXzYs");
		try {
			result.addObject("yljgdm", yljgdm);
			result.addObject("sfws", sfws);
			result.addObject("sqks", sqks);
			PageRequest pageRequest = newPageRequest(request);
			PageResult<JyModel> page = jyXzYsManger.pageSelect(pageRequest);
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

	@RequestMapping("/JyXzYsecharts")
	public ModelAndView ryxzecharts(HttpServletRequest request,HttpServletResponse response) {
		ModelAndView result = new ModelAndView();
		String sfws = request.getParameter("p_sfws");
		String yljgdm = request.getParameter("p_yljgdm");
		String sqks = request.getParameter("p_sqks");
		try {
			result.addObject("sfws", sfws);
			result.addObject("yljgdm", yljgdm); 
			result.addObject("sqks", sqks);
			List<JyModel>JyXzYsechartslist = jyXzYsManger.getJyXzYs(sfws,yljgdm,sqks);
			result.addObject("JyXzYsechartslist", JyXzYsechartslist);
		}catch(Exception e) {
			logger.warn(e.getMessage());
			result.addObject("code", 500);
			result.addObject("msg", e.getMessage());
		}
		return result;
		
	}
	@RequestMapping("/jybgdbh")
	public ModelAndView jybgdbh(HttpServletRequest request,HttpServletResponse response) {
		ModelAndView result = new ModelAndView();
		String bgdh = request.getParameter("p_bgdh");
		String yljgdm = request.getParameter("p_yljgdm");
		String bgrq = request.getParameter("p_bgrq");
		try {
			result.addObject("bgdh", bgdh);
			result.addObject("yljgdm", yljgdm); 
			result.addObject("bgrq", bgrq);
			JyModel jyrxx = jyXzYsManger.getJybgdbh(bgdh,yljgdm,bgrq);
			List<JyModel> jyrxxList=jyXzYsManger.getJybgdbhList(bgdh,yljgdm,bgrq);
			result.addObject("jyrxxList", jyrxxList);
			result.addObject("jyrxx", jyrxx);
		}catch(Exception e) {
			logger.warn(e.getMessage());
			result.addObject("code", 500);
			result.addObject("msg", e.getMessage());
		}
		result.setViewName("wszygl/jybgdbh");
		return result;
		
	}
	
	
	
	@Override
	public Class<JyModel> getEntityClass() {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public BaseMybatisManager<JyModel, String> getBaseManager() {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public String getViewPath() {
		// TODO Auto-generated method stub
		return null;
	}

}
