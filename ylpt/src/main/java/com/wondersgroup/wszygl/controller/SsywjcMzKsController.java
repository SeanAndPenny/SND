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
import com.wondersgroup.wszygl.manager.SsywjcMzKsManger;
import com.wondersgroup.wszygl.model.SslistModel;
import com.wondersgroup.wszygl.model.SsywjcModel;
@Controller
@RequestMapping("/ssywjcMzKs")
public class SsywjcMzKsController extends BaseMybatisController<SslistModel,String>{
	@Autowired
    public SsywjcMzKsManger ssywjcMzKsManger;
	 
	@RequestMapping("/ssywjcMzKs")
	public ModelAndView rycxList(HttpServletRequest request, HttpServletResponse response) {
		String rq = request.getParameter("p_rq");
		String yljgdm = request.getParameter("p_yljgdm");
		ModelAndView result = new ModelAndView();
		result.setViewName("wszygl/ssywjcMzKs");
		try {
			result.addObject("rq", rq);
			result.addObject("yljgdm", yljgdm);
			PageRequest pageRequest = newPageRequest(request);
			PageResult<SsywjcModel> page = ssywjcMzKsManger.pageSelect(pageRequest);
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

	@RequestMapping("/ssywjcMzKsecharts")
	public ModelAndView ryxzecharts(HttpServletRequest request,HttpServletResponse response) {
		ModelAndView result = new ModelAndView();
		String rq = request.getParameter("p_rq");
		String yljgdm = request.getParameter("p_yljgdm");
		try {
			
			result.addObject("rq", rq);
			result.addObject("yljgdm", yljgdm); 
			List<SsywjcModel>ssywjcMzKsechartsList = ssywjcMzKsManger.getSywjcMzKs(yljgdm,rq);
			result.addObject("ssywjcMzKsechartsList", ssywjcMzKsechartsList);
		}catch(Exception e) {
			logger.warn(e.getMessage());
			result.addObject("code", 500);
			result.addObject("msg", e.getMessage());
		}
		return result;
		
	}

	
	
	@Override
	public Class<SslistModel> getEntityClass() {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public BaseMybatisManager<SslistModel, String> getBaseManager() {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public String getViewPath() {
		// TODO Auto-generated method stub
		return null;
	}

}
