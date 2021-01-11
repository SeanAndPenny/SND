package com.wondersgroup.wszygl.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.wondersgroup.api.mybatis.manager.BaseMybatisManager;
import com.wondersgroup.frame.spr_mybt_mvc.basic.controller.BaseMybatisController;
import com.wondersgroup.wszygl.manager.JjhzfxManger;
import com.wondersgroup.wszygl.manager.XxxManger;
import com.wondersgroup.wszygl.model.JjsjFxModel;
import com.wondersgroup.wszygl.model.SwxxJgdmModel;
import com.wondersgroup.wszygl.model.ZhjgUserModel;

@Component
@RequestMapping("/jjhzfx")
public class JjhzfxController extends BaseMybatisController<JjsjFxModel, String> {
	@Autowired
	public JjhzfxManger jjhzfxManger;
	@Autowired
	public XxxManger xxxmanger;
	@RequestMapping("/jjhzfx")
	public ModelAndView jjhzjbfxList(HttpServletRequest request, HttpServletResponse response) {
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
		List<SwxxJgdmModel> fzjgList = jjhzfxManger.getbajgList(jgdm);
		
		int jjzs = 0;//急救总数
		int ccl=0;//出车量
		List<JjsjFxModel> getchart01List = jjhzfxManger.getchart01List(kssj, jssj,jgdm);
         for(int i=0;i<getchart01List.size();i++) {
        	 jjzs+=Integer.parseInt(getchart01List.get(i).getSl()); 
         }
        List<JjsjFxModel> getchart02List = jjhzfxManger.getchart02List(kssj, jssj,jgdm);
        List<JjsjFxModel> getchart03List = jjhzfxManger.getchart03List(kssj, jssj,jgdm);
       
        List<JjsjFxModel> getchart04List = jjhzfxManger.getchart04List(kssj, jssj,jgdm);
        List<JjsjFxModel> getchart05List = jjhzfxManger.getchart05List(kssj, jssj,jgdm);
        for(int i=0;i<getchart04List.size();i++) {
        	ccl+=Integer.parseInt(getchart04List.get(i).getDyccl()); 	
        }
        
		result.addObject("getchart01List", getchart01List);
		result.addObject("getchart02List", getchart02List);
		result.addObject("getchart03List", getchart03List);
		result.addObject("getchart04List", getchart04List);
		result.addObject("getchart05List", getchart05List);
		result.addObject("jgdm", jgdm);
		
		result.addObject("fzjgList", fzjgList);
		result.addObject("jjzs", jjzs);
		result.addObject("ccl", ccl);
		result.setViewName("wszygl/jjhzfx");

		return result;

	}

	@Override
	public Class<JjsjFxModel> getEntityClass() {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public BaseMybatisManager<JjsjFxModel, String> getBaseManager() {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public String getViewPath() {
		// TODO Auto-generated method stub
		return null;
	}
}
