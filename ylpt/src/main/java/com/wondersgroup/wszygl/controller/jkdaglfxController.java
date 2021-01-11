package com.wondersgroup.wszygl.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.wondersgroup.api.beans.page.PageRequest;
import com.wondersgroup.api.beans.page.PageResult;
import com.wondersgroup.api.mybatis.manager.BaseMybatisManager;
import com.wondersgroup.frame.spr_mybt_mvc.basic.controller.BaseMybatisController;
import com.wondersgroup.wszygl.manager.JkdaglfxManger;
import com.wondersgroup.wszygl.manager.XxxManger;
import com.wondersgroup.wszygl.model.SwxxJgdmModel;
import com.wondersgroup.wszygl.model.ZhjgUserModel;
import com.wondersgroup.wszygl.model.jkdaglfxModel;

@Controller
@RequestMapping("/jkdaglfx")
public class jkdaglfxController extends BaseMybatisController<jkdaglfxModel, String>{
	@Autowired 
	public JkdaglfxManger jkdaglfxmanger;
	@Autowired 
	public XxxManger xxxmanger;
	@RequestMapping("/jkdaglfx")
	public ModelAndView jkdaglfx(HttpServletRequest request, HttpServletResponse response) {
		ModelAndView result = new ModelAndView();
		String kssj = request.getParameter("p_kssj");
		String jssj = request.getParameter("p_jssj");  
		String jgdm = request.getParameter("p_yljgdm");
		String sjlx=null;
		String jdrqgs=null;//建档日期格式
		String jssjs=null;
		if(kssj==null||("undefined").equals(kssj)) {
			kssj=jkdaglfxmanger.getMinJdsj();
		}
		if(jssj==null||("undefined").equals(jssj)) {
			jssj=jkdaglfxmanger.getMaxJdsj();
			jssjs=jkdaglfxmanger.getMaxJdsjs();
		}
		try {
		if(kssj.length()==10) {
			sjlx="day";
			jdrqgs="to_char(jdrq,'yyyyMMdd')";
		}else if(kssj.length()==7) {
			sjlx="month";
			jdrqgs="to_char(jdrq,'yyyyMM')";
		}else if(kssj.length()==4) {
			sjlx="year";
			jdrqgs="to_char(jdrq,'yyyy')";
		}
		}catch(Exception e) {
			logger.warn(e.getMessage());
			result.addObject("code", 500);
			result.addObject("msg", e.getMessage());
		} 
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
		/*try {*/
		List<jkdaglfxModel> yjdfxList=jkdaglfxmanger.getyjdfx(kssj,jssj,jgdm,sjlx);//健康档案各乡镇发布
		String czrkzs=jkdaglfxmanger.getczrkzs(jgdm);//常驻人口总数
		String ldrkzs=jkdaglfxmanger.getldrkzs(jgdm);//流动人口总数
		List<SwxxJgdmModel>jdjgList=jkdaglfxmanger.getjdjgList(jgdm);//建档乡镇查询
		
		List<jkdaglfxModel> djdfxList=jkdaglfxmanger.getdjdfx(jgdm);//待建档分析
		
		List<jkdaglfxModel> jdqsfxList=jkdaglfxmanger.getjdqsfx(kssj,jssj,jgdm,sjlx,jdrqgs);//建档趋势分析
		
		result.addObject("kssj", kssj);
		result.addObject("jssj", jssj);
		result.addObject("jssjs", jssjs);
		result.addObject("jgdm", jgdm);
		result.addObject("yjdfxList", yjdfxList);
		result.addObject("jdjgList", jdjgList);
		result.addObject("czrkzs", czrkzs);
		result.addObject("ldrkzs", ldrkzs);
		result.addObject("djdfxList", djdfxList);
		result.addObject("jdqsfxList", jdqsfxList);
		result.setViewName("wszygl/jkdaglfx");
		/*}catch(Exception e) {
			logger.warn(e.getMessage());
			result.addObject("code", 500);
			result.addObject("msg", e.getMessage());
		} */
		return result;
	}
	
	
	@RequestMapping("/djdfxxz")
	public ModelAndView jtysTdXzHzList(HttpServletRequest request, HttpServletResponse response) {
		String  yljgdm = request.getParameter("p_yljgdm"); 
		String  xlh=request.getParameter("p_xlh");
		String  xb = request.getParameter("p_xb"); 
		String  csrq=request.getParameter("p_csrq");
		ModelAndView result = new ModelAndView();
		try {  
			PageRequest pageRequest = newPageRequest(request);
			PageResult<jkdaglfxModel> page = jkdaglfxmanger.pageSelect(pageRequest);
			
			result.addObject("yljgdm", yljgdm);
			result.addObject("xlh",xlh);
			result.addObject("xb",xb);
			result.addObject("csrq", csrq);
			result.addObject("code", 0);
			result.addObject("msg", "success");
			result.addObject("count", page.getTotalCount());
			result.addObject("data", page.getResult());
			result.setViewName("wszygl/jkdaglfx");
		}catch(Exception e) {
			logger.warn(e.getMessage());
			result.addObject("code", 500);
			result.addObject("msg", e.getMessage());
		}
		 
		return result;

	}
	
	
	@Override
	public Class<jkdaglfxModel> getEntityClass() {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public BaseMybatisManager<jkdaglfxModel, String> getBaseManager() {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public String getViewPath() {
		// TODO Auto-generated method stub
		return null;
	}

}
