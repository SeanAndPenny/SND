package com.wondersgroup.wszygl.controller;

import java.text.SimpleDateFormat;
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
import com.wondersgroup.wszygl.manager.GxqHmcManger;
import com.wondersgroup.wszygl.model.GxqHmcModel;
import com.wondersgroup.wszygl.model.SwxxJgdmModel;

@Component
@RequestMapping("/gxqhmc")
public class GxqHmcController extends BaseMybatisController<GxqHmcModel, String> {
	@Autowired
	public GxqHmcManger gxqhmcManger;

	@RequestMapping("/gxqhmc")
	public ModelAndView fmxzList(HttpServletRequest request, HttpServletResponse response) {
		String yljgdm = request.getParameter("p_yljgdm");
		String tbrq = request.getParameter("p_tbrq");

		SimpleDateFormat formatter = new SimpleDateFormat("yyyy-MM");
		Date date = new Date(System.currentTimeMillis());
		Calendar cale = Calendar.getInstance();
		cale = Calendar.getInstance();
		cale.add(Calendar.MONTH, -1);
		cale.set(Calendar.DAY_OF_MONTH, 1);
		if (tbrq == "" || tbrq == null) {
			tbrq = formatter.format(cale.getTime());
		}
		;

		ModelAndView result = new ModelAndView();
		result.setViewName("wszygl/gxqhmc");
		try {
			result.addObject("yljgdm", yljgdm);
			result.addObject("tbrq", tbrq);

			request.setAttribute("tbrq", tbrq);
			result.addObject("code", 0);
			result.addObject("msg", "success");
			List<GxqHmcModel> gxqhmcList = gxqhmcManger.getgGxqhmcList(yljgdm, tbrq);
			List<SwxxJgdmModel> gxqhmcjgList = gxqhmcManger.getjgList();

			result.addObject("gxqhmcList", gxqhmcList);
			result.addObject("gxqhmcjgList", gxqhmcjgList);
		} catch (Exception e) {
			logger.warn(e.getMessage());
			result.addObject("code", 500);
			result.addObject("msg", e.getMessage());
		}
		return result;
	}

	@RequestMapping("/toExcel2")

	public ModelAndView toExcel2(HttpServletRequest request, HttpServletResponse response) {

		String yljgdm = request.getParameter("p_yljgdm");
		String tbrq = request.getParameter("p_tbrq");

		SimpleDateFormat formatter = new SimpleDateFormat("yyyy-MM");
		Date date = new Date(System.currentTimeMillis());
		Calendar cale = Calendar.getInstance();
		cale = Calendar.getInstance();
		cale.add(Calendar.MONTH, -1);
		cale.set(Calendar.DAY_OF_MONTH, 1);
		if (tbrq == "" || tbrq == null) {
			tbrq = formatter.format(cale.getTime());
		}
		;

		ModelAndView result = new ModelAndView();

		try {
			result.addObject("yljgdm", yljgdm);
			result.addObject("tbrq", tbrq);
			result.addObject("code", 0);
			result.addObject("msg", "success");
			List<GxqHmcModel> gxqhmcList = gxqhmcManger.getgGxqhmcList(yljgdm, tbrq);
			List<SwxxJgdmModel> gxqhmcjgList = gxqhmcManger.getjgList();
			List<GxqHmcModel> zsgxqhmcList = gxqhmcManger.getZsGxqhmcList(yljgdm, tbrq);
			 
				
			result.addObject("gxqhmcList", gxqhmcList);
			result.addObject("gxqhmcjgList", gxqhmcjgList);

			result.addObject("zsgxqhmcList", zsgxqhmcList);
		} catch (Exception e) {
			logger.warn(e.getMessage());
			result.addObject("code", 500);
			result.addObject("msg", e.getMessage());
		}
		result.setViewName("wszygl/toExcel2");
		return result;

	}

	@Override
	public Class<GxqHmcModel> getEntityClass() {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public BaseMybatisManager<GxqHmcModel, String> getBaseManager() {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public String getViewPath() {
		// TODO Auto-generated method stub
		return null;
	}

}
