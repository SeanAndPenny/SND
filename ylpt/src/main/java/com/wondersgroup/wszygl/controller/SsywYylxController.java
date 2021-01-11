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
import com.wondersgroup.wszygl.manager.SsywYylxManger;
import com.wondersgroup.wszygl.model.SsywjcModel;
@Controller
@RequestMapping("/ssywYylx")
public class SsywYylxController extends BaseMybatisController<SsywjcModel,String>{
	@Autowired
    public SsywYylxManger ssywYylxManger;
	
	//实时业务监测医院类型下钻--表格
	@RequestMapping("/ssywYylx")
	public ModelAndView rycxList(HttpServletRequest request, HttpServletResponse response) {
		String ids = request.getParameter("p_ids");
		String ywsj = request.getParameter("p_ywsj");
		 
		ModelAndView result = new ModelAndView();
		result.setViewName("wszygl/ssywYylx");
		try {
			result.addObject("ids", ids);
			result.addObject("ywsj", ywsj);
			PageRequest pageRequest = newPageRequest(request);
			PageResult<SsywjcModel> page = ssywYylxManger.pageSelect(pageRequest);
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

	@RequestMapping("/ssywjcCyKsecharts")
	public ModelAndView ryxzecharts(HttpServletRequest request,HttpServletResponse response) {
		ModelAndView result = new ModelAndView();
		String ids = request.getParameter("p_ids");
		String ywsj = request.getParameter("p_ywsj");
		try {
			result.addObject("ids", ids);
			result.addObject("ywsj", ywsj);
			List<SsywjcModel>getYylxechartsList = ssywYylxManger.getYylx(ids,ywsj);
			result.addObject("getYylxechartsList", getYylxechartsList);
		}catch(Exception e) {
			logger.warn(e.getMessage());
			result.addObject("code", 500);
			result.addObject("msg", e.getMessage());
		}
		return result;
		
	}
	
	

	@Override
	public Class<SsywjcModel> getEntityClass() {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public BaseMybatisManager<SsywjcModel, String> getBaseManager() {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public String getViewPath() {
		// TODO Auto-generated method stub
		return null;
	}

}
