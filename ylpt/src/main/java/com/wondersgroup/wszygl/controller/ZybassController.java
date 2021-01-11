package com.wondersgroup.wszygl.controller;

import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.Date;

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
import com.wondersgroup.wszygl.manager.ZybassManger;
import com.wondersgroup.wszygl.model.BasycxModel;
@Controller
@RequestMapping("/zybass")
public class ZybassController extends BaseMybatisController<BasycxModel,String>{
	@Autowired 
	public ZybassManger zybassManger;
	
	@RequestMapping("/zybass")
	public ModelAndView basyxzList(HttpServletRequest request, HttpServletResponse response) {
		 SimpleDateFormat formatter= new SimpleDateFormat("yyyy-MM-dd");
	        Date date = new Date(System.currentTimeMillis());
	        Calendar cale = Calendar.getInstance(); 
	        cale = Calendar.getInstance();  
	        cale.add(Calendar.MONTH, 0);  
	        cale.set(Calendar.DAY_OF_MONTH, 1);  
		String kssj = request.getParameter("p_kssj");
		String jssj = request.getParameter("p_jssj"); 
		String jgdm = request.getParameter("p_jgdm");
		if(kssj=="" || kssj==null) {
			kssj= formatter.format(cale.getTime()); 	
		};
		if(jssj=="" || jssj==null) {
			jssj= formatter.format(date); 	
		}
		ModelAndView result = new ModelAndView(); 
		result.setViewName("wszygl/zybass");
		try {
			result.addObject("kssj", kssj);
			result.addObject("jssj", jssj);
			result.addObject("jgdm", jgdm);
			PageRequest pageRequest = newPageRequest(request);
			PageResult<BasycxModel> page = zybassManger.pageSelect(pageRequest);
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
	public Class<BasycxModel> getEntityClass() {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public BaseMybatisManager<BasycxModel, String> getBaseManager() {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public String getViewPath() {
		// TODO Auto-generated method stub
		return null;
	}

}
