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
import com.wondersgroup.wszygl.manager.JcFxManger;
import com.wondersgroup.wszygl.manager.XxxManger;
import com.wondersgroup.wszygl.model.JcFxModel;
import com.wondersgroup.wszygl.model.SwxxJgdmModel;
import com.wondersgroup.wszygl.model.ZhjgUserModel;


@Controller
@RequestMapping("/jcfx")
public class JcFxController extends BaseMybatisController<JcFxModel, String> {
	@Autowired 
	public JcFxManger jcfxmanger;
	@Autowired 
	public XxxManger xxxmanger;
	@RequestMapping("/jcfx")
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
				kssj=jcfxmanger.getMinSwsj();
			}
			if(jssj==null||("undefined").equals(jssj)) {
				jssj=jcfxmanger.getMaxSwsj();
			}
			List<SwxxJgdmModel>jcjgList=jcfxmanger.getjcjgList(jgdm);
			List<JcFxModel> jcfxList = jcfxmanger.getjcfxList(kssj, jssj, jgdm);// 综合医院检查人数
			List<JcFxModel> jcjcfxList = jcfxmanger.getjcjcfxList(kssj, jssj, jgdm);// 基层医院检查人数
			result.addObject("kssj", kssj);
			result.addObject("jssj", jssj);
			result.addObject("jgdm", jgdm);
			result.addObject("jcfxList", jcfxList); 
			result.addObject("jcjcfxList", jcjcfxList);
			result.addObject("jcjgList", jcjgList);
		} catch (Exception e) {
			logger.warn(e.getMessage());
			result.addObject("code", 500);
			result.addObject("msg", e.getMessage());
		}
		result.setViewName("wszygl/jcfx");
		return result;

	}
	@RequestMapping("/getechars")
	public ModelAndView getechars(HttpServletRequest request, HttpServletResponse response) {
		ModelAndView result = new ModelAndView();
		String kssj = request.getParameter("p_kssj");
		String jssj = request.getParameter("p_jssj");
		String jgdm = request.getParameter("p_jgdm");
		String yylb = request.getParameter("p_yylb");
		 
		List<JcFxModel> getecharsList = jcfxmanger.getechars(kssj, jssj, jgdm,yylb);
		result.addObject("yylb", yylb);
		result.addObject("getecharsList", getecharsList);
		return result;

	}
	@Override
	public Class<JcFxModel> getEntityClass() {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public BaseMybatisManager<JcFxModel, String> getBaseManager() {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public String getViewPath() {
		// TODO Auto-generated method stub
		return null;
	}

}
