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
import com.wondersgroup.wszygl.manager.CwtjXzBqManger;
import com.wondersgroup.wszygl.manager.JtysFwbXzTdManger;
import com.wondersgroup.wszygl.model.CwtjModel;


@Component
@RequestMapping("/cwtjXzBq")
public class CwtjXzBqController  extends BaseMybatisController<CwtjModel,String>{
	@Autowired
    public  CwtjXzBqManger cwtjXzBqManger;
	
	@RequestMapping("/cwtjXzBq")
	public ModelAndView rycxList(HttpServletRequest request, HttpServletResponse response) {
		String  yljgdm = request.getParameter("p_yljgdm"); 
		String ids = request.getParameter("p_ids"); 
		String index = request.getParameter("p_index"); 
		System.out.println("index=="+index);
		ModelAndView result = new ModelAndView();
		result.setViewName("wszygl/cwtjXzBq");
		try { 
			result.addObject("yljgdm", yljgdm);
			result.addObject("ids", ids);
			result.addObject("index", index);
		    result.addObject("code", 0);
			result.addObject("msg", "success");
			//index==0 是核定床位;1:开放床位;2:当前可用床位 3:剩余床位
			  List<CwtjModel>cwtjXzBqList =null;
			if("0".equals(index)) {
				cwtjXzBqList= cwtjXzBqManger.getCwHdtjXzBqList(yljgdm,ids);//核定床位
				result.addObject("cwtjXzBqList", cwtjXzBqList);
			}else if("1".equals(index)) {
				cwtjXzBqList= cwtjXzBqManger.getCwKftjXzBqList(yljgdm,ids);//开放床位
				result.addObject("cwtjXzBqList", cwtjXzBqList);
			}else if("2".equals(index)) {
				cwtjXzBqList= cwtjXzBqManger.getCwDqtjXzBqList(yljgdm,ids);//当前可用床位
				result.addObject("cwtjXzBqList", cwtjXzBqList);
			}else if("3".equals(index)){
				cwtjXzBqList= cwtjXzBqManger.getCwSytjXzBqList(yljgdm,ids);//剩余床位
				result.addObject("cwtjXzBqList", cwtjXzBqList);
			} 
			 
			
		}catch(Exception e) {
			logger.warn(e.getMessage());
			result.addObject("code", 500);
			result.addObject("msg", e.getMessage());
		}
		return result;

	}
	// 
	@RequestMapping("/cwtjXzBqXX")
	public ModelAndView jtysTdXzHzList(HttpServletRequest request, HttpServletResponse response) {
		String  yljgdm = request.getParameter("p_yljgdm"); 
		String bqcode = request.getParameter("p_bqcode"); 
		String index = request.getParameter("p_index"); 
		 System.out.println("yljgdm=="+yljgdm);
		 System.out.println("bqcode=="+bqcode);
		ModelAndView result = new ModelAndView();
		try {  
			PageRequest pageRequest = newPageRequest(request);
			PageResult<CwtjModel> page = cwtjXzBqManger.pageSelect(pageRequest);
			result.addObject("yljgdm", yljgdm);
			result.addObject("bqcode", bqcode);
			result.addObject("index", index);
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
	public Class<CwtjModel> getEntityClass() {
		// TODO Auto-generated method stub
		return null;
	}
	@Override
	public BaseMybatisManager<CwtjModel, String> getBaseManager() {
		// TODO Auto-generated method stub
		return null;
	}
	@Override
	public String getViewPath() {
		// TODO Auto-generated method stub
		return null;
	}
}
