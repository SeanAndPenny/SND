package com.wondersgroup.commons.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;

import com.wondersgroup.api.beans.page.PageRequest;
import com.wondersgroup.api.beans.page.PageResult;
import com.wondersgroup.api.mybatis.manager.BaseMybatisManager;
import com.wondersgroup.commons.manager.LogsManager;
import com.wondersgroup.commons.manager.TbAuthUserManager;
import com.wondersgroup.commons.model.LogsModel;
import com.wondersgroup.commons.model.TbAuthUser;
import com.wondersgroup.frame.spr_mybt_mvc.basic.controller.BaseMybatisLayuiController;
import com.wondersgroup.wszygl.model.AreaModel;
@Controller
@RequestMapping("/logs")
public class LogsController extends  BaseMybatisLayuiController<LogsModel, String> {
	@Autowired
	public LogsManager logsManager;
	@RequestMapping("/check")
	public ModelAndView  main(HttpServletRequest request,HttpServletResponse response){
		debugAllRequestParams(request);
		ModelAndView result = new ModelAndView();
		result.setViewName("commons/query_logs");
		try {
			PageRequest pageRequest = newPageRequest(request);
			PageResult<LogsModel> page = this.getBaseManager().pageSelect(pageRequest);
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
	public Class<LogsModel> getEntityClass() {
		return LogsModel.class;
	}

	@Override
	protected String getPk(LogsModel entity) {

		return null;
	}

	@Override
	public BaseMybatisManager<LogsModel, String> getBaseManager() {

		return logsManager;
	}

	@Override
	public String getViewPath() {
		// TODO Auto-generated method stub
		return null;
	}
 
	
	
}
