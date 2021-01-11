package com.wondersgroup.wszygl.controller;

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
import com.wondersgroup.wszygl.manager.SsJgxzKSManger;
import com.wondersgroup.wszygl.model.SslistModel;

@Controller
@RequestMapping("/ssJgxzKS")
public class SsJgxzKSController  extends BaseMybatisController<SslistModel,String>{
	@Autowired
    public SsJgxzKSManger ssJgxzKSManger;
	@RequestMapping("/ssJgxzKS")
	public ModelAndView rycxList(HttpServletRequest request, HttpServletResponse response) {
	    String yljgdm = request.getParameter("p_yljgdm");
		ModelAndView result = new ModelAndView();
		result.setViewName("wszygl/ssJgxzKS");
		try { 
			 
			result.addObject("yljgdm", yljgdm);
			PageRequest pageRequest = newPageRequest(request);
			PageResult<SslistModel> page = ssJgxzKSManger.pageSelect(pageRequest);
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

	@RequestMapping("/ssJgxzKSecharts")
	public ModelAndView ryxzecharts(HttpServletRequest request,HttpServletResponse response) {
		ModelAndView result = new ModelAndView();
	 	String yljgdm = request.getParameter("p_yljgdm");
		try { 
			result.addObject("yljgdm", yljgdm);
			List<SslistModel>ssJgxzKSechartsechartsList = ssJgxzKSManger.getssJbxzKs(yljgdm);
			result.addObject("ssJgxzKSechartsechartsList", ssJgxzKSechartsechartsList);
		}catch(Exception e) {
			logger.warn(e.getMessage());
			result.addObject("code", 500);
			result.addObject("msg", e.getMessage());
		}
		return result;
		
	}
	

	@Override
	public Class<SslistModel> getEntityClass() {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public BaseMybatisManager<SslistModel, String> getBaseManager() {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public String getViewPath() {
		// TODO Auto-generated method stub
		return null;
	}
}
