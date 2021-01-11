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
import com.wondersgroup.wszygl.manager.BasycxManger;
import com.wondersgroup.wszygl.model.BasycxModel;
 
@Controller
@RequestMapping("/basycx")
public class BasycxController extends BaseMybatisController<BasycxModel,String>{
	@Autowired 
	public BasycxManger basycxManger;
	@RequestMapping("/basycx")
	public ModelAndView getSsywjcecharts(HttpServletRequest request,HttpServletResponse response) {
		ModelAndView result = new ModelAndView();
        SimpleDateFormat formatter= new SimpleDateFormat("yyyy-MM-dd");
        Date date = new Date(System.currentTimeMillis());
        Calendar cale = Calendar.getInstance(); 
        cale = Calendar.getInstance();  
        cale.add(Calendar.MONTH, 0);  
        cale.set(Calendar.DAY_OF_MONTH, 1);  
		String kssj=request.getParameter("p_kssj");
		String jssj=request.getParameter("p_jssj");
		String bajgdm=request.getParameter("p_bajgdm");
		if(kssj=="" || kssj==null) {
			kssj= formatter.format(cale.getTime()); 	
		};
		if(jssj=="" || jssj==null) {
			jssj= formatter.format(date); 	
		}
		try {
			List<BasycxModel>basycxechatsList = basycxManger.getBasycxechats(kssj,jssj,bajgdm);
			result.addObject("basycxechatsList", basycxechatsList);
			result.addObject("kssj", kssj);
			request.setAttribute("kssj", kssj);
			result.addObject("jssj", jssj);
			request.setAttribute("jssj", jssj);
			result.addObject("bajgdm", bajgdm);
			request.setAttribute("bajgdm", bajgdm);
		}catch(Exception e) {
			logger.warn(e.getMessage());
			result.addObject("code", 500);
			result.addObject("msg", e.getMessage());
		}
		 
		return result;
		
	}
	
	
	
	// 病案首页下钻
	@RequestMapping("/basyxz")
	public ModelAndView rycxList(HttpServletRequest request, HttpServletResponse response) {
		 SimpleDateFormat formatter= new SimpleDateFormat("yyyy-MM-dd");
	        Date date = new Date(System.currentTimeMillis());
	        Calendar cale = Calendar.getInstance(); 
	        cale = Calendar.getInstance();  
	        cale.add(Calendar.MONTH, 0);  
	        cale.set(Calendar.DAY_OF_MONTH, 1);  
		String kssj = request.getParameter("p_kssj");
		String jssj = request.getParameter("p_jssj");
		String jbdm = request.getParameter("p_jbdm");
		String bajgdm = request.getParameter("p_bajgdm"); 
		if(kssj=="" || kssj==null) {
			kssj= formatter.format(cale.getTime()); 	
		};
		if(jssj=="" || jssj==null) {
			jssj= formatter.format(date); 	
		}
		ModelAndView result = new ModelAndView();
		result.setViewName("wszygl/basyxz");
		try { 
			result.addObject("kssj", kssj);
			result.addObject("jssj", jssj);
			result.addObject("jbdm", jbdm);
			result.addObject("bajgdm", bajgdm);
		    result.addObject("code", 0);
			result.addObject("msg", "success");
			List<BasycxModel>basyxzList = basycxManger.getBasyxz(kssj,jssj,jbdm,bajgdm);
			result.addObject("basyxzList", basyxzList);
		}catch(Exception e) {
			logger.warn(e.getMessage());
			result.addObject("code", 500);
			result.addObject("msg", e.getMessage());
		}
		return result;

	}
			
			@RequestMapping("/basyxzHz")
			public ModelAndView basyxzList(HttpServletRequest request, HttpServletResponse response) {
				 SimpleDateFormat formatter= new SimpleDateFormat("yyyy-MM-dd");
			        Date date = new Date(System.currentTimeMillis());
			        Calendar cale = Calendar.getInstance(); 
			        cale = Calendar.getInstance();  
			        cale.add(Calendar.MONTH, 0);  
			        cale.set(Calendar.DAY_OF_MONTH, 1);  
				String kssj = request.getParameter("p_kssj");
				String jssj = request.getParameter("p_jssj");
				String jbdm = request.getParameter("p_jbdm");
				String bajgdm = request.getParameter("p_bajgdm");
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
					result.addObject("jbdm", jbdm);
					result.addObject("bajgdm", bajgdm);
					PageRequest pageRequest = newPageRequest(request);
					PageResult<BasycxModel> page = basycxManger.pageSelect(pageRequest);
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
