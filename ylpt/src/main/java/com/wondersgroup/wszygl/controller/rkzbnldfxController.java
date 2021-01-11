package com.wondersgroup.wszygl.controller;

import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.Date;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.wondersgroup.api.mybatis.manager.BaseMybatisManager;
import com.wondersgroup.frame.spr_mybt_mvc.basic.controller.BaseMybatisController;
import com.wondersgroup.wszygl.manager.Rkzbnldfxmanger;
import com.wondersgroup.wszygl.manager.XxxManger;
import com.wondersgroup.wszygl.manager.xxxblManger;
import com.wondersgroup.wszygl.model.YljgMcModel;
import com.wondersgroup.wszygl.model.ZhjgUserModel;
import com.wondersgroup.wszygl.model.xxxblModel;

@Controller
@RequestMapping("/rkzbnldfx")
public class rkzbnldfxController extends BaseMybatisController<xxxblModel,String>{
	
	@Autowired 
	public Rkzbnldfxmanger rkzbnldfxmanger;
	@Autowired 
	public XxxManger xxxmanger;
	
	@RequestMapping("/rkzbnldfx")
	
	public ModelAndView basyxzList(HttpServletRequest request, HttpServletResponse response) {
		String kssj = request.getParameter("p_kssj");
		String jssj = request.getParameter("p_jssj"); 
		String jgdm = request.getParameter("p_yljgdm");
		ModelAndView result = new ModelAndView(); 
		 
		
       //年龄段划分的人口比率(柱形图)	
		List <xxxblModel> rkzbnldfxList = rkzbnldfxmanger.getnlbllist(kssj,jssj,jgdm);
		result.addObject("rkzbnldfxList", rkzbnldfxList);
		return result;
	}
	
	
	
	@Override
	public Class<xxxblModel> getEntityClass() {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public BaseMybatisManager<xxxblModel, String> getBaseManager() {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public String getViewPath() {
		// TODO Auto-generated method stub
		return null;
	}
	

}
