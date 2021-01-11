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
import com.wondersgroup.api.beans.page.PageRequest;
import com.wondersgroup.api.beans.page.PageResult;
import com.wondersgroup.api.mybatis.manager.BaseMybatisManager;
import com.wondersgroup.frame.spr_mybt_mvc.basic.controller.BaseMybatisController;
import com.wondersgroup.wszygl.manager.MrsjqkManger;
import com.wondersgroup.wszygl.model.BmModel;
import com.wondersgroup.wszygl.model.MrsjqkModel;
import com.wondersgroup.wszygl.model.YljgMcModel;


@Controller
@RequestMapping("/mrsjqk")
public class MrsjqkController  extends BaseMybatisController<MrsjqkModel, String> {
	@Autowired
	public MrsjqkManger mrsjqkManger;
	@RequestMapping("/mrsjqk")
	public ModelAndView jjhzjbfxList(HttpServletRequest request, HttpServletResponse response) {
		ModelAndView result = new ModelAndView(); 
		 SimpleDateFormat formatter= new SimpleDateFormat("yyyy-MM-dd");
	        Date date = new Date(System.currentTimeMillis());
	        Calendar cale = Calendar.getInstance(); 
	        cale = Calendar.getInstance();  
	        cale.add(Calendar.MONTH, 0);  
	        cale.set(Calendar.DAY_OF_MONTH, 1); 
		String yljgdm = request.getParameter("p_yljgdm"); 
		String bm = request.getParameter("p_bm"); 
		 String  startdate = request.getParameter("p_startdate"); 
		String enddate = request.getParameter("p_enddate"); 
		if(startdate=="" || startdate==null) {
			startdate= formatter.format(cale.getTime()); 	
		};
		if(enddate=="" || enddate==null) {
			enddate= formatter.format(date); 	
		}
		
		
		result.setViewName("wszygl/mrsjqk");
		try { 
			List<YljgMcModel> jgList =  mrsjqkManger.getAllYljg();
			request.setAttribute("jgList", jgList);
			List<BmModel> bmList =  mrsjqkManger.getAllBm();
			request.setAttribute("bmList", bmList);
			
			PageRequest pageRequest = newPageRequest(request);
			PageResult<MrsjqkModel> page = mrsjqkManger.pageSelect(pageRequest);
			result.addObject("startdate", startdate);
			result.addObject("enddate", enddate); 
			result.addObject("yljgdm", yljgdm); 
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
	public Class<MrsjqkModel> getEntityClass() {
		// TODO Auto-generated method stub
		return null;
	}
	@Override
	public BaseMybatisManager<MrsjqkModel, String> getBaseManager() {
		// TODO Auto-generated method stub
		return null;
	}
	@Override
	public String getViewPath() {
		// TODO Auto-generated method stub
		return null;
	}
	 

}
