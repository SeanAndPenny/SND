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
import com.wondersgroup.wszygl.manager.JjhzzdbfxManger;
import com.wondersgroup.wszygl.model.JjsjFxModel;

/**
 * 急救患者字典表项分析
 * @author asus
 *
 */
@Component
@RequestMapping("/jjhzzdbfx")
public class JjhzzdbfxController extends BaseMybatisController<JjsjFxModel,String>{
	   @Autowired
        public JjhzzdbfxManger jjhzzdbfxManger;
	   
	   @RequestMapping("/jjhzzdbfx")
		public ModelAndView jjhzjbfxList(HttpServletRequest request, HttpServletResponse response) {
			String  startdate = request.getParameter("p_startdate"); 
			String enddate = request.getParameter("p_enddate");   
			ModelAndView result = new ModelAndView();
			result.setViewName("wszygl/jjhzzdbfx");
			try { 
				result.addObject("startdate", startdate);
				result.addObject("enddate", enddate); 
			    result.addObject("code", 0);
				result.addObject("msg", "success");
				
				  List<JjsjFxModel>jjhzzdbfxList = jjhzzdbfxManger.getJjhzzdbfxList(startdate,enddate);
					result.addObject("jjhzzdbfxList", jjhzzdbfxList);

			}catch(Exception e) {
				logger.warn(e.getMessage());
				result.addObject("code", 500);
				result.addObject("msg", e.getMessage());
			}
			return result;

		}
		
		@RequestMapping("/jjhzzdbfxXx")
		public ModelAndView jtysTdXzHzList(HttpServletRequest request, HttpServletResponse response) {
			String  startdate = request.getParameter("p_startdate"); 
			String enddate = request.getParameter("p_enddate"); 
			String ids = request.getParameter("p_ids"); 
			 System.out.println("ids=="+ids);
			ModelAndView result = new ModelAndView();
			try {  
				PageRequest pageRequest = newPageRequest(request);
				PageResult<JjsjFxModel> page = jjhzzdbfxManger.pageSelect(pageRequest);
				result.addObject("startdate", startdate);
				result.addObject("enddate", enddate); 
				result.addObject("ids", ids); 
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
	public Class<JjsjFxModel> getEntityClass() {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public BaseMybatisManager<JjsjFxModel, String> getBaseManager() {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public String getViewPath() {
		// TODO Auto-generated method stub
		return null;
	}
}