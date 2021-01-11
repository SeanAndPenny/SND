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
import com.wondersgroup.wszygl.manager.BasscxManger;
import com.wondersgroup.wszygl.model.BasycxModel;
@Controller
@RequestMapping("/basscx")
public class BasscxController extends BaseMybatisController<BasycxModel,String>{
	@Autowired 
	public BasscxManger basscxManger;
	@RequestMapping("/basscx")
	public ModelAndView getSsywjcecharts(HttpServletRequest request,HttpServletResponse response) {
		ModelAndView result = new ModelAndView();
        SimpleDateFormat formatter= new SimpleDateFormat("yyyy-MM-dd");
        Date date = new Date(System.currentTimeMillis());
        Calendar cale = Calendar.getInstance(); 
        cale = Calendar.getInstance();  
        cale.add(Calendar.MONTH, 0);  
        cale.set(Calendar.DAY_OF_MONTH, 1);  
		String basskssj=request.getParameter("p_basskssj");
		String bassjssj=request.getParameter("p_bassjssj");
		String bassjgdm=request.getParameter("p_bassjgdm");
		if(basskssj=="" || basskssj==null) {
			basskssj= formatter.format(cale.getTime()); 	
		};
		if(bassjssj=="" || bassjssj==null) {
			bassjssj= formatter.format(date); 	
		}
		
		try {
			List<BasycxModel>bassechatsList = basscxManger.getBassechats(basskssj,bassjssj,bassjgdm);
			result.addObject("bassechatsList", bassechatsList);
			result.addObject("basskssj", basskssj);
			request.setAttribute("basskssj", basskssj);
			result.addObject("bassjssj", bassjssj);
			request.setAttribute("bassjssj", bassjssj);
			result.addObject("bassjgdm", bassjgdm);
			request.setAttribute("bassjgdm", bassjgdm);
		}catch(Exception e) {
			logger.warn(e.getMessage());
			result.addObject("code", 500);
			result.addObject("msg", e.getMessage());
		}
		 
		return result;
		
	}
	
	
	
	// 病案手术下钻
		@RequestMapping("/bassxz")
		public ModelAndView rycxList(HttpServletRequest request, HttpServletResponse response) {
			 SimpleDateFormat formatter= new SimpleDateFormat("yyyy-MM-dd");
		        Date date = new Date(System.currentTimeMillis());
		        Calendar cale = Calendar.getInstance(); 
		        cale = Calendar.getInstance();  
		        cale.add(Calendar.MONTH, 0);  
		        cale.set(Calendar.DAY_OF_MONTH, 1);  
			String kssj = request.getParameter("p_kssj");
			String jssj = request.getParameter("p_jssj");
			String jgdm = request.getParameter("p_jgdm");
			String ssbm = request.getParameter("p_ssbm"); 
			if(kssj=="" || kssj==null) {
				kssj= formatter.format(cale.getTime()); 	
			};
			if(jssj=="" || jssj==null) {
				jssj= formatter.format(date); 	
			}
			ModelAndView result = new ModelAndView();
			result.setViewName("wszygl/bassxz");
			try { 
				result.addObject("kssj", kssj);
				result.addObject("jssj", jssj);
				result.addObject("jgdm", jgdm);
				result.addObject("ssbm", ssbm);
			    result.addObject("code", 0);
				result.addObject("msg", "success");
				List<BasycxModel>bassxzList = basscxManger.getBassxz(kssj,jssj,jgdm,ssbm);
				 
				result.addObject("bassxzList", bassxzList);
			}catch(Exception e) {
				logger.warn(e.getMessage());
				result.addObject("code", 500);
				result.addObject("msg", e.getMessage());
			}
			return result;

		}
				
				@RequestMapping("/bassxzHz")
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
					String ssbm = request.getParameter("p_ssbm");
					if(kssj=="" || kssj==null) {
						kssj= formatter.format(cale.getTime()); 	
					};
					if(jssj=="" || jssj==null) {
						jssj= formatter.format(date); 	
					}
					ModelAndView result = new ModelAndView(); 
					try {
						result.addObject("kssj", kssj);
						result.addObject("jssj", jssj);
						result.addObject("jgdm", jgdm);
						result.addObject("ssbm", ssbm);
						PageRequest pageRequest = newPageRequest(request);
						PageResult<BasycxModel> page = basscxManger.pageSelect(pageRequest);
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
