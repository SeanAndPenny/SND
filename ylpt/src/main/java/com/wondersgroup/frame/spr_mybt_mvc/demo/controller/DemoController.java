package com.wondersgroup.frame.spr_mybt_mvc.demo.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.wondersgroup.api.mybatis.manager.BaseMybatisManager;
import com.wondersgroup.frame.spr_mybt_mvc.basic.controller.BaseMybatisLayuiController;
import com.wondersgroup.frame.spr_mybt_mvc.demo.manager.DemoManager;
import com.wondersgroup.frame.spr_mybt_mvc.demo.model.DemoEntity;

@Controller
@RequestMapping("/demo")
public class DemoController extends BaseMybatisLayuiController<DemoEntity, String> {
	@Autowired
	private DemoManager demoManager;

	@Override
	public Class<DemoEntity> getEntityClass() {
		return DemoEntity.class;
	}

	@Override
	public BaseMybatisManager<DemoEntity, String> getBaseManager() {
		return demoManager;
	}

	@RequestMapping("/huanya")
	public ModelAndView huanya(HttpServletRequest request, HttpServletResponse response) {
		ModelAndView result = new ModelAndView(getViewPath() + "/huanya");
		return result;
	}

	@Override
	public String getViewPath() {
		return "/demo";
	}

	@Override
	protected String getPk(DemoEntity entity) {
		return entity == null ? null : entity.getId();
	}

}
