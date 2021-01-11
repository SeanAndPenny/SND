package com.wondersgroup.wszygl.controller;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.wondersgroup.api.mybatis.manager.BaseMybatisManager;
import com.wondersgroup.frame.spr_mybt_mvc.basic.controller.BaseMybatisController;
import com.wondersgroup.wszygl.manager.ShujuScQkManger;
import com.wondersgroup.wszygl.model.ShujuScQkModel;

@Controller
@RequestMapping("/shujuScQk")
public class ShujuScQkController extends BaseMybatisController<ShujuScQkModel, String> {
	@Autowired
	public ShujuScQkManger shujuScQkManger;

	@RequestMapping("/shujuScQk")
	public ModelAndView shujuScQklist(HttpServletRequest request, HttpServletResponse response) {
		ModelAndView result = new ModelAndView();
		List<ShujuScQkModel> list = null;
		List<ShujuScQkModel> list2 = new ArrayList<ShujuScQkModel>();
		String bm=request.getParameter("p_bm");//表名
		String ywlx=request.getParameter("p_ywlx");//业务类型
		String jgfl=request.getParameter("p_jgfl");//结果分类
		
	 
		try {
			int cc = shujuScQkManger.getZsl(bm,ywlx);//获得总条数
			System.out.println("cc==============="+cc);
			String curr = request.getParameter("p_curr");//获得当前页面
			int ccc = 0;
			if (curr == null || "".equals(curr)||"undefined".equals(curr)) {
				ccc = (int) 1;
			} else {
				ccc = Integer.parseInt(curr);
			}
			
			List<ShujuScQkModel> shujuScQklist = shujuScQkManger.getShujuScQklist(ccc,bm,ywlx);//获取字典表中数据
			 
		 
			for (int i = 0; i < shujuScQklist.size(); i++) {
				//循环将字典表数据带到getList里查询
				list = shujuScQkManger.getList(shujuScQklist.get(i).getYwm(), shujuScQklist.get(i).getZwm(),
						shujuScQklist.get(i).getYwlx(), shujuScQklist.get(i).getSjc(),jgfl,shujuScQklist.get(i).getYwsj());
				//循环将list的值付到list2里,用于展示
				for (int j = 0; j < list.size(); j++) {
					list2.addAll(list);
				}
			}
			//业务类型分类
			List<ShujuScQkModel> ywlist=shujuScQkManger.getywlist();	
			
			result.addObject("cc", cc);
			result.addObject("ywlist", ywlist);
			result.addObject("list", list2);
			result.setViewName("wszygl/shujuScQk");
		} catch (Exception e) {
			logger.warn(e.getMessage());
			result.addObject("code", 500);
			result.addObject("msg", e.getMessage());
		}
		return result;
	}

	@Override
	public Class<ShujuScQkModel> getEntityClass() {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public BaseMybatisManager<ShujuScQkModel, String> getBaseManager() {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public String getViewPath() {
		// TODO Auto-generated method stub
		return null;
	}

}
