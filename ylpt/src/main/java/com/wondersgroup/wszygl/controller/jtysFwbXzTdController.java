package com.wondersgroup.wszygl.controller;

import java.util.List;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;
import com.wondersgroup.api.beans.page.PageRequest;
import com.wondersgroup.api.beans.page.PageResult;
import com.wondersgroup.api.mybatis.manager.BaseMybatisManager;
import com.wondersgroup.frame.spr_mybt_mvc.basic.controller.BaseMybatisController;
import com.wondersgroup.wszygl.manager.JtysFwbXzTdManger;
import com.wondersgroup.wszygl.model.JtysModel;
@Component
@RequestMapping("/jtysFwbXzTd")
public class jtysFwbXzTdController extends BaseMybatisController<JtysModel,String>{
	@Autowired
    public  JtysFwbXzTdManger jtysFwbXzTdManger;
	
	@RequestMapping("/jtysFwbXzTd")
	public ModelAndView rycxList(HttpServletRequest request, HttpServletResponse response) {
		String qyjgid = request.getParameter("p_qyjgid"); 
		String fwbid = request.getParameter("p_fwbid"); 
		ModelAndView result = new ModelAndView();
		result.setViewName("wszygl/jtysFwbXzTd");
		try { 
			result.addObject("qyjgid", qyjgid);
			result.addObject("fwbid", fwbid);
		    result.addObject("code", 0);
			result.addObject("msg", "success");
			List<JtysModel>jtysFwbXzTdList = jtysFwbXzTdManger.getJtysFwbXzTd(qyjgid,fwbid);
			result.addObject("jtysFwbXzTdList", jtysFwbXzTdList);
		}catch(Exception e) {
			logger.warn(e.getMessage());
			result.addObject("code", 500);
			result.addObject("msg", e.getMessage());
		}
		return result;

	}
	//家庭医生签约服务包
	@RequestMapping("/jtysFwbXzTdXX")
	public ModelAndView jtysTdXzHzList(HttpServletRequest request, HttpServletResponse response) {
		String qyjgid = request.getParameter("p_qyjgid"); 
		String fwbid = request.getParameter("p_fwbid"); 
		ModelAndView result = new ModelAndView();
		try {  
			PageRequest pageRequest = newPageRequest(request);
			PageResult<JtysModel> page = jtysFwbXzTdManger.pageSelect(pageRequest);
			result.addObject("qyjgid", qyjgid);
			result.addObject("fwbid", fwbid);
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
	public Class<JtysModel> getEntityClass() {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public BaseMybatisManager<JtysModel, String> getBaseManager() {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public String getViewPath() {
		// TODO Auto-generated method stub
		return null;
	}

}
