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
import com.wondersgroup.wszygl.manager.JcXzYsManger;
import com.wondersgroup.wszygl.model.JcModel;


@Controller
@RequestMapping("/JcXzYs")
public class JcXzYsController extends BaseMybatisController<JcModel,String>{
	@Autowired
    public JcXzYsManger jcXzYsManger;
	@RequestMapping("/JcXzYs")
	public ModelAndView rycxList(HttpServletRequest request, HttpServletResponse response) {
		String sfws = request.getParameter("p_sfws");
		String yljgdm = request.getParameter("p_yljgdm");
		String sqks = request.getParameter("p_sqks");
		
	 	ModelAndView result = new ModelAndView();
		result.setViewName("wszygl/JcXzYs");
		try {
			result.addObject("yljgdm", yljgdm);
			result.addObject("sfws", sfws);
			result.addObject("sqks", sqks);
			PageRequest pageRequest = newPageRequest(request);
			PageResult<JcModel> page = jcXzYsManger.pageSelect(pageRequest);
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

	@RequestMapping("/JcXzYsecharts")
	public ModelAndView ryxzecharts(HttpServletRequest request,HttpServletResponse response) {
		ModelAndView result = new ModelAndView();
		String sfws = request.getParameter("p_sfws");
		String yljgdm = request.getParameter("p_yljgdm");
		String sqks = request.getParameter("p_sqks");
		try {
			result.addObject("sfws", sfws);
			result.addObject("yljgdm", yljgdm); 
			result.addObject("sqks", sqks);
			List<JcModel>JcXzYsechartslist = jcXzYsManger.getJcXzYs(sfws,yljgdm,sqks);
			result.addObject("JcXzYsechartslist", JcXzYsechartslist);
		}catch(Exception e) {
			logger.warn(e.getMessage());
			result.addObject("code", 500);
			result.addObject("msg", e.getMessage());
		}
		return result;
		
	}
	/*@RequestMapping("/jybgdbh")
	public ModelAndView jybgdbh(HttpServletRequest request,HttpServletResponse response) {
		ModelAndView result = new ModelAndView();
		String bgdh = request.getParameter("p_bgdh");
		String yljgdm = request.getParameter("p_yljgdm");
		String bgrq = request.getParameter("p_bgrq");
		try {
			result.addObject("bgdh", bgdh);
			result.addObject("yljgdm", yljgdm); 
			result.addObject("bgrq", bgrq);
			JcModel jcrxx = jcXzYsManger.getJcbgdbh(bgdh,yljgdm,bgrq);
			List<JcModel> jcrxxList=jcXzYsManger.getJcbgdbhList(bgdh,yljgdm,bgrq);
			result.addObject("jcrxxList", jcrxxList);
			result.addObject("jcrxx", jcrxx);
		}catch(Exception e) {
			logger.warn(e.getMessage());
			result.addObject("code", 500);
			result.addObject("msg", e.getMessage());
		}
		result.setViewName("wszygl/jcbgdbh");
		return result;
		
	}*/
	
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
