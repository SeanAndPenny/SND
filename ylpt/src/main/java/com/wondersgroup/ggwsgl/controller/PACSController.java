package com.wondersgroup.ggwsgl.controller;

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
import com.wondersgroup.ggwsgl.manager.PACSManager;
import com.wondersgroup.ggwsgl.model.PACSModel;
import com.wondersgroup.ggwsgl.model.YljgModel;

@Controller
@RequestMapping("/pacs")
public class PACSController extends BaseMybatisController<PACSModel,String>{
	
	@Autowired
	public PACSManager pacsManager;
	
	protected final static Logger logger = LoggerFactory.getLogger(BaseMybatisLayuiController.class);
	@RequestMapping("/pacs")
	public ModelAndView zytzList(HttpServletRequest request,HttpServletResponse response) {
		ModelAndView result = new ModelAndView();
		result.setViewName("ylfwgl/pacsList");
		try {
			List<YljgModel>jgList = pacsManager.getAllYljg();
			
			
			request.setAttribute("jgList", jgList);
			PageRequest pageRequest = newPageRequest(request);
			PageResult<PACSModel> page = pacsManager.pageSelect(pageRequest);
			result.addObject("code",0);
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
	public Class<PACSModel> getEntityClass() {
		// TODO Auto-generated method stub
		return PACSModel.class;
	}

	@Override
	public BaseMybatisManager<PACSModel, String> getBaseManager() {
		// TODO Auto-generated method stub
		return pacsManager;
	}

	@Override
	public String getViewPath() {
		// TODO Auto-generated method stub
		return null;
	}

}
