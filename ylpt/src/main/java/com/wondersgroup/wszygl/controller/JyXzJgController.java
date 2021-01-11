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
import com.wondersgroup.wszygl.manager.JyXzJgManger;
import com.wondersgroup.wszygl.model.JyModel;

@Controller
@RequestMapping("/JyXzJg")
public class JyXzJgController extends BaseMybatisController<JyModel,String>{
		
	@Autowired
    public  JyXzJgManger jyXzJgKsManger;
	

		@RequestMapping("/JyXzJg")
		public ModelAndView rycxList(HttpServletRequest request, HttpServletResponse response) {
			String sfws = request.getParameter("p_sfws");
		 
			ModelAndView result = new ModelAndView();
			result.setViewName("wszygl/JyXzJg");
			try {
				 
				result.addObject("sfws", sfws);
				PageRequest pageRequest = newPageRequest(request);
				PageResult<JyModel> page = jyXzJgKsManger.pageSelect(pageRequest);
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

		@RequestMapping("/JyXzJgecharts")
		public ModelAndView ryxzecharts(HttpServletRequest request,HttpServletResponse response) {
			ModelAndView result = new ModelAndView();
			String sfws = request.getParameter("p_sfws");
			try {
				result.addObject("sfws", sfws);
				System.out.println("sfws===------"+sfws);
				List<JyModel>JyXzJgechartslist = jyXzJgKsManger.getJyXzJg(sfws);
				result.addObject("JyXzJgechartslist", JyXzJgechartslist);
			}catch(Exception e) {
				logger.warn(e.getMessage());
				result.addObject("code", 500);
				result.addObject("msg", e.getMessage());
			}
			return result;
			
		}
	
	
	
	@Override
	public Class<JyModel> getEntityClass() {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public BaseMybatisManager<JyModel, String> getBaseManager() {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public String getViewPath() {
		// TODO Auto-generated method stub
		return null;
	}

}
