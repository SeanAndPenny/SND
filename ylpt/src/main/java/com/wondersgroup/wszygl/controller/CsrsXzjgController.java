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
import com.wondersgroup.wszygl.manager.CsrsManger;
import com.wondersgroup.wszygl.model.CsrsModel;
@Controller
@RequestMapping("/csrsXzjg")
public class CsrsXzjgController  extends BaseMybatisController<CsrsModel,String>{
	@Autowired
    public CsrsManger csrsManger;
	 
			@RequestMapping("/csrsXzjg")
			
			public ModelAndView csrsXzjgecharts(HttpServletRequest request,HttpServletResponse response) {
				ModelAndView result = new ModelAndView();
				String yylx = request.getParameter("p_yylx");
				result.setViewName("wszygl/csrsXzjg");
				try {
					result.addObject("yylx", yylx);
					List<CsrsModel>csrsXzjgechartsList = csrsManger.getCsrsXzjgechartsList(yylx);
					result.addObject("csrsXzjgechartsList", csrsXzjgechartsList);
				}catch(Exception e) {
					logger.warn(e.getMessage());
					result.addObject("code", 500);
					result.addObject("msg", e.getMessage());
				}
				return result;
				
			}
			@RequestMapping("/csrsXzjgXX")
			public ModelAndView csrsXzjgList(HttpServletRequest request, HttpServletResponse response) {
				 
				String yljgdm = request.getParameter("p_yljgdm");
				ModelAndView result = new ModelAndView();
				
				try {
					 
					result.addObject("yljgdm", yljgdm);
					PageRequest pageRequest = newPageRequest(request);
					PageResult<CsrsModel> page = csrsManger.pageSelect(pageRequest);
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
	public Class<CsrsModel> getEntityClass() {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public BaseMybatisManager<CsrsModel, String> getBaseManager() {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public String getViewPath() {
		// TODO Auto-generated method stub
		return null;
	}

}
