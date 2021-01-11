package com.wondersgroup.wszygl.controller;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map.Entry;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.log4j.net.SyslogAppender;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.wondersgroup.api.beans.page.PageRequest;
import com.wondersgroup.api.beans.page.PageResult;
import com.wondersgroup.api.mybatis.manager.BaseMybatisManager;
import com.wondersgroup.frame.spr_mybt_mvc.basic.controller.BaseMybatisController;
import com.wondersgroup.ggwsgl.model.OptionModel;
import com.wondersgroup.wszygl.manager.Tjfxmanger;
import com.wondersgroup.wszygl.manager.YwxxXz2Manger;
import com.wondersgroup.wszygl.manager.YwxxXzManger;
import com.wondersgroup.wszygl.model.CsModel;
import com.wondersgroup.wszygl.model.SqlModel;
import com.wondersgroup.wszygl.model.TjModel;
import com.wondersgroup.wszygl.model.TjxxModel;
import com.wondersgroup.wszygl.model.XxymZdModel;
import com.wondersgroup.wszygl.model.YwbmModel;

@Controller
@RequestMapping("/ywxxXz")
public class ywxxXzController extends BaseMybatisController<SqlModel, String>{
	@Autowired
	public YwxxXzManger ywxxXzmanger;
	@Autowired
	public YwxxXz2Manger ywxxXz2manger;
	@Autowired
	public Tjfxmanger tjfxmanger;
	@RequestMapping("/ywxxXz")
	public ModelAndView sqlyjcx(HttpServletRequest request, HttpServletResponse response) {
		
		ModelAndView result = new ModelAndView();
		List<CsModel> list1 = new ArrayList<CsModel>();
		List<CsModel> list2 = new ArrayList<CsModel>();
		String kssj = request.getParameter("p_kssj");
		String jssj = request.getParameter("p_jssj"); 
		String jgdm = request.getParameter("p_yljgdm");
		String ywbz = request.getParameter("p_ywbz");
		String sl1 = request.getParameter("p_lx");
		String curr = request.getParameter("p_curr");
		String mcdm = request.getParameter("p_mcdm");
		String id6=request.getParameter("p_id6"); 
	
		System.out.println("id6======"+id6);
		List<XxymZdModel> XxymZdList =ywxxXzmanger.getXxymZdList(sl1,ywbz);//详细页面查询的条件字段
		if(("TJFX").equals(ywbz)) {//体检分析
			try {
				String yljgdm = request.getParameter("p_yljgdm");
				PageRequest pageRequest =newPageRequest(request);
				PageResult<TjxxModel> page = tjfxmanger.pageSelect(pageRequest);
					result.addObject("mcdm",mcdm);
					result.addObject("kssj", kssj);
					result.addObject("jssj", jssj);
					result.addObject("jgdm", jgdm);  
					result.addObject("code", 0);
					result.addObject("msg", "success");	
					result.addObject("count", page.getTotalCount());
					result.addObject("data", page.getResult());
				}catch(Exception e) {
					logger.warn(e.getMessage());
					result.addObject("code", 500);
					result.addObject("msg", e.getMessage());
				}
				result.setViewName("wszygl/ywxxXz_tjfx");
			
			 
		}else {
			try {
				int ccc=0;
				if(curr==null||"".equals(curr)||"undefined".equals(curr)) {
					ccc=(int) 1;
				}else {
					ccc=Integer.parseInt(curr);
				}
				int list1siz=0;
				
				
				   YwbmModel  ywbmmodel=ywxxXzmanger.getYwbm(sl1,ywbz);
				   List<HashMap<String, Object>> list=null;
				   int cc=0;
				   if(mcdm.contains("~") ) {//名称代码含~
					   String[] mcdmList = mcdm.split("~");
					   String mcdm1=mcdmList[0];
					   String mcdm2=mcdmList[1];
					   cc= ywxxXz2manger.getCount(
								kssj,jssj,jgdm,
								ywbmmodel.getSqlnr(),
								ywbmmodel.getPdtj1(),
								ywbmmodel.getPdtj2(),
								ywbmmodel.getPdtj3(),
								ywbmmodel.getPdtj4(),
								ywbmmodel.getPdtj5(),
								ywbmmodel.getPdtj6(),
								ywbmmodel.getPdtj7(),
								ywbmmodel.getPdtj8(),
								ywbmmodel.getPdtj9(),
								ywbmmodel.getPdtj10(),
								mcdm1,mcdm2,id6);
						 
						  list = ywxxXz2manger.getYwxxzs(
								kssj,jssj,jgdm,
								ywbmmodel.getSqlnr(),
								ywbmmodel.getPdtj1(),
								ywbmmodel.getPdtj2(),
								ywbmmodel.getPdtj3(),
								ywbmmodel.getPdtj4(),
								ywbmmodel.getPdtj5(),
								ywbmmodel.getPdtj6(),
								ywbmmodel.getPdtj7(),
								ywbmmodel.getPdtj8(),
								ywbmmodel.getPdtj9(),
								ywbmmodel.getPdtj10(),
								mcdm1,mcdm2, ccc,id6);//业务详细展示
				   
					   
					   
				   }else {
					   cc= ywxxXzmanger.getCount(
								kssj,jssj,jgdm,
								ywbmmodel.getSqlnr(),
								ywbmmodel.getPdtj1(),
								ywbmmodel.getPdtj2(),
								ywbmmodel.getPdtj3(),
								ywbmmodel.getPdtj4(),
								ywbmmodel.getPdtj5(),
								ywbmmodel.getPdtj6(),
								ywbmmodel.getPdtj7(),
								ywbmmodel.getPdtj8(),
								ywbmmodel.getPdtj9(),
								ywbmmodel.getPdtj10(),mcdm,id6);
						 
						  list = ywxxXzmanger.getYwxxzs(
								kssj,jssj,jgdm,
								ywbmmodel.getSqlnr(),
								ywbmmodel.getPdtj1(),
								ywbmmodel.getPdtj2(),
								ywbmmodel.getPdtj3(),
								ywbmmodel.getPdtj4(),
								ywbmmodel.getPdtj5(),
								ywbmmodel.getPdtj6(),
								ywbmmodel.getPdtj7(),
								ywbmmodel.getPdtj8(),
								ywbmmodel.getPdtj9(),
								ywbmmodel.getPdtj10(),
								mcdm, ccc,id6);//业务详细展示
				   }
					  
					
					for (int i = 0; i < 1; i++) {
						for (Entry<String, Object> vo : list.get(0).entrySet()) {
							CsModel cs = new CsModel();
							cs.setKey(vo.getKey());
							list1.add(cs);
						}
					}
					
					list1siz= list1.size();
					for (int i = 0; i < list.size(); i++) {
						for (Entry<String, Object> vo : list.get(i).entrySet()) {
							CsModel cs1 = new CsModel();
							if (vo.getValue() == null || vo.getValue() == "") {
								cs1.setValue("未知");
							} else {
								cs1.setValue(vo.getValue().toString());	
							}
							list2.add(cs1);
						}
					}
					result.addObject("XxymZdList",XxymZdList);
					result.addObject("cc", cc);
					
					result.addObject("mcdm",mcdm);
					result.addObject("list1siz", list1siz);
					result.addObject("list1", list1);
					result.addObject("list2", list2);
					result.addObject("kssj", kssj);
					result.addObject("jssj", jssj);
					result.addObject("jgdm", jgdm);
					result.addObject("ywbz", ywbz);
					result.addObject("sl1", sl1);
					result.addObject("code", 0);
					result.addObject("msg", "success");
				 
				
				}catch(Exception e) {
					logger.warn(e.getMessage());
					result.addObject("code", 500);
					result.addObject("msg", e.getMessage());
				}
				result.setViewName("wszygl/ywxxXz");	
		}
		
		return result;
	}
	@RequestMapping("/optionnr")//添加option
	public ModelAndView jyqyecharts(HttpServletRequest request,HttpServletResponse response) {
		ModelAndView result = new ModelAndView();
		try {
			String ywbz = request.getParameter("p_ywbz");
			String wdyw = request.getParameter("p_lx");
			String zddm = request.getParameter("p_zddm");
			String yljgdm=request.getParameter("p_yljgdm");
			String sjsjg=request.getParameter("p_sjsjg");
			System.out.println("sjsjg=="+sjsjg);
			System.out.println("yljgdm=="+yljgdm);
			List<OptionModel>OptionList = null;
			System.out.println(zddm);
			if(("1").equals(sjsjg)) {
				OptionList = ywxxXzmanger.getOption(ywbz,wdyw,zddm,yljgdm);	
			}else {
				OptionList = ywxxXzmanger.getOptions(ywbz,wdyw,zddm);		
			}
			
			result.addObject("OptionList", OptionList);
		}catch(Exception e) {
			logger.warn(e.getMessage());
			result.addObject("code", 500);
			result.addObject("msg", e.getMessage());
		}
		return result;
		
	}
	
	
	@RequestMapping("/ywxxXz_tjxx")
	public ModelAndView jybgdbh(HttpServletRequest request,HttpServletResponse response) {
		ModelAndView result = new ModelAndView(); 
		String yljgdm = request.getParameter("yljgdm");
		String tjbh = request.getParameter("tjbh");
		try {
			
			result.addObject("tjbh", tjbh);
			result.addObject("yljgdm", yljgdm);  
			TjModel jyrxx = tjfxmanger.getTjbgdbh(yljgdm,tjbh);
			List<TjModel> jyrxxList=tjfxmanger.getTjbgdbhList(yljgdm,tjbh);
			result.addObject("jyrxxList", jyrxxList);
			result.addObject("jyrxx", jyrxx);
		}catch(Exception e) {
			logger.warn(e.getMessage());
			result.addObject("code", 500);
			result.addObject("msg", e.getMessage());
		}
		result.setViewName("wszygl/tjbgd");
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
