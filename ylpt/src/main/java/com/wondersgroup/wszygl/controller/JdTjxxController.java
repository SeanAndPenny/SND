package com.wondersgroup.wszygl.controller;

import java.util.ArrayList;
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
import com.wondersgroup.wszygl.manager.JdtjManger;
import com.wondersgroup.wszygl.model.JdtjModel;



@Controller
@RequestMapping("/jdTjxx")
public class JdTjxxController extends BaseMybatisController<JdtjModel,String>{
	@Autowired
	public JdtjManger jdtjManger;
	
	@RequestMapping("/jdTjxx")
	public ModelAndView rycxList(HttpServletRequest request, HttpServletResponse response) {
		ModelAndView result = new ModelAndView();
		result.setViewName("wszygl/jdTjxx");		
		try {
			 PageRequest pageRequest = newPageRequest(request);
			PageResult<JdtjModel> page = jdtjManger.pageSelect(pageRequest);
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
	@RequestMapping("/jdTjxxecharts")
	public ModelAndView ryxzecharts(HttpServletRequest request,HttpServletResponse response) {
		ModelAndView result = new ModelAndView(); 
		try {
			List<JdtjModel>jdTjxxechartslist = jdtjManger.getJdTjxxecharts();  
			result.addObject("jdTjxxechartslist", jdTjxxechartslist);
		}catch(Exception e) {
			logger.warn(e.getMessage());
			result.addObject("code", 500);
			result.addObject("msg", e.getMessage());
		}
		return result;
		
	}
	
	
	
	
	
	@RequestMapping("/jdtjXzxx")
	public ModelAndView jdtjXzxxList(HttpServletRequest request, HttpServletResponse response) {
		ModelAndView result = new ModelAndView();
		result.setViewName("wszygl/jdtjXzxx");		
		try {//  
			String jdlx=request.getParameter("p_jdlx");
			List<JdtjModel> jdtjXzxxList = jdtjManger.jdtjXzxx(jdlx);
			result.addObject("jdtjXzxxList", jdtjXzxxList); 
			List<String> yljgmcList = new ArrayList<String>();
			List<String> lxmcList = new ArrayList<String>();
			List<String> rsList = new ArrayList<String>();
			List<String> blList = new ArrayList<String>();
			
			for (int i = 0; i < jdtjXzxxList.size(); i++) {
				yljgmcList.add("'" + jdtjXzxxList.get(i).getYljgmc() + "'");
				lxmcList.add("'" + jdtjXzxxList.get(i).getLxmc() + "'");
				rsList.add("'" + jdtjXzxxList.get(i).getRs() + "'");
				blList.add("'" + jdtjXzxxList.get(i).getBl() + "'");
			}
			request.setAttribute("yljgmcList", yljgmcList);
			request.setAttribute("lxmcList", lxmcList);
			request.setAttribute("rsList", rsList);
			request.setAttribute("blList", blList);
			
			
			 
		} catch (Exception e) {
			logger.warn(e.getMessage());
			result.addObject("code", 500);
			result.addObject("msg", e.getMessage());
		}
		return result;

	}
	
	
	
	@Override
	public Class<JdtjModel> getEntityClass() {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public BaseMybatisManager<JdtjModel, String> getBaseManager() {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public String getViewPath() {
		// TODO Auto-generated method stub
		return null;
	}

}
