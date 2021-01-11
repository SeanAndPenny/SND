package com.wondersgroup.wszygl.controller;

import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.Date;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.wondersgroup.api.beans.page.PageRequest;
import com.wondersgroup.api.beans.page.PageResult;
import com.wondersgroup.api.mybatis.manager.BaseMybatisManager;
import com.wondersgroup.frame.spr_mybt_mvc.basic.controller.BaseMybatisLayuiController;
import com.wondersgroup.wszygl.manager.SjscjlManager;
import com.wondersgroup.wszygl.model.SjscInfo;

@Controller
@RequestMapping("/sjscjl")
public class SjscjlController extends BaseMybatisLayuiController<SjscInfo, String>{

	@Autowired
	private SjscjlManager sjscjlManager;
	
	@RequestMapping("/show")
	public String show(HttpServletRequest request) {
		List<Map<String, Object>> jgList =  sjscjlManager.getAllYljg();
		List<Map<String, Object>> tableList = sjscjlManager.gatAllTable();
		request.setAttribute("jgList", jgList);
		request.setAttribute("tableList", tableList);
		Date now = new Date();
		Calendar calendar = Calendar.getInstance();
		calendar.setTime(now);
		calendar.add(Calendar.DATE, -1);
		Date yesterday = calendar.getTime();
		SimpleDateFormat format = new SimpleDateFormat("yyyy-MM-dd");
		String yesterdayStr = format.format(yesterday);
		request.setAttribute("yesterdayStr", yesterdayStr);
		return "wszygl/show";
	}
	
	@RequestMapping("/getData")
	@ResponseBody
	public ModelAndView getData (HttpServletRequest request) {
		debugAllRequestParams(request);
		ModelAndView result = new ModelAndView();
		try {
			PageRequest pageRequest = newPageRequest(request);
			PageResult<SjscInfo> page = sjscjlManager.getData(pageRequest);
			
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
	
	@Override
	public Class<SjscInfo> getEntityClass() {
		return SjscInfo.class;
	}

	@Override
	protected String getPk(SjscInfo entity) {
		return entity.getId();
	}

	@Override
	public BaseMybatisManager<SjscInfo, String> getBaseManager() {
		return sjscjlManager;
	}

	@Override
	public String getViewPath() {
		return "/sjscjl";
	}

}
