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
import com.wondersgroup.wszygl.manager.SsywjcManger;
import com.wondersgroup.wszygl.manager.SsywjcxzManger;
import com.wondersgroup.wszygl.model.SsywjcModel;
@Controller
@RequestMapping("/ssywjc")
public class SsywjcController extends BaseMybatisController<SsywjcModel,String>{
	@Autowired
	public SsywjcManger ssywjcManger;
	@Autowired 
	public SsywjcxzManger ssywjcxzManger;
	//主页面实时业务监测图形
	@RequestMapping("/getSsywjcechats")
	public ModelAndView getSsywjcecharts(HttpServletRequest request,HttpServletResponse response) {
		ModelAndView result = new ModelAndView();
		try {
			 String ywkssj=request.getParameter("p_ywkssj");
			 String ywjssj=request.getParameter("p_ywjssj"); 
			 result.addObject("ywkssj", ywkssj);
			 result.addObject("ywjssj", ywjssj); 
			 
			List<SsywjcModel>ssywjcechatsList = ssywjcManger.getSsywjcechats(ywkssj,ywjssj);
			result.addObject("ssywjcechatsList", ssywjcechatsList);
		}catch(Exception e) {
			logger.warn(e.getMessage());
			result.addObject("code", 500);
			result.addObject("msg", e.getMessage());
		}
		return result;
		
	}
	
	//实时业务监测_入院_下钻入院数据
	@RequestMapping("/ssywjcRyrsXz")
	public ModelAndView rycxList(HttpServletRequest request, HttpServletResponse response) {
		String rq = request.getParameter("p_rq");
		ModelAndView result = new ModelAndView();
		result.setViewName("wszygl/ssywjcRyrsXz");
		try {
			result.addObject("rq", rq);
			PageRequest pageRequest = newPageRequest(request);
			PageResult<SsywjcModel> page = ssywjcxzManger.pageSelect(pageRequest);
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

	@RequestMapping("/ssywjcRyrsXzecharts")
	public ModelAndView ryxzecharts(HttpServletRequest request,HttpServletResponse response) {
		ModelAndView result = new ModelAndView();
		try {
			
			String rq = request.getParameter("p_rq");
			List<SsywjcModel>ssywjcRyrsXzechartsList = ssywjcManger.getSsywjcjg(rq );
			result.addObject("ssywjcRyrsXzechartsList", ssywjcRyrsXzechartsList);
		}catch(Exception e) {
			logger.warn(e.getMessage());
			result.addObject("code", 500);
			result.addObject("msg", e.getMessage());
		}
		return result;
		
	}
	
	
	@Override
	public Class<SsywjcModel> getEntityClass() {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public BaseMybatisManager<SsywjcModel, String> getBaseManager() {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public String getViewPath() {
		// TODO Auto-generated method stub
		return null;
	}
	

}
