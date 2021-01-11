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

import com.wondersgroup.api.beans.page.PageRequest;
import com.wondersgroup.api.beans.page.PageResult;
import com.wondersgroup.api.mybatis.manager.BaseMybatisManager;
import com.wondersgroup.frame.spr_mybt_mvc.basic.controller.BaseMybatisController;
import com.wondersgroup.wszygl.manager.BaManger;
import com.wondersgroup.wszygl.manager.XxxManger;
import com.wondersgroup.wszygl.manager.Ypcrk4Manger;
import com.wondersgroup.wszygl.manager.Ypcrk5Manger;
import com.wondersgroup.wszygl.manager.YpcrkManger;
import com.wondersgroup.wszygl.model.SwxxJgdmModel;
import com.wondersgroup.wszygl.model.YpcrkModel;
import com.wondersgroup.wszygl.model.ZhjgUserModel;

@Controller
@RequestMapping("/ypcrk")
public class YpcrkController extends BaseMybatisController<YpcrkModel, String> {
	@Autowired
	public XxxManger xxxmanger;
	@Autowired
	public BaManger bamanger;
	@Autowired
	public YpcrkManger ypcrkmanger;
	@Autowired
	public Ypcrk4Manger ypcrk4manger;
	@Autowired
	public Ypcrk5Manger ypcrk5manger;

	@RequestMapping("/ypcrk")
	public ModelAndView rycxList(HttpServletRequest request, HttpServletResponse response) {
		ModelAndView result = new ModelAndView();
		String kssj = request.getParameter("p_kssj");
		String jssj = request.getParameter("p_jssj");
		String jgdm = request.getParameter("p_yljgdm");
		
		SimpleDateFormat formatter = new SimpleDateFormat("yyyy-MM-dd");
		Date date = new Date(System.currentTimeMillis());
		Calendar cale = Calendar.getInstance();
		cale = Calendar.getInstance();
		cale.add(Calendar.MONTH, 0);
		cale.set(Calendar.DAY_OF_MONTH, 1);

		try {/// 权限测试
			String userName = null;
			userName = request.getParameter("p_Username");
			HttpServletRequest httpRequest = (HttpServletRequest) request;
			HttpSession session = httpRequest.getSession();
			if (userName == "" || userName == null) {
				userName = (String) session.getAttribute("loginname1");
			}
			System.out.println("userName===" + userName);
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

		try {
			if (kssj == null || ("undefined").equals(kssj)) {
			kssj=formatter.format(cale.getTime());  
			}
			if (jssj == null || ("undefined").equals(jssj)) {
			jssj=formatter.format(date);  	 
			}
			// 药品出入库机构
			List<SwxxJgdmModel> ypcrkjgList = bamanger.getbajgList(jgdm);
			// 综合药品金额
			List<YpcrkModel> zhypjeList = ypcrkmanger.getypzh(kssj, jssj, jgdm);
			// 基层医院金额
			List<YpcrkModel> jcypjeList = ypcrkmanger.getypjc(kssj, jssj, jgdm);

			result.addObject("zhypjeList", zhypjeList);
			result.addObject("jcypjeList", jcypjeList);
			result.addObject("ypcrkjgList", ypcrkjgList);
			result.addObject("kssj", kssj);
			result.addObject("jssj", jssj);
			result.addObject("jgdm", jgdm);
		} catch (Exception e) {
			logger.warn(e.getMessage());
			result.addObject("code", 500);
			result.addObject("msg", e.getMessage());
		}
		result.setViewName("wszygl/ypcrk");
		return result;
	}

	@RequestMapping("/getechars03")
	public ModelAndView getechars03(HttpServletRequest request, HttpServletResponse response) {
		ModelAndView result = new ModelAndView();
		String kssj = request.getParameter("p_kssj");
		String jssj = request.getParameter("p_jssj");
		String jgdm = request.getParameter("p_jgdm");

		// chars03
		List<YpcrkModel> getechars03List = ypcrkmanger.getechars03List(kssj, jssj, jgdm);
		// chart04
		List<YpcrkModel> getechars04List = ypcrkmanger.getechars04List(kssj, jssj, jgdm);
		// chart05
		List<YpcrkModel> getechars05List = ypcrkmanger.getechars05List(kssj, jssj, jgdm);

		result.addObject("getechars03List", getechars03List);
		result.addObject("getechars04List", getechars04List);
		result.addObject("getechars05List", getechars05List);
		return result;

	}

	@RequestMapping("/gettables")
	public ModelAndView jtysTdXzHzList(HttpServletRequest request, HttpServletResponse response) {
		String jgdm = request.getParameter("p_jgdm");
		String ypbm = request.getParameter("p_ypbm");
		String kssj = request.getParameter("p_kssj");
		String jssj = request.getParameter("p_jssj");

		ModelAndView result = new ModelAndView();

		try {

			PageRequest pageRequest = newPageRequest(request);
			PageResult<YpcrkModel> page = ypcrkmanger.pageSelect(pageRequest);
			result.addObject("jgdm", jgdm);
			result.addObject("ypbm", ypbm);
			result.addObject("kssj", kssj);
			result.addObject("jssj", jssj);

			result.addObject("code", 0);
			result.addObject("msg", "success");
			result.addObject("count", page.getTotalCount());
			result.addObject("data", page.getResult());

		} catch (Exception e) {
			logger.warn(e.getMessage());
			result.addObject("code", 500);
			result.addObject("msg", e.getMessage());
		}

		return result;

	}

	@RequestMapping("/gettables4")
	public ModelAndView jtysTdXzHzList4(HttpServletRequest request, HttpServletResponse response) {
		String jgdm = request.getParameter("p_jgdm");
		String ypbm = request.getParameter("p_ypbm");
		String kssj = request.getParameter("p_kssj");
		String jssj = request.getParameter("p_jssj");
		ModelAndView result = new ModelAndView();
		try {

			PageRequest pageRequest = newPageRequest(request);
			PageResult<YpcrkModel> page = ypcrk4manger.pageSelect(pageRequest);
			result.addObject("jgdm", jgdm);
			result.addObject("ypbm", ypbm);
			result.addObject("kssj", kssj);
			result.addObject("jssj", jssj);

			result.addObject("code", 0);
			result.addObject("msg", "success");
			result.addObject("count", page.getTotalCount());
			result.addObject("data", page.getResult());

		} catch (Exception e) {
			logger.warn(e.getMessage());
			result.addObject("code", 500);
			result.addObject("msg", e.getMessage());
		}

		return result;

	}

	@RequestMapping("/gettables5")
	public ModelAndView jtysTdXzHzList5(HttpServletRequest request, HttpServletResponse response) {
		String jgdm = request.getParameter("p_jgdm");
		String ypbm = request.getParameter("p_ypbm");
		String kssj = request.getParameter("p_kssj");
		String jssj = request.getParameter("p_jssj");
		ModelAndView result = new ModelAndView();
		try {

			PageRequest pageRequest = newPageRequest(request);
			PageResult<YpcrkModel> page = ypcrk5manger.pageSelect(pageRequest);
			result.addObject("jgdm", jgdm);
			result.addObject("ypbm", ypbm);
			result.addObject("kssj", kssj);
			result.addObject("jssj", jssj);

			result.addObject("code", 0);
			result.addObject("msg", "success");
			result.addObject("count", page.getTotalCount());
			result.addObject("data", page.getResult());

		} catch (Exception e) {
			logger.warn(e.getMessage());
			result.addObject("code", 500);
			result.addObject("msg", e.getMessage());
		}
		result.setViewName("wszygl/ypcrkgettables");
		return result;

	}

	@RequestMapping("/ypcrjglxk")
	public ModelAndView ypcrjglxk(HttpServletRequest request, HttpServletResponse response) {
		ModelAndView result = new ModelAndView();
		String jgdm = request.getParameter("p_jgdm");
		String jglx = ypcrkmanger.getypcrjglxk(jgdm);
		result.addObject("jglx", jglx);
		return result;
	}

	@Override
	public Class<YpcrkModel> getEntityClass() {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public BaseMybatisManager<YpcrkModel, String> getBaseManager() {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public String getViewPath() {
		// TODO Auto-generated method stub
		return null;
	}

}
