package com.wondersgroup.wszygl.controller;

import java.util.List;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;
import com.wondersgroup.api.beans.page.PageRequest;
import com.wondersgroup.api.beans.page.PageResult;
import com.wondersgroup.api.mybatis.manager.BaseMybatisManager;
import com.wondersgroup.frame.spr_mybt_mvc.basic.controller.BaseMybatisController;
import com.wondersgroup.frame.spr_mybt_mvc.basic.controller.BaseMybatisLayuiController;
import com.wondersgroup.ggwsgl.model.YljgModel;
import com.wondersgroup.wszygl.manager.JkdagxManager;
import com.wondersgroup.wszygl.model.JkdagxModel;
import com.wondersgroup.wszygl.model.MedicalPersonModel;

@Controller
@RequestMapping("/jkdagx")
public class jkdagxController extends  BaseMybatisController<JkdagxModel,String>{
	@Autowired
	public JkdagxManager jkdagxManager;
	
	protected final static Logger logger = LoggerFactory.getLogger(BaseMybatisLayuiController.class);
	
	@RequestMapping("/jkdagx")
	public ModelAndView jkdagxList(HttpServletRequest request,HttpServletResponse response) {
		ModelAndView result = new ModelAndView();
		result.setViewName("wszygl/jkdagx");
		try {
			String yljgdm=request.getParameter("p_yljgdm");
			String startdate=request.getParameter("p_startdate");
			String enddate=request.getParameter("p_enddate");
			
			List<YljgModel> jgList = jkdagxManager.getAllYljg(yljgdm);
			request.setAttribute("jgList", jgList);
			
			PageRequest pageRequest = newPageRequest(request);
			PageResult<JkdagxModel> page = jkdagxManager.pageSelect(pageRequest);
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
	//健康档案更新查看信息
	@RequestMapping("/jkdagxxx")
	public ModelAndView ckxx(HttpServletRequest request,HttpServletResponse response) { 
		String yljgdm=request.getParameter("p_yljgdm");
		String startdate=request.getParameter("p_startdate");
		String enddate=request.getParameter("p_enddate");
		 ModelAndView result =new ModelAndView();
	    
	    List<JkdagxModel> jkdagxxxSj=jkdagxManager.getJkdagxxx(yljgdm,startdate,enddate);
	    
	    result.addObject("startdate", startdate);
		result.addObject("enddate", enddate);   
		result.addObject("yljgdm", yljgdm);
	    result.setViewName("wszygl/jkdagxxx");
	    result.addObject("jkdagxxxSj", jkdagxxxSj);
		return result;
	}
	@Override
	public Class<JkdagxModel> getEntityClass() {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public BaseMybatisManager<JkdagxModel, String> getBaseManager() {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public String getViewPath() {
		// TODO Auto-generated method stub
		return null;
	}
}