package com.wondersgroup.wszygl.controller;

import java.text.SimpleDateFormat;
import java.util.ArrayList;
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
import com.wondersgroup.wszygl.manager.XxxManger;
import com.wondersgroup.wszygl.manager.XxxQsfxManger;
import com.wondersgroup.wszygl.model.McpzModel;
import com.wondersgroup.wszygl.model.YljgMcModel;
import com.wondersgroup.wszygl.model.YqjgzsDaoModel;
import com.wondersgroup.wszygl.model.wdtjModel;
import com.wondersgroup.wszygl.model.xxxModel;

@Controller
@RequestMapping("/xxxQsfx")
//趋势分析
public class xxxQsfxController extends BaseMybatisController<YqjgzsDaoModel, String> {
	@Autowired 
	public XxxQsfxManger xxxqsfxmanger;
	@Autowired 
	public XxxManger xxxmanger;
	@RequestMapping("/xxxQsfx")
	public ModelAndView basyxzList(HttpServletRequest request, HttpServletResponse response) {
		SimpleDateFormat formatter= new SimpleDateFormat("yyyy-MM-dd");
        Date date = new Date(System.currentTimeMillis());
        Calendar cale = Calendar.getInstance(); 
        cale = Calendar.getInstance();  
        cale.add(Calendar.MONTH, 0);  
        cale.set(Calendar.DAY_OF_MONTH, 1); 
		String kssj = request.getParameter("p_kssj");
		String jssj = request.getParameter("p_jssj");  
		String jgdm = request.getParameter("p_jgdm");
		String ywbz = request.getParameter("p_ywbz");
		String yxbz = request.getParameter("p_yxbz");
		String wdtj = request.getParameter("p_wdtj"); 
		String orgid=request.getParameter("p_orgid");
		String sjlx=null;//页面上传的时间类型:年,月,日
		ModelAndView result = new ModelAndView(); 
		/*if(kssj=="" || kssj==null) {
			kssj= formatter.format(cale.getTime()); 	
		};
		if(jssj=="" || jssj==null) {
			jssj= formatter.format(date); 	
		}*/
		 
		if(kssj.length()==10) {
			sjlx="day";
		}else if(kssj.length()==7) {
			sjlx="month";
		}else if(kssj.length()==4) {
			sjlx="year";
		}
		
		System.out.println("sjlx="+sjlx);
		if(("111").equals(orgid)&&("101000").equals(orgid)) {//权限测试
			jgdm="";
		}
		try {
			List<YljgMcModel> jgList =null;
			if(("CZRK").equals(ywbz)) {
				jgList =  xxxmanger.getCzrkYljg(jgdm); 
			}else if(("LDRK").equals(ywbz)) {
				jgList =  xxxmanger.getLdrkYljg(jgdm); 
			}else {
				jgList =  xxxmanger.getAllYljg(jgdm); 
			}
			
			
			
			 xxxModel xxxmodel  = xxxqsfxmanger.getXxx(ywbz,yxbz);
			 List<xxxModel> xxxlist=null;
			 List<xxxModel> yyyList  =null;
			 if(wdtj==""||wdtj==null||("yljgdm").equals(wdtj)||("").equals(wdtj)) {
				 xxxlist=xxxList(
							kssj,jssj,jgdm,
							xxxmodel.getSqlnr1(),
							xxxmodel.getSqlnr2(),
							xxxmodel.getSqlnr3(),
							xxxmodel.getSqlnr4(),
							xxxmodel.getSqlnr5(),
							
							xxxmodel.getPdtj1(),
		                    xxxmodel.getPdtj2(),
							xxxmodel.getPdtj3(),
							wdtj,sjlx
							 ); 
			 }else {  
				 xxxModel yyymodel  = xxxqsfxmanger.getYyy(ywbz,wdtj);
				 yyyList=yyyList(
							kssj,jssj,jgdm,
							yyymodel.getSqlnr1(),
							yyymodel.getSqlnr2(),
							yyymodel.getSqlnr3(),
							yyymodel.getSqlnr4(),
							yyymodel.getSqlnr5(),
							
							yyymodel.getPdtj1(),
							yyymodel.getPdtj2(),
							yyymodel.getPdtj3(),
							wdtj,sjlx
							 ); 
				 
				 
				
			 }
			
			List<McpzModel> mcpzList=xxxqsfxmanger.getmcpzList(ywbz,wdtj);//名称1
			List<McpzModel> mcpz= xxxqsfxmanger.getmcp(ywbz,wdtj);//名称2
			List<wdtjModel> wdtjList =  xxxqsfxmanger.getAllWdtj(ywbz);//维度统计
			result.addObject("mcpz",mcpz);
			request.setAttribute("wdtjList", wdtjList);
			result.addObject("xxxlist", xxxlist);
			result.addObject("yyyList",yyyList);
			result.addObject("mcpzList",mcpzList);
			result.addObject("jgList", jgList);
			result.addObject("kssj", kssj);
			result.addObject("jssj", jssj);
			result.addObject("jgdm", jgdm);
			result.addObject("ywbz", ywbz);
			result.addObject("yxbz", yxbz);
			result.addObject("code", 0);
			result.addObject("msg", "success");
			
			 
		}catch(Exception e) {
			logger.warn(e.getMessage());
			result.addObject("code", 500);
			result.addObject("msg", e.getMessage());
		}
		result.setViewName("wszygl/xxxQsfx");
		return result;
		
	}
	
	public List yyyList(String kssj,String jssj,String jgdm,
			String sqlnr1,String sqlnr2,String sqlnr3,
			String sqlnr4,
			String sqlnr5,
			String pdtj1,
			String pdtj2,
			String pdtj3, 
			String wdtj,String sjlx) {
		List<xxxModel> yyyList  = xxxqsfxmanger.getYyylist(
				 kssj, jssj, jgdm, sqlnr1,sqlnr2,sqlnr3,sqlnr4,sqlnr5, pdtj1,
				 pdtj2, pdtj3,wdtj,sjlx);
		return   yyyList; 
          
	}
	
	public List xxxList(String kssj,String jssj,String jgdm,
			String sqlnr1,String sqlnr2,String sqlnr3,
			String sqlnr4,
			String sqlnr5,
			String pdtj1,
			String pdtj2,
			String pdtj3, 
			String wdtj,String sjlx) {
		List<xxxModel> xxxlist  = xxxqsfxmanger.getXxxlist(
				 kssj, jssj, jgdm, sqlnr1,sqlnr2,sqlnr3,sqlnr4,sqlnr5, pdtj1,
				 pdtj2, pdtj3,wdtj,sjlx);
		return   xxxlist; 
          
	}
	

	@Override
	public Class<YqjgzsDaoModel> getEntityClass() {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public BaseMybatisManager<YqjgzsDaoModel, String> getBaseManager() {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public String getViewPath() {
		// TODO Auto-generated method stub
		return null;
	}

}
