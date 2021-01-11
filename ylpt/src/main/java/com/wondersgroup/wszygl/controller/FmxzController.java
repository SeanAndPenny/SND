package com.wondersgroup.wszygl.controller;

import java.util.ArrayList;
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
import com.wondersgroup.wszygl.manager.CsrsManger;
import com.wondersgroup.wszygl.manager.FmjlManger;
import com.wondersgroup.wszygl.model.CsrsModel;
 
/**
 * 分娩记录
 * @param request
 * @param response
 * @return
 */
@Component
@RequestMapping("/fmxz")
public class FmxzController  extends BaseMybatisController<CsrsModel,String>{
	@Autowired
    public  FmjlManger fmjlManger;
	@RequestMapping("/fmxzys")

	public ModelAndView fmxzList(HttpServletRequest request, HttpServletResponse response) {
		String yljgdm = request.getParameter("p_yljgdm");  
		String hjbz2 = request.getParameter("p_hjbz2");
		ModelAndView result = new ModelAndView();
		result.setViewName("wszygl/fmcxList");
		try { 
			result.addObject("yljgdm", yljgdm);
			result.addObject("hjbz2", hjbz2);
		    result.addObject("code", 0);
			result.addObject("msg", "success");
			List<CsrsModel>fmcxList = fmjlManger.getFmcxList(yljgdm,hjbz2);
			result.addObject("fmcxList", fmcxList);
		}catch(Exception e) {
			logger.warn(e.getMessage());
			result.addObject("code", 500);
			result.addObject("msg", e.getMessage());
		}
		return result;

	}
	
	@RequestMapping("/fmxzysXx")
	public ModelAndView jtysTdXzHzList(HttpServletRequest request, HttpServletResponse response) {
		String yljgdm = request.getParameter("p_yljgdm"); 
		String ysgh = request.getParameter("p_ysgh"); 
		String hjbz2 = request.getParameter("p_hjbz2");
		ModelAndView result = new ModelAndView();
		try {  
			PageRequest pageRequest = newPageRequest(request);
			PageResult<CsrsModel> page = fmjlManger.pageSelect(pageRequest);
			result.addObject("yljgdm", yljgdm);
			result.addObject("ysgh", ysgh);
			result.addObject("hjbz2", hjbz2);
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
	
	
	
	@RequestMapping("/fmxzJg")

	public ModelAndView fmxzJg(HttpServletRequest request, HttpServletResponse response) {
		String hjbz = request.getParameter("p_hjbz");  
		ModelAndView result = new ModelAndView();
		
		try { 
			result.addObject("hjbz", hjbz);
		    result.addObject("code", 0);
			result.addObject("msg", "success");
			List<CsrsModel>fmxzJgList = fmjlManger.getFmxzJgList(hjbz);
			result.addObject("fmxzJgList", fmxzJgList);
			
			List<String> csrsList = new ArrayList<String>(); 
			List<String> hjbzList2 = new ArrayList<String>();
			List<String> hjbzmcList = new ArrayList<String>();
			List<String> yljgdmList = new ArrayList<String>();
			List<String> yljgmcList = new ArrayList<String>();
		 
			
			for(int i=0;i<fmxzJgList.size();i++) {
				csrsList.add("'" + fmxzJgList.get(i).getCsrs() + "'");
				hjbzList2.add("'" + fmxzJgList.get(i).getHjbz() + "'");
				hjbzmcList.add("'" + fmxzJgList.get(i).getHjbzmc() + "'");
				yljgdmList.add("'" + fmxzJgList.get(i).getYljgdm() + "'");
				yljgmcList.add("'" + fmxzJgList.get(i).getYljgmc() + "'");
			}
			request.setAttribute("csrsList", csrsList);
			request.setAttribute("hjbzList2", hjbzList2);
			request.setAttribute("hjbzmcList", hjbzmcList);
			request.setAttribute("yljgdmList", yljgdmList);
			request.setAttribute("yljgmcList", yljgmcList);
			
			
			
			
		}catch(Exception e) {
			logger.warn(e.getMessage());
			result.addObject("code", 500);
			result.addObject("msg", e.getMessage());
		}
		result.setViewName("wszygl/fmxzJgList");
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
