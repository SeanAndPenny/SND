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
import com.wondersgroup.wszygl.manager.SsJbxzKsRyManger;
import com.wondersgroup.wszygl.manager.YjclXxManger;
import com.wondersgroup.wszygl.model.SslistModel;
import com.wondersgroup.wszygl.model.YjclModel;
@Controller
@RequestMapping("/yjclXx")
public class YjclXxController extends BaseMybatisController<YjclModel, String> {
	@Autowired
    public YjclXxManger yjclXxManger;
	@RequestMapping("/yjclXx")
	public ModelAndView yjclXxList(HttpServletRequest request, HttpServletResponse response) {
		String yljgdm = request.getParameter("p_yljgdm");
	 	ModelAndView result = new ModelAndView();
		result.setViewName("wszygl/yjclXx");
		try {   
			result.addObject("yljgdm", yljgdm);
		 	PageRequest pageRequest = newPageRequest(request);
			PageResult<YjclModel> page = yjclXxManger.pageSelect(pageRequest);
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
	public Class<YjclModel> getEntityClass() {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public BaseMybatisManager<YjclModel, String> getBaseManager() {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public String getViewPath() {
		// TODO Auto-generated method stub
		return null;
	}

}
