package com.wondersgroup.wszygl.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.wondersgroup.api.mybatis.manager.BaseMybatisManager;
import com.wondersgroup.frame.spr_mybt_mvc.basic.controller.BaseMybatisController;
import com.wondersgroup.wszygl.manager.JyFxManger;
import com.wondersgroup.wszygl.manager.XxxManger;
import com.wondersgroup.wszygl.model.JyFxModel;
import com.wondersgroup.wszygl.model.SwxxJgdmModel;
import com.wondersgroup.wszygl.model.ZhjgUserModel;

@Controller
@RequestMapping("/jyfx")
public class JcTjFxController  extends BaseMybatisController<JyFxModel, String> {
	
	@Autowired 
	public JyFxManger jyfxmanger;
	@Autowired 
	public XxxManger xxxmanger;
	
	@RequestMapping("/jyfx")
	public ModelAndView mzjfxList(HttpServletRequest request, HttpServletResponse response) {
		ModelAndView result = new ModelAndView();
		String kssj = request.getParameter("p_kssj");
		String jssj = request.getParameter("p_jssj");
		String jgdm = request.getParameter("p_jgdm");
		try {///权限测试 
			String userName=null;
			 userName = request.getParameter("p_Username");	 
			 if(userName=="" || userName==null) {
					  userName=(String) request.getSession().getAttribute("ssoUsername"); 
				} 
			 System.out.println("jgdm=="+jgdm);
			if(("").equals(jgdm)||jgdm==null) {
				List<ZhjgUserModel> qx=xxxmanger.getQx(userName);
				for(int i=0;i<qx.size();i++) { 
					if(("111").equals(qx.get(i).getOrgId()) || ("101000").equals(qx.get(i).getOrgId())) {
						jgdm="";
					}else {
						jgdm=qx.get(i).getOrgCode();
					}
					result.addObject("orgid", qx.get(i).getOrgId()); 
				}
				
			}
			}catch(Exception e) {
				logger.warn(e.getMessage());
				result.addObject("code", 500);
				result.addObject("msg", e.getMessage());
			} 
		try {
			if(kssj==null||("undefined").equals(kssj)) {
				kssj=jyfxmanger.getMinSwsj();
			}
			if(jssj==null||("undefined").equals(jssj)) {
				jssj=jyfxmanger.getMaxSwsj();
			}
			List<SwxxJgdmModel>jyjgList=jyfxmanger.getjyjgList(jgdm);
			List<JyFxModel> jyfxList = jyfxmanger.getjyfxList(kssj, jssj, jgdm);// 综合医院检查人数
			List<JyFxModel> jyjcfxList = jyfxmanger.getjyjcfxList(kssj, jssj, jgdm);// 基层医院检查人数
			result.addObject("kssj", kssj);
			result.addObject("jssj", jssj);
			result.addObject("jgdm", jgdm);
			result.addObject("jyjgList", jyjgList); 
			result.addObject("jyfxList", jyfxList);
			result.addObject("jyjcfxList", jyjcfxList);
		} catch (Exception e) {
			logger.warn(e.getMessage());
			result.addObject("code", 500);
			result.addObject("msg", e.getMessage());
		}
		result.setViewName("wszygl/jyfx");
		return result;

	}
	
	
	
	
	@RequestMapping("/getechars")
	public ModelAndView getechars(HttpServletRequest request, HttpServletResponse response) {
		ModelAndView result = new ModelAndView();
		String kssj = request.getParameter("p_kssj");
		String jssj = request.getParameter("p_jssj");
		String jgdm = request.getParameter("p_jgdm");
		String yylb = request.getParameter("p_yylb");
		 
		List<JyFxModel> getecharsList = jyfxmanger.getechars(kssj, jssj, jgdm,yylb);
		result.addObject("yylb", yylb);
		result.addObject("getecharsList", getecharsList);
		return result;

	}
	
	
	@Override
	public Class<JyFxModel> getEntityClass() {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public BaseMybatisManager<JyFxModel, String> getBaseManager() {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public String getViewPath() {
		// TODO Auto-generated method stub
		return null;
	}

}
