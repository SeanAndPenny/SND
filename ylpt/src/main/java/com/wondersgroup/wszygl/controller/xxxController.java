package com.wondersgroup.wszygl.controller;

import java.text.SimpleDateFormat;
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
import com.wondersgroup.wszygl.manager.GwtnbglbbManager;
import com.wondersgroup.wszygl.manager.XxxManger;
import com.wondersgroup.wszygl.model.McpzModel;

import com.wondersgroup.wszygl.model.YljgMcModel;
import com.wondersgroup.wszygl.model.YqjgzsDaoModel;
import com.wondersgroup.wszygl.model.ZhjgUserModel;
import com.wondersgroup.wszygl.model.wdtjModel;
import com.wondersgroup.wszygl.model.xxxModel;

@Controller
@RequestMapping("/xxx")
public class xxxController extends BaseMybatisController<YqjgzsDaoModel, String> {
	@Autowired 
	public XxxManger xxxmanger; 
	@Autowired
	public GwtnbglbbManager gwtnbglbbmanager;
	@RequestMapping("/xxx")
	public ModelAndView basyxzList(HttpServletRequest request, HttpServletResponse response) {
		ModelAndView result = new ModelAndView();  
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
		String gwsj="";
		String gwjd="";
		
		String wdtj = request.getParameter("p_wdtj");
		String tjsjwd=request.getParameter("p_tjsjwd");//统计时间维度 0:天 ，1：季度
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
		
		
		if("0".equals(tjsjwd)) {
			 
			result.setViewName("wszygl/xxx");
		}else {
			 
			result.setViewName("wszygl/yyy");
		}
		   try { 
			  List<xxxModel> xxxlist  =null;
			  List<xxxModel> kkkList  =null;
			  String bz=null;
			  String zl=null;
			 xxxModel xxxmodel  = xxxmanger.getXxx(ywbz,yxbz);//主页面sql里字段的内容
		      
			System.out.println("wdtj=="+wdtj);
			 if(wdtj==""||wdtj==null||("yljgdm").equals(wdtj)||("").equals(wdtj)) {//判断维度为空或者选择机构维度时
				 bz=xxxmodel.getBz();
				 System.out.println("bz++++"+bz);
				 xxxlist=  xxxList(
							kssj,jssj,jgdm,
							xxxmodel.getSqlnr1(),
							xxxmodel.getSqlnr2(),
							xxxmodel.getSqlnr3(),
							xxxmodel.getPdtj1(),
		                    xxxmodel.getPdtj2(),
							xxxmodel.getPdtj3(),
							tjsjwd,wdtj
							 );
				  zl=xxxmanger.getzlSum(kssj,jssj,jgdm,
							xxxmodel.getSqlnr1(),
							xxxmodel.getSqlnr2(),
							xxxmodel.getSqlnr3(),
							xxxmodel.getPdtj1(),
		                    xxxmodel.getPdtj2(),
							xxxmodel.getPdtj3(),
							tjsjwd,wdtj);//总据量
				  System.out.println("zl1==="+zl);
			 }else {
				 xxxModel yyymodel  = xxxmanger.getKkk(ywbz,wdtj);
				 bz=yyymodel.getBz(); 
				 kkkList=  kkkList(
							kssj,jssj,jgdm,
							yyymodel.getSqlnr1(),
							yyymodel.getSqlnr2(),
							yyymodel.getSqlnr3(),
							yyymodel.getPdtj1(),
							yyymodel.getPdtj2(),
							yyymodel.getPdtj3(),
							tjsjwd,wdtj
							 ); 
				 zl=xxxmanger.getzlSum2(
						 kssj,jssj,jgdm,
							yyymodel.getSqlnr1(),
							yyymodel.getSqlnr2(),
							yyymodel.getSqlnr3(),
							yyymodel.getPdtj1(),
							yyymodel.getPdtj2(),
							yyymodel.getPdtj3(),
							tjsjwd,wdtj );//维度总量分析 
				 System.out.println("zl2==="+zl);
			 }
			 
			List<McpzModel> mcpzList=xxxmanger.getmcpzList(ywbz,wdtj);//维度名称
			List<McpzModel> mcpz= xxxmanger.getmcp(ywbz,wdtj);
			System.out.println("ywbz"+ywbz); 
			List<YljgMcModel> jgList=null;
			if(("CZRK").equals(ywbz)) {
				
				jgList =  xxxmanger.getCzrkYljg(jgdm); 
			}else if(("LDRK").equals(ywbz)) {
				
				jgList =  xxxmanger.getLdrkYljg(jgdm); 
			}
			else {
				jgList =  xxxmanger.getAllYljg(jgdm); 
			}
			 
			
			List<wdtjModel> wdtjList =  xxxmanger.getAllWdtj(ywbz);//维度统计
		
			result.addObject("mcpz",mcpz);
			request.setAttribute("jgList", jgList);
			request.setAttribute("wdtjList", wdtjList);
			result.addObject("xxxlist", xxxlist);
			result.addObject("kkkList",kkkList);
			result.addObject("mcpzList",mcpzList);
			result.addObject("zl", zl);
			result.addObject("bz", bz);
			 
			result.addObject("kssj", kssj);
			result.addObject("jssj", jssj);
			result.addObject("gwsj", gwsj);
			result.addObject("gwjd", gwjd);
			result.addObject("jgdm", jgdm);
			result.addObject("ywbz", ywbz);
			result.addObject("yxbz", yxbz);
			result.addObject("tjsjwd",tjsjwd);
			result.addObject("code", 0);
			result.addObject("msg", "success");
			
			 
		   }catch(Exception e) {
			logger.warn(e.getMessage());
			result.addObject("code", 500);
			result.addObject("msg", e.getMessage());
		}   
		return result;

	}
	public List xxxList(String kssj,String jssj,String jgdm,
			String sqlnr1,String sqlnr2,String sqlnr3,
			String pdtj1,
			String pdtj2,
			String pdtj3,
			String tjsjwd,
			String wdtj) {
		List<xxxModel> xxxlist  = xxxmanger.getXxxlist(
				 kssj, jssj, jgdm, sqlnr1,sqlnr2,sqlnr3, pdtj1,
				 pdtj2, pdtj3,tjsjwd,wdtj);
		return   xxxlist;     
	}
	
	
	
	
	
	public List kkkList(String kssj, String jssj, String jgdm, String sqlnr1, String sqlnr2, String sqlnr3,
			String pdtj1, String pdtj2, String pdtj3, String tjsjwd, String wdtj) {
		List<xxxModel> kkkList = xxxmanger.getKkklist(kssj, jssj, jgdm, 
				sqlnr1, sqlnr2, sqlnr3, 
				pdtj1, pdtj2, pdtj3,
				tjsjwd, wdtj);
		return kkkList;
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
