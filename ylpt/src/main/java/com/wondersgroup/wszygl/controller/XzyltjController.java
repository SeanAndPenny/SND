package com.wondersgroup.wszygl.controller;

import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.Date;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.wondersgroup.api.mybatis.manager.BaseMybatisManager;
import com.wondersgroup.frame.spr_mybt_mvc.basic.controller.BaseMybatisController;
import com.wondersgroup.wszygl.manager.XzyltjManger;
import com.wondersgroup.wszygl.model.SwxxJgdmModel;
import com.wondersgroup.wszygl.model.XzyltjModel;

@Controller
@RequestMapping("/xzyltj")
public class XzyltjController extends BaseMybatisController<XzyltjModel, String>{
	@Autowired 
	public XzyltjManger xzyltjManger;
	/*
	 * 因为涉及乡镇，所以无法设置权限
	 * 张春冬
	 */
	@RequestMapping("/xzyltj")
	public ModelAndView xzyltjList(HttpServletRequest request, HttpServletResponse response) {
		ModelAndView result = new ModelAndView();
		String kssj = request.getParameter("p_kssj");
		String jssj = request.getParameter("p_jssj");
		String xzdm = request.getParameter("p_xzdm");
		SimpleDateFormat formatter= new SimpleDateFormat("yyyy-MM-dd");
        Date date = new Date(System.currentTimeMillis());
        Calendar cale = Calendar.getInstance(); 
        cale = Calendar.getInstance();  
        cale.add(Calendar.MONTH, 0);  
        cale.set(Calendar.DAY_OF_MONTH, 1);  
        
		try {
			if(kssj==null||("undefined").equals(kssj)) {
				kssj= formatter.format(cale.getTime()); 
			}
			if(jssj==null||("undefined").equals(jssj)) {
				jssj= formatter.format(date); 	
			}
			
			List<XzyltjModel> xzyltjList = xzyltjManger.getXzyltj(kssj, jssj, xzdm);//乡镇医疗统计分析
			List<SwxxJgdmModel> xzjgList = xzyltjManger.getxzjgList();
			
			result.addObject("kssj", kssj);
			result.addObject("jssj", jssj);
			result.addObject("xzdm", xzdm);
			result.addObject("xzyltjList", xzyltjList);
			result.addObject("xzjgList", xzjgList); ;
		} catch (Exception e) {
			logger.warn(e.getMessage());
			result.addObject("code", 500);
			result.addObject("msg", e.getMessage());
		}
		result.setViewName("wszygl/xzyltj");
		return result;

	}

	
	@RequestMapping("/getchart02")
	public ModelAndView getchartList(HttpServletRequest request, HttpServletResponse response) {
		ModelAndView result = new ModelAndView();
		String kssj = request.getParameter("p_kssj");
		String jssj = request.getParameter("p_jssj");
		String xzdm = request.getParameter("p_xzdm");
		String lx = request.getParameter("p_lx"); 
		try {
			List<XzyltjModel> getchartList = xzyltjManger.getchartList(kssj, jssj, xzdm,lx);			 
			result.addObject("kssj", kssj);
			result.addObject("jssj", jssj);
			result.addObject("xzdm", xzdm);
			result.addObject("lx", lx);
			result.addObject("getchartList", getchartList);
			 ;
		} catch (Exception e) {
			logger.warn(e.getMessage());
			result.addObject("code", 500);
			result.addObject("msg", e.getMessage());
		} 
		return result;

	}

	
	
	@Override
	public Class<XzyltjModel> getEntityClass() {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public BaseMybatisManager<XzyltjModel, String> getBaseManager() {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public String getViewPath() {
		// TODO Auto-generated method stub
		return null;
	}

}
