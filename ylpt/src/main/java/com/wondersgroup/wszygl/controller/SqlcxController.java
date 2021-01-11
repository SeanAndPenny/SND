package com.wondersgroup.wszygl.controller;

import java.util.ArrayList;
import java.util.HashMap;

import java.util.List;

import java.util.Map.Entry;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;
import com.wondersgroup.api.mybatis.manager.BaseMybatisManager;
import com.wondersgroup.frame.spr_mybt_mvc.basic.controller.BaseMybatisController;
import com.wondersgroup.wszygl.manager.SqlYjcxManger;
import com.wondersgroup.wszygl.model.CsModel;
import com.wondersgroup.wszygl.model.SqlModel;

@Controller
@RequestMapping("/sqlcx")
public class SqlcxController extends BaseMybatisController<SqlModel, String> {
	@Autowired
	public SqlYjcxManger sqlYjcxManger;

	@RequestMapping("/sqlcx")
	public ModelAndView sqlcx(HttpServletRequest request, HttpServletResponse response) {
		ModelAndView result = new ModelAndView();
		result.setViewName("wszygl/sqlcx");
		return result;
	}

	@RequestMapping("/sqlyjcx")
	public ModelAndView sqlyjcx(HttpServletRequest request, HttpServletResponse response) {
		String sqlbk = request.getParameter("p_sqlbk");
		System.out.println("sqlbk==" + sqlbk);
		ModelAndView result = new ModelAndView();
		List<CsModel> list1 = new ArrayList<CsModel>();
		List<CsModel> list2 = new ArrayList<CsModel>();
		result.addObject("sqlbk", sqlbk);
		List<HashMap<String, Object>> list = sqlYjcxManger.getsqlyjcx(sqlbk);
		try {
			for (int i = 0; i < 1; i++) {
				for (Entry<String, Object> vo : list.get(0).entrySet()) {
					CsModel cs = new CsModel();
					cs.setKey(vo.getKey());
					list1.add(cs);
				}
			}
			for (int i = 0; i < list.size(); i++) {
				for (Entry<String, Object> vo : list.get(i).entrySet()) {
					CsModel cs1 = new CsModel();
					if (vo.getValue() == null || vo.getValue() == "") {
						cs1.setValue("null");
					} else {
						cs1.setValue(vo.getValue().toString());
					}
					list2.add(cs1);
				}
			}
			request.setAttribute("sqlList", list);
			result.addObject("sqlList", list);
			request.setAttribute("list1", list1);
			result.addObject("list1", list1);
			request.setAttribute("list2", list2);
			result.addObject("list2", list2);
			result.addObject("code", 0);
			result.addObject("code", 0);
			result.addObject("msg", "success");

		} catch (Exception e) {
			logger.warn(e.getMessage());
			result.addObject("code", 500);
			result.addObject("msg", e.getMessage());
		}
		result.setViewName("wszygl/sqlcx");
		return result;
	}

	@Override
	public Class<SqlModel> getEntityClass() {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public BaseMybatisManager<SqlModel, String> getBaseManager() {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public String getViewPath() {
		// TODO Auto-generated method stub
		return null;
	}

}
