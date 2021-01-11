package com.wondersgroup.wszygl.controller;

import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.Date;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;
import com.wondersgroup.api.mybatis.manager.BaseMybatisManager;
import com.wondersgroup.frame.spr_mybt_mvc.basic.controller.BaseMybatisController;
import com.wondersgroup.wszygl.manager.XxxManger;
import com.wondersgroup.wszygl.manager.xxxblManger;
import com.wondersgroup.wszygl.model.YljgMcModel;
import com.wondersgroup.wszygl.model.ZhjgUserModel;
import com.wondersgroup.wszygl.model.xxxblModel;

@Controller
@RequestMapping("/rkzb")
public class xxxBlController extends BaseMybatisController<xxxblModel,String>{
	@Autowired 
	public xxxblManger xxxblmanger;
	@Autowired 
	public XxxManger xxxmanger;
	@RequestMapping("/rkzb")
	
	public ModelAndView basyxzList(HttpServletRequest request, HttpServletResponse response) {
		 SimpleDateFormat formatter= new SimpleDateFormat("yyyy-MM-dd");
	        Date date = new Date(System.currentTimeMillis());
	        Calendar cale = Calendar.getInstance(); 
	        cale = Calendar.getInstance();  
	        cale.add(Calendar.MONTH, 0);  
	        cale.set(Calendar.DAY_OF_MONTH, 1);  
		String kssj = request.getParameter("p_kssj");
		String jssj = request.getParameter("p_jssj"); 
		String jgdm = request.getParameter("p_yljgdm");
		ModelAndView result = new ModelAndView(); 
		
		try {/// 权限测试
			String userName = null;
			userName = request.getParameter("p_Username");
			HttpServletRequest httpRequest = (HttpServletRequest) request;
			 HttpSession session = httpRequest.getSession();
			if (userName == "" || userName == null) {
				userName = (String) session.getAttribute("loginname1");
			}
		 System.out.println("userName==="+userName);
			if (("").equals(jgdm) || jgdm == null) {
				List<ZhjgUserModel> qx = xxxmanger.getQx(userName);
				for (int i = 0; i < qx.size(); i++) {
					if (("111").equals(qx.get(i).getOrgId()) || ("101000").equals(qx.get(i).getOrgId())) {
						jgdm = "";
					} else {
						jgdm = qx.get(i).getOrgCode();
					}
					result.addObject("orgid", qx.get(i).getOrgId());
				}

			}
		} catch (Exception e) {
			logger.warn(e.getMessage());
			result.addObject("code", 500);
			result.addObject("msg", e.getMessage());
		}
		
           List <xxxblModel> xxxBllist = xxxblmanger.getxxxBllist(kssj,jssj,jgdm);
            List<YljgMcModel> jdList=xxxblmanger.getJdlist(jgdm);
            System.out.println("jgdm4=="+jgdm);
				result.addObject("xxxBllist", xxxBllist);
				result.addObject("jdList", jdList);
				result.addObject("kssj", kssj);
				result.addObject("jssj", jssj);
				result.addObject("jgdm", jgdm);
				result.addObject("code", 0);
				result.addObject("msg", "success");
				
		//机构划分的人口比率(柱形图)		
		List <xxxblModel> rkbllist = xxxblmanger.getrkbllist(kssj,jssj,jgdm);
		//年龄段划分的人口比率(柱形图)	
		List <xxxblModel> nldbllist = xxxblmanger.getnlbllist(kssj,jssj,jgdm);
		 //年龄划分的人口比率(折线图)	
		List <xxxblModel> nllist = xxxblmanger.getnllist(kssj,jssj,jgdm);
		
		//户籍总数
		String hjrkzsl=xxxblmanger.hjrkzsl(kssj,jssj,jgdm);
        //流动总数
		String ldzsl=xxxblmanger.getldzsl(kssj,jssj,jgdm);
		result.addObject("rkbllist", rkbllist);
		result.addObject("nldbllist", nldbllist);
		result.addObject("nllist", nllist);
		result.addObject("hjrkzsl", hjrkzsl);	
		result.addObject("ldzsl", ldzsl);	
	 	
		   
		 result.setViewName("wszygl/rkzb");
		 
		return result;

	}
	 
	
	@RequestMapping("/echarsnldld")
	public ModelAndView getSsywjcecharts(HttpServletRequest request,HttpServletResponse response) {
		ModelAndView result = new ModelAndView();
        
		String kssj=request.getParameter("p_kssj");
		String jssj=request.getParameter("p_jssj");
		String jgdm=request.getParameter("p_jgdm");
		String index=request.getParameter("p_index");
		String nldbm=request.getParameter("p_nldbm");
		
		String[] nldbmList = nldbm.split("~");
	    String nldbm1=nldbmList[0];
		String nldbm2=nldbmList[1];
		List<xxxblModel>echarsnldldList=null;
		 
			 
			if("1".equals(index)) {//户籍
			echarsnldldList= xxxblmanger.getHjechats(kssj,jssj,jgdm,nldbm1,nldbm2);	
			}else if("2".equals(index)) {//流动
			echarsnldldList= xxxblmanger.getLdechats(kssj,jssj,jgdm,nldbm1,nldbm2);	
			}else {//总人口
				echarsnldldList= xxxblmanger.getZrkechats(kssj,jssj,jgdm,nldbm1,nldbm2);	
			}
			
			
			result.addObject("echarsnldldList", echarsnldldList);
			 
		 
		 
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
