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
import com.wondersgroup.wszygl.manager.JkdaAppUserManager;
import com.wondersgroup.wszygl.model.JkdaAppUserModel;



@Controller
@RequestMapping("/jkdaAppUser")
public class JkdaAppUserController extends BaseMybatisController<JkdaAppUserModel, String> {
	@Autowired
	private JkdaAppUserManager jkdaAppUserManager;

	
	@RequestMapping("/queryList")
	public ModelAndView queryList(HttpServletRequest request,HttpServletResponse response) {
		debugAllRequestParams(request);
		ModelAndView result = new ModelAndView();
		result.setViewName("wszygl/query_jkdaAppUser");
		try {
			PageRequest pageRequest = newPageRequest(request);
			PageResult<JkdaAppUserModel> page = this.getBaseManager().pageSelect(pageRequest);
			result.addObject("code", 0);
			result.addObject("msg", "success");
			result.addObject("count", page.getTotalCount());
			result.addObject("data", page.getResult());
		} catch (Exception e) {
			logger.warn(e.getMessage());
			result.addObject("code", 500);
			result.addObject("msg", e.getMessage());
		}
		
		return result;
		
	}
	
	@Override
	public Class<JkdaAppUserModel> getEntityClass() {
		// TODO Auto-generated method stub
		return JkdaAppUserModel.class;
	}
	

	@Override
	public BaseMybatisManager<JkdaAppUserModel, String> getBaseManager() {
		// TODO Auto-generated method stub
		return jkdaAppUserManager;
	}

	@Override
	public String getViewPath() {
		// TODO Auto-generated method stub
		return null;
	}

}
