package com.wondersgroup.wszygl.controller;

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
import com.wondersgroup.wszygl.manager.Ybtable2Manager;
import com.wondersgroup.wszygl.manager.YbtableManager;
import com.wondersgroup.wszygl.model.YbFytjModel;


@Controller
@RequestMapping("/ybtable")
public class YbtableController  extends BaseMybatisController<YbFytjModel, String>{
	@Autowired
	  private YbtableManager ybtableManager;
	@Autowired
	  private Ybtable2Manager ybtable2Manager;
	 @RequestMapping("/ybtable") 
	 public ModelAndView queryList(HttpServletRequest request,HttpServletResponse response) {
	       
	      ModelAndView result = new ModelAndView();
	      try {
	        String jgdm = request.getParameter("p_yljgdm");
	        String jbdm = request.getParameter("p_jbdm");
	        String jglx = request.getParameter("p_jglx");
	        String qylx = request.getParameter("p_qylx");
	        String lx = request.getParameter("p_lx");
	        String kssj = request.getParameter("p_kssj");
	       String jssj = request.getParameter("p_jssj");
	       String ywlx = request.getParameter("p_ywlx");
	        PageRequest pageRequest = newPageRequest(request);
	       
	    
	        	  PageResult<YbFytjModel> page= ybtableManager.pageSelect(pageRequest);	
	        	  result.addObject("code", 0);
	  	        result.addObject("msg", "success");
	  	        result.addObject("count", page.getTotalCount());
	  	        result.addObject("data", page.getResult());
	        
	        result.addObject("lx", lx);
	        result.addObject("jgdm", jgdm);
	        result.addObject("jbdm", jbdm);
	        result.addObject("jglx", jglx);
	        result.addObject("qylx", qylx);
	        result.addObject("kssj", kssj);
	        result.addObject("jssj", jssj);
	        result.addObject("ywlx", ywlx);
	        
	      } catch (Exception e) {
	        logger.warn(e.getMessage());
	        result.addObject("code", 500);
	        result.addObject("msg", e.getMessage());
	      } 
	      result.setViewName("wszygl/ybtable");
	      return result;
	      
	    }

	 @RequestMapping("/ybtable2") 
	 public ModelAndView queryList2(HttpServletRequest request,HttpServletResponse response) {
	       
	      ModelAndView result = new ModelAndView();
	      try {
	        String jgdm = request.getParameter("p_yljgdm");
	        String jbdm = request.getParameter("p_jbdm");
	        String jglx = request.getParameter("p_jglx");
	        String qylx = request.getParameter("p_qylx");
	        String lx = request.getParameter("p_lx");
	        String kssj = request.getParameter("p_kssj");
	       String jssj = request.getParameter("p_jssj");
	       String ywlx = request.getParameter("p_ywlx");
	        PageRequest pageRequest = newPageRequest(request);
	     
	        	PageResult<YbFytjModel> page= ybtable2Manager.pageSelect(pageRequest);	
	        	  result.addObject("code", 0);
	  	        result.addObject("msg", "success");
	  	        result.addObject("count", page.getTotalCount());
	  	        result.addObject("data", page.getResult());	
	        
	        result.addObject("lx", lx);
	        result.addObject("jgdm", jgdm);
	        result.addObject("jbdm", jbdm);
	        result.addObject("jglx", jglx);
	        result.addObject("qylx", qylx);
	        result.addObject("kssj", kssj);
	        result.addObject("jssj", jssj);
	        result.addObject("ywlx", ywlx);
	        
	      } catch (Exception e) {
	        logger.warn(e.getMessage());
	        result.addObject("code", 500);
	        result.addObject("msg", e.getMessage());
	      } 
	      result.setViewName("wszygl/ybtable");
	      return result;
	      
	    }
	@Override
	public Class<YbFytjModel> getEntityClass() {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public BaseMybatisManager<YbFytjModel, String> getBaseManager() {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public String getViewPath() {
		// TODO Auto-generated method stub
		return null;
	}

}
