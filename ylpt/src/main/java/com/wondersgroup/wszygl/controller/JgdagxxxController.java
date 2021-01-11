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
import com.wondersgroup.wszygl.manager.JgdagxxxManger;
import com.wondersgroup.wszygl.model.JgdagxxxModel;
 
@Controller
@RequestMapping("/jgdagxxx")
public class JgdagxxxController extends BaseMybatisController<JgdagxxxModel,String>{
	@Autowired
	public JgdagxxxManger jgdagxxxManger;
	 
		@RequestMapping("/jgdagxxx")
		public ModelAndView xqtj2(HttpServletRequest request, HttpServletResponse response) {
			String yljgdm = request.getParameter("p_yljgdm");
			String startdate = request.getParameter("p_startdate");
			String enddate = request.getParameter("p_enddate");
			
			debugAllRequestParams(request);
			ModelAndView result = new ModelAndView();
			result.setViewName("wszygl/jgdagxxx");
			try {
				 
				PageRequest pageRequest = newPageRequest(request);
				PageResult<JgdagxxxModel> page = jgdagxxxManger.pageSelect(pageRequest);
				result.addObject("code", 0);
				result.addObject("msg", "success");
				result.addObject("yljgdm", yljgdm);
				result.addObject("startdate", startdate);
				result.addObject("enddate", enddate);

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
	public Class<JgdagxxxModel> getEntityClass() {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public BaseMybatisManager<JgdagxxxModel, String> getBaseManager() {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public String getViewPath() {
		// TODO Auto-generated method stub
		return null;
	}

}
