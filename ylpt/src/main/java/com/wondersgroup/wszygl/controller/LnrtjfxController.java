package com.wondersgroup.wszygl.controller;

import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.Date;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.wondersgroup.api.mybatis.manager.BaseMybatisManager;
import com.wondersgroup.frame.spr_mybt_mvc.basic.controller.BaseMybatisController;
import com.wondersgroup.wszygl.manager.LnrtjfxManger;
import com.wondersgroup.wszygl.model.LnrModel;
@Component
@RequestMapping("/lnrtjfx")
public class LnrtjfxController extends BaseMybatisController<LnrModel,String>{

	@Autowired
    public LnrtjfxManger lnrtjfxManger; 
	@RequestMapping("/lnrtjfx")
	public ModelAndView rycxList(HttpServletRequest request, HttpServletResponse response) {
		ModelAndView result = new ModelAndView();
		
		 SimpleDateFormat formatter= new SimpleDateFormat("yyyy-MM-dd");
	        Date date = new Date(System.currentTimeMillis());
	        Calendar cale = Calendar.getInstance(); 
	        cale = Calendar.getInstance();  
	        cale.add(Calendar.MONTH, 0);  
	        cale.set(Calendar.DAY_OF_MONTH, 1); 
	    String  startdate = request.getParameter("p_startdate"); 
		String enddate = request.getParameter("p_enddate");
		String yljgdm = request.getParameter("p_yljgdm");
		
		if(startdate=="" || startdate==null) {
			startdate= formatter.format(cale.getTime()); 	
		};
		if(enddate=="" || enddate==null) {
			enddate= formatter.format(date); 	
		}
		result.setViewName("wszygl/lnrtjfx");
		try { 
			result.addObject("startdate", startdate);
			result.addObject("enddate", enddate); 
			result.addObject("yljgdm", yljgdm); 
		    result.addObject("code", 0);
			result.addObject("msg", "success");
			//531展现心梗高危，卒中高危，心梗卒中高危比例
			   //心梗高危
			List<LnrModel>lnrtjXgfxList= lnrtjfxManger.getLnrtjxgfx(startdate,enddate,yljgdm);
		     result.addObject("lnrtjXgfxList", lnrtjXgfxList);
		     //卒中高危
		     List<LnrModel>lnrtjCzfxList= lnrtjfxManger.getLnrtjCzfx(startdate,enddate,yljgdm);
		     result.addObject("lnrtjCzfxList", lnrtjCzfxList);
		     //心梗卒中高危比例
		     List<LnrModel>lnrtjCzXgfxList= lnrtjfxManger.getLnrtjCzXgfx(startdate,enddate,yljgdm);
		     result.addObject("lnrtjCzXgfxList", lnrtjCzXgfxList);
		     
             List<String> nameList = new ArrayList<String>();
			 for(int i=0;i<lnrtjXgfxList.size();i++) {
				 nameList.add("'" + lnrtjXgfxList.get(i).getXxjblxmc() + "'");
			 }
			 for(int i=0;i<lnrtjCzfxList.size();i++) {
				 nameList.add("'" + lnrtjCzfxList.get(i).getNczlxmc() + "'");
			 }
			 
			request.setAttribute("nameList", nameList);
		     for(int i=0;i<lnrtjXgfxList.size();i++) {
		    	 
		     }
		     //高血压比例，糖尿病比例，两者病都有的比例饼图
		     //高血压比例
		     List<LnrModel>lnrGxyfxList= lnrtjfxManger.getLnrGxyfx(startdate,enddate,yljgdm);
		     result.addObject("lnrGxyfxList", lnrGxyfxList);
		     //糖尿病比例
		     List<LnrModel>lnrTnbfxList= lnrtjfxManger.getLnrTnbfx(startdate,enddate,yljgdm);
		     result.addObject("lnrTnbfxList", lnrTnbfxList);
		     //同时患有高血压和糖尿病的人
		     List<LnrModel>lnrGxyTnbfxList= lnrtjfxManger.getLnrGxyTnbfx(startdate,enddate,yljgdm);
		     result.addObject("lnrGxyTnbfxList", lnrGxyTnbfxList);
		     
		     List<String> gxytnbNameList = new ArrayList<String>();
		     for(int i=0;i<lnrGxyfxList.size();i++) {
		    	 gxytnbNameList.add("'" + lnrGxyfxList.get(i).getGxylxmc() + "'");
			 }
			 for(int i=0;i<lnrTnbfxList.size();i++) {
				 gxytnbNameList.add("'" + lnrTnbfxList.get(i).getTnblxmc() + "'");
			 }
			request.setAttribute("gxytnbNameList", gxytnbNameList);
		     
		     
		      
		}catch(Exception e) {
			logger.warn(e.getMessage());
			result.addObject("code", 500);
			result.addObject("msg", e.getMessage());
		}
		return result;

	}
	
	
	
	
	
	
	
	
	
	@Override
	public Class<LnrModel> getEntityClass() {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public BaseMybatisManager<LnrModel, String> getBaseManager() {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public String getViewPath() {
		// TODO Auto-generated method stub
		return null;
	}

}
