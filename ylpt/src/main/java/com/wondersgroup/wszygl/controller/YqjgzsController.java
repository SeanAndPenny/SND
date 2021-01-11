package com.wondersgroup.wszygl.controller;




import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.Date;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.jasig.cas.client.authentication.AttributePrincipal;
import org.jasig.cas.client.util.AssertionHolder;
import org.jasig.cas.client.validation.Assertion;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.wondersgroup.api.beans.page.PageRequest;
import com.wondersgroup.api.beans.page.PageResult;
import com.wondersgroup.api.mybatis.manager.BaseMybatisManager;
import com.wondersgroup.frame.spr_mybt_mvc.basic.controller.BaseMybatisController;
import com.wondersgroup.wszygl.manager.BasycxManger;
import com.wondersgroup.wszygl.manager.CsrsManger;
import com.wondersgroup.wszygl.manager.CwtjManger;
import com.wondersgroup.wszygl.manager.FmjlManger;
import com.wondersgroup.wszygl.manager.JdtjManger;
import com.wondersgroup.wszygl.manager.JtysManger;
import com.wondersgroup.wszygl.manager.SsjbManger;
import com.wondersgroup.wszygl.manager.SsjgcxManger;
import com.wondersgroup.wszygl.manager.SsywjcManger;
import com.wondersgroup.wszygl.manager.WcxzManger;
import com.wondersgroup.wszygl.manager.YjclManger;
import com.wondersgroup.wszygl.manager.YqjgzsManger;
import com.wondersgroup.wszygl.model.CsrsModel;
import com.wondersgroup.wszygl.model.CsrscxlbModel;
import com.wondersgroup.wszygl.model.CwtjModel;
import com.wondersgroup.wszygl.model.JcModel;
import com.wondersgroup.wszygl.model.JdtjModel;
import com.wondersgroup.wszygl.model.JtysModel;
import com.wondersgroup.wszygl.model.JyModel;
import com.wondersgroup.wszygl.model.RylbModel;
import com.wondersgroup.wszygl.model.RyzxtModel;
import com.wondersgroup.wszygl.model.SslistModel;
import com.wondersgroup.wszygl.model.SsywjcModel;
import com.wondersgroup.wszygl.model.YjclModel;
import com.wondersgroup.wszygl.model.YljgMcModel;
import com.wondersgroup.wszygl.model.YqjgzsDaoModel;


@Controller
@RequestMapping("/xqtj")
public class YqjgzsController extends BaseMybatisController<YqjgzsDaoModel, String> {
	@Autowired
	public YqjgzsManger yqjgzsManger;
	@Autowired
    public SsjgcxManger ssjgcxManger;
	@Autowired
	public WcxzManger wcxzManger; 
	@Autowired
	public SsywjcManger ssywjcManger;
	@Autowired
	public SsjbManger ssjbManger;
	@Autowired
	public YjclManger yjclManger;
	@Autowired
	public JtysManger jtysManger;
	@Autowired
	public CwtjManger cwtjManger;
	@Autowired
	public CsrsManger csrsManger;
	@Autowired
	public JdtjManger jdtjManger;
	@Autowired
	public FmjlManger fmjlManger;
	@Autowired 
	public BasycxManger basycxManger;
	 
	
	@RequestMapping("/ssywzs")//实时业务监测首页列表
	public ModelAndView rycxList(Model m,HttpServletRequest request, HttpServletResponse response) {
		ModelAndView result = new ModelAndView();
		result.setViewName("wszygl/xqtj");		
		 String bz=request.getParameter("p_bz");
		 String ywkssj=request.getParameter("p_ywkssj");
		 String ywjssj=request.getParameter("p_ywjssj"); 
		 if(bz=="" || bz==null) {
			 bz="A1";
		 }
	    System.out.println("ywkssj="+ywkssj);	
	    
        SimpleDateFormat formatter= new SimpleDateFormat("yyyy-MM-dd");
        Date date = new Date(System.currentTimeMillis());
        Calendar cale = Calendar.getInstance(); 
        cale = Calendar.getInstance();  
        cale.add(Calendar.MONTH, 0);  
        cale.set(Calendar.DAY_OF_MONTH, 1);  
		 
		if(ywkssj=="" || ywkssj==null) {
			ywkssj= formatter.format(cale.getTime()); 	
		};
		if(ywjssj=="" || ywjssj==null) {
			ywjssj= formatter.format(date); 	
		}
		
		try {
			result.addObject("ywkssj", ywkssj);
			result.addObject("ywjssj", ywjssj); 
			result.addObject("bz", bz); 
			request.setAttribute("ywkssj", ywkssj);
			request.setAttribute("ywjssj", ywjssj); 
			request.setAttribute("bz", bz); 
			 
			List<SsywjcModel> ssywzsList = ssywjcManger.getSsywzs(ywkssj,ywjssj,bz);
			 
			result.addObject("ssywzsList", ssywzsList);
			request.setAttribute("ssywzsList", ssywzsList);
			 
			
			 
			 
		}catch(Exception e) {
			logger.warn(e.getMessage());
			result.addObject("code", 0);
			result.addObject("code", 500);
			result.addObject("msg", e.getMessage());
		}
		return result;
	}
	@RequestMapping("/xqtj")
	public ModelAndView login(HttpServletRequest request, HttpServletResponse response) {
		ModelAndView result = new ModelAndView();
		 try { //用于资源目录的权限
			 HttpServletRequest httpRequest = (HttpServletRequest) request;
			 HttpSession session = httpRequest.getSession();
			String  ssoUsername=(String) session.getAttribute("loginname1");
			 session.getAttribute("pwd1");
			
			 String name=yqjgzsManger.getname(ssoUsername);//账号对应的中文名称
			 request.setAttribute("name", name); 
			 
			 /*String ssoUsername="";//用户登录名
				Assertion assertion = AssertionHolder.getAssertion();
				if(null!=assertion){
				AttributePrincipal ap = assertion.getPrincipal(); //获取AttributePrincipal对象，这是客户端对象
				ssoUsername = ap.getName(); 
				String name=yqjgzsManger.getname(ssoUsername);//账号对应的中文名称
				request.setAttribute("name", name); 
				result.addObject("ssoUsername", ssoUsername); 
				request.getSession().setAttribute("ssoUsername",ssoUsername);
				}	*/
		} catch (Exception e) {
			 
		} 
		 
		
		
		
		
		String pid = request.getParameter("pid");
		
		String startdate = request.getParameter("p_startdate");
		String enddate = request.getParameter("p_enddate");
		
		 SimpleDateFormat formatter= new SimpleDateFormat("yyyy-MM-dd");
	        Date date = new Date(System.currentTimeMillis());
	        Calendar cale = Calendar.getInstance(); 
	        cale = Calendar.getInstance();  
	        cale.add(Calendar.YEAR, -20);  
	        cale.set(Calendar.DAY_OF_YEAR, 1);  
			 
			if(startdate=="" || startdate==null) {
				//startdate= formatter.format(cale.getTime());
				startdate=	yqjgzsManger.getStartdate();
				System.out.println("startdate="+startdate);
			};
			if(enddate=="" || enddate==null) {
				enddate= formatter.format(date); 	
			}
			result.addObject("pid", pid);
			result.addObject("startdate", startdate);
			result.addObject("enddate", enddate);
		System.out.println("enddate"+enddate);
		
		String ywlx = request.getParameter("p_ywlx");
		
		List<YljgMcModel> bajgList =  basycxManger.getAllYljg();//病案首页机构分类
		request.setAttribute("bajgList", bajgList);
		
		
		List<RylbModel> rylbList = ssywjcManger.getRylb(); //人员查询分类
		request.setAttribute("rylbList", rylbList);
		
		List<CsrscxlbModel>csrscxlbList = csrsManger.getCxlb(); //出生人数查询分类
		request.setAttribute("csrscxlbList", csrscxlbList);
		
		List<JtysModel> jtyslbList = jtysManger.getJtyslb(); //家庭医生签约查询分类
		request.setAttribute("jtyslbList", jtyslbList);
		
		
		List<RylbModel> sscxList = ssywjcManger.getSslbcx(); 
		request.setAttribute("sscxList", sscxList);
		try {
		//应急车辆统计
		YjclModel yjclList=yjclManger.getYjclList();
		String yjcl=yjclList.getSl();
		request.setAttribute("yjcl", yjcl);
	}  catch (Exception e) {
		logger.warn(e.getMessage());
		result.addObject("code", 500);
		result.addObject("msg", e.getMessage());
	}
		//首页应急车辆列表展示
		 List<YjclModel> yjclList1 = yjclManger.getYjcl();
			result.addObject("yjclList", yjclList1);
		//首页床位统计列表展示
			List<CwtjModel> cwtjList = cwtjManger.getCwtj();
			result.addObject("cwtjList", cwtjList);
		try {	
		//手术统计
		SslistModel sstjList = ssjbManger.getSstjList();
		String sstj = sstjList.getRs() ;
		request.setAttribute("sstj", sstj);
		//家庭医生统计
		JtysModel jtys=jtysManger.getJtys();
		String jtystj =  jtys.getRs() ;
		request.setAttribute("jtystj", jtystj);
		//建档统计
		JdtjModel jdtj=jdtjManger.getJdtj();
		String jdtjrs =   jdtj.getQqjdzrs() ;
		request.setAttribute("jdtjrs", jdtjrs);
		//全年出生人数统计
		CsrsModel  csrs=jtysManger.getCstj();
		String csrstj =  csrs.getCsrs();
		request.setAttribute("csrstj", csrstj);
	}  catch (Exception e) {
		logger.warn(e.getMessage());
		result.addObject("code", 500);
		result.addObject("msg", e.getMessage());
	}
		//分娩统计人数
		try {
		CsrsModel  fmcsrs=fmjlManger.getFmtj();
		String fmcsrstj =  fmcsrs.getCsrs() ;
		request.setAttribute("fmcsrstj", fmcsrstj);
		}  catch (Exception e) {
			logger.warn(e.getMessage());
			result.addObject("code", 500);
			result.addObject("msg", e.getMessage());
		}
//---------------------------------------------------------------------
		try {
			// 检验样本量
			List<JyModel> jyList = yqjgzsManger.getJy();
			result.addObject("jyList", jyList);
			 
			List<String> sfwsList = new ArrayList<String>(); 
			for (int i = 0; i < jyList.size(); i++) {
				sfwsList.add("'" + jyList.get(i).getSfws() + "'");	 
			}
			request.setAttribute("sfwsList", sfwsList);
			 
		}  catch (Exception e) {
			logger.warn(e.getMessage());
			result.addObject("code", 500);
			result.addObject("msg", e.getMessage());
		}
		try {
			// 影像诊断量
			List<JcModel> jcList = yqjgzsManger.getJc();
			result.addObject("jcList", jcList);
			 
			List<String> JcsfwsList = new ArrayList<String>(); 
			for (int i = 0; i < jcList.size(); i++) {
				JcsfwsList.add("'" + jcList.get(i).getSfws() + "'");	 
			}
			request.setAttribute("JcsfwsList", JcsfwsList);
			 
		}  catch (Exception e) {
			logger.warn(e.getMessage());
			result.addObject("code", 500);
			result.addObject("msg", e.getMessage());
		}
		
		//出生人数统计-------
		try {
			List<CsrsModel> csrsList = csrsManger.getCsrstj();
			result.addObject("csrsList", csrsList);
			List<String> yylxList = new ArrayList<String>();
			 
			 for(int i=0;i<csrsList.size();i++) {
				 yylxList.add("'" + csrsList.get(i).getYylx() + "'");
			 }
			request.setAttribute("yylxList", yylxList);
			 
			 
			result.addObject("code", 0);
			result.addObject("msg", "success");
			 
		}catch(Exception e) {
			logger.warn(e.getMessage());
			result.addObject("code", 500);
			result.addObject("msg", e.getMessage());
		}
		//分娩人数统计-------
		try {
			List<CsrsModel> fmrsList = csrsManger.getFmrstj();
			result.addObject("fmrsList", fmrsList);
			
			List<String> hjbzList = new ArrayList<String>();
			 
			 for(int i=0;i<fmrsList.size();i++) {
				 hjbzList.add("'" + fmrsList.get(i).getHjbz() + "'");
			 }
			request.setAttribute("hjbzList", hjbzList);
			
			result.addObject("code", 0);
			result.addObject("msg", "success");
		} catch (Exception e) {
			logger.warn(e.getMessage());
			result.addObject("code", 500);
			result.addObject("msg", e.getMessage());
		}
		
		//床位统计饼图-------------------------
		try {
			 
			List<CwtjModel> cwList = cwtjManger.getCwbxt();
			result.addObject("cwList", cwList);
			List<String> idList = new ArrayList<String>();
			 
			for (int i = 0; i < cwList.size(); i++) {
				idList.add("'" + cwList.get(i).getId() + "'");	
			 }
			request.setAttribute("idList", idList);
			 
			 
			result.addObject("code", 0);
			result.addObject("msg", "success");
			 
		}catch(Exception e) {
			logger.warn(e.getMessage());
			result.addObject("code", 500);
			result.addObject("msg", e.getMessage());
		}
		
//-----------------------------------------------------------------------------		
		try {
			// 首页:手术信息_手术级别
			List<SslistModel> ssjbList = ssjbManger.getSsjb();
			result.addObject("ssjbList", ssjbList);
			 List<String> ssjbdmList = new ArrayList<String>();
			for (int i = 0; i < ssjbList.size(); i++) {
				ssjbdmList.add("'" + ssjbList.get(i).getSsjb() + "'");	
			 }
			request.setAttribute("ssjbdmList", ssjbdmList);
			
			
			
			// 首页:手术信息_手术机构
			List<SslistModel> ssjgList = ssjgcxManger.getSsjg(); 
			result.addObject("ssjgList", ssjgList);
			List<String> ssyljgdmList = new ArrayList<String>();
			for (int i = 0; i < ssjgList.size(); i++) {
				ssyljgdmList.add("'" + ssjgList.get(i).getYljgdm() + "'");	
			 }
			request.setAttribute("ssyljgdmList", ssyljgdmList);
			 
		} catch (Exception e) {
			logger.warn(e.getMessage());
			result.addObject("code", 500);
			result.addObject("msg", e.getMessage());
		}
//---------------------------------------------------------
		try {
			// 首页:家庭医生机构统计
			List<JtysModel> jtysJgList = jtysManger.getJtywJg();
			result.addObject("jtysJgList", jtysJgList);
			
			List<String> qyjgidList = new ArrayList<String>();
			 for(int i=0;i<jtysJgList.size();i++) {
				 qyjgidList.add("'" + jtysJgList.get(i).getQyjgid() + "'");
			 }
			request.setAttribute("qyjgidList", qyjgidList);
			
			 
		} catch (Exception e) {
			logger.warn(e.getMessage());
			result.addObject("code", 500);
			result.addObject("msg", e.getMessage());
		}
		
		try {//家庭医生服务包
			List<JtysModel> jtysFwbList = jtysManger.getJtywFwb();
			result.addObject("jtysFwbList", jtysFwbList);
			List<String> qyfwbidList = new ArrayList<String>();
			 for(int i=0;i<jtysFwbList.size();i++) {
				 qyfwbidList.add("'" + jtysFwbList.get(i).getFwbid() + "'");
			 }
			request.setAttribute("qyfwbidList", qyfwbidList);
			result.addObject("code", 0);
			result.addObject("msg", "success");
			
		} catch (Exception e) {
			logger.warn(e.getMessage());
			result.addObject("code", 500);
			result.addObject("msg", e.getMessage());
		}
		try {//家庭医生团队
			List<JtysModel> jtystdList = jtysManger.getJtywTd();
			result.addObject("jtystdList", jtystdList);
			List<String> qytdbhList = new ArrayList<String>();
			 for(int i=0;i<jtystdList.size();i++) {
				 qytdbhList.add("'" + jtystdList.get(i).getTdbh() + "'");
			 }
			request.setAttribute("qytdbhList", qytdbhList);
			result.addObject("code", 0);
			result.addObject("msg", "success");
			
		} catch (Exception e) {
			logger.warn(e.getMessage());
			result.addObject("code", 500);
			result.addObject("msg", e.getMessage());
		}
		
		
		try {
			// 人员学历柱形图
			List<RyzxtModel> ryList = yqjgzsManger.getRyxl();
			List<String> XllxList = new ArrayList<String>();
			List<String> XlrsList = new ArrayList<String>(); 
			for (int i = 0; i < ryList.size(); i++) {
				XllxList.add("'" + ryList.get(i).getXllx() + "'");
				XlrsList.add("'" + ryList.get(i).getXlrs() + "'");
				 
			}
			request.setAttribute("XllxList", XllxList);
			request.setAttribute("XlrsList", XlrsList);
			 

		} catch (Exception e) {
			logger.warn(e.getMessage());
			result.addObject("code", 500);
			result.addObject("msg", e.getMessage());
		}
		
		try {// 建档饼图
			List<JdtjModel> jdtjList = jdtjManger.getJdxx();
			result.addObject("jdtjList", jdtjList); 
			List<String> jdlxList = new ArrayList<String>();
			for (int i = 0; i < jdtjList.size(); i++) {
				jdlxList.add("'" + jdtjList.get(i).getJdlx() + "'"); 	 
			}
			request.setAttribute("jdlxList", jdlxList);
		} catch (Exception e) {
			logger.warn(e.getMessage());
			result.addObject("code", 500);
			result.addObject("msg", e.getMessage());
		}

		try {// 人员职称柱形图
			List<RyzxtModel> ryList = yqjgzsManger.getRyxx();
			List<String> LxList = new ArrayList<String>();
			List<String> GrsList = new ArrayList<String>();
			List<String> ZrsList = new ArrayList<String>();
			List<String> CrsList = new ArrayList<String>();
			List<String> Lx2List = new ArrayList<String>();
			for (int i = 0; i < ryList.size(); i++) {
				LxList.add("'" + ryList.get(i).getLx() + "'");
				GrsList.add("'" + ryList.get(i).getGrs() + "'");
				ZrsList.add("'" + ryList.get(i).getZrs() + "'");
				CrsList.add("'" + ryList.get(i).getCrs() + "'");
				Lx2List.add("'" + ryList.get(i).getLx2() + "'");
			}
			request.setAttribute("GrsList", GrsList);
			request.setAttribute("LxList", LxList);
			request.setAttribute("Lx2List", Lx2List);
			request.setAttribute("CrsList", CrsList);
			request.setAttribute("ZrsList", ZrsList);

		} catch (Exception e) {
			logger.warn(e.getMessage());
			result.addObject("code", 500);
			result.addObject("msg", e.getMessage());
		}

		// 机构饼形图

		if ("jcyy".equals(ywlx)) {//基层
			try {
				request.setAttribute("mc", "基层");
				// 里层(政府办,社会办)
				List<YqjgzsDaoModel> tbList = yqjgzsManger.getAllTb(startdate, enddate);
				List<String> pidList = new ArrayList<String>();
				result.addObject("tbList", tbList);
				for (int i = 0; i < tbList.size(); i++) {
					pidList.add("'" + tbList.get(i).getPid() + "'");
				}
				request.setAttribute("pidList", pidList);
				
				  

				// 外层(详细)
				List<YqjgzsDaoModel> tbList2 = yqjgzsManger.getAllTb2(startdate, enddate);
				List<String> pidList2 = new ArrayList<String>();
				result.addObject("tbList2", tbList2);
				for (int i = 0; i < tbList2.size(); i++) {
					pidList2.add("'" + tbList2.get(i).getPid() + "'");
				}
				result.addObject("tbList2", tbList2);
				 
				request.setAttribute("pidList2", pidList2);
				
				//首页 :基层医院 xxx家; 占比xxx%
				YqjgzsDaoModel blList = yqjgzsManger.getBlList();
				String xsnr =  blList.getZl();
				String xsnr2 = blList.getBl();
				request.setAttribute("xsnr", xsnr);
				request.setAttribute("xsnr2", xsnr2);
				

			} catch (Exception e) {
				logger.warn(e.getMessage());
				result.addObject("code", 500);
				result.addObject("msg", e.getMessage());
			}
		} else if ("zhyy".equals(ywlx)) {//综合
			try {
				request.setAttribute("mc", "综合");
				// 里层
				List<YqjgzsDaoModel> tbList = yqjgzsManger.getAllTbZhyy(startdate, enddate);
				List<String> pidList = new ArrayList<String>();
				result.addObject("tbList", tbList);
				for (int i = 0; i < tbList.size(); i++) {
					pidList.add("'" + tbList.get(i).getPid() + "'");
				}

				request.setAttribute("pidList", pidList);

				// 外层
				/*List<YqjgzsDaoModel> tbList2 = yqjgzsManger.getAllTbZhyy2(startdate, enddate);
				List<String> pidList2 = new ArrayList<String>();
				result.addObject("tbList2", tbList2);
				for (int i = 0; i < tbList2.size(); i++) {
					pidList2.add("'" + tbList2.get(i).getPid() + "'");
				}
				result.addObject("tbList2", tbList2);
				for (int i = 0; i < tbList2.size(); i++) {
					System.out.println("tbList2==" + tbList2.get(i));
				}
				request.setAttribute("pidList2", pidList2);*/
				//首页 :综合医院 xxx家; 占比xxx%
				YqjgzsDaoModel ZhyyblList = yqjgzsManger.getZhyyBlList();
				String xsnr =   ZhyyblList.getZl()  ;
				String xsnr2 =  ZhyyblList.getBl();
				request.setAttribute("xsnr", xsnr);
				request.setAttribute("xsnr2", xsnr2);
				

			} catch (Exception e) {
				logger.warn(e.getMessage());
				result.addObject("code", 500);
				result.addObject("msg", e.getMessage());
			}
		} else {//基层
			try {
				request.setAttribute("mc", "基层");
				// 里层
				List<YqjgzsDaoModel> tbList = yqjgzsManger.getAllTb(startdate, enddate);
				List<String> pidList = new ArrayList<String>();
				
				 
				
				result.addObject("tbList", tbList);
				for (int i = 0; i < tbList.size(); i++) {
					pidList.add("'" + tbList.get(i).getPid() + "'");
				}

				request.setAttribute("pidList", pidList);

				// 外层
				List<YqjgzsDaoModel> tbList2 = yqjgzsManger.getAllTb2(startdate, enddate);
				List<String> pidList2 = new ArrayList<String>();
				result.addObject("tbList2", tbList2);
				for (int i = 0; i < tbList2.size(); i++) {
					pidList2.add("'" + tbList2.get(i).getPid() + "'");
				}
				result.addObject("tbList2", tbList2);
				 
				request.setAttribute("pidList2", pidList2);
				YqjgzsDaoModel blList = yqjgzsManger.getBlList();
				String xsnr = blList.getZl() ;
				String xsnr2 = blList.getBl();
				request.setAttribute("xsnr", xsnr);
				request.setAttribute("xsnr2", xsnr2);
				

			} catch (Exception e) {
				logger.warn(e.getMessage());
				result.addObject("code", 500);
				result.addObject("msg", e.getMessage());
			}
		}

		result.setViewName("wszygl/xqtj");

		return result;
	}

	// 机构饼形图里层下钻
	@RequestMapping("/xqtj2")
	public ModelAndView xqtj2(HttpServletRequest request, HttpServletResponse response) {
		String pid = request.getParameter("p_pid");
		String startdate = request.getParameter("p_startdate");
		String enddate = request.getParameter("p_enddate");
		
		debugAllRequestParams(request);
		ModelAndView result = new ModelAndView();
		result.setViewName("wszygl/xqtj2");
		try {
			result.addObject("startdate", startdate);
			result.addObject("enddate", enddate);
			result.addObject("pid", pid);
			PageRequest pageRequest = newPageRequest(request);
			PageResult<YqjgzsDaoModel> page = yqjgzsManger.pageSelect(pageRequest);
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

	// 机构饼形图外层下钻
	@RequestMapping("/xqtj3")
	public ModelAndView xqtj3(HttpServletRequest request, HttpServletResponse response) {
		String pid = request.getParameter("p_pid");
		String startdate = request.getParameter("p_startdate");
		String enddate = request.getParameter("p_enddate");
		debugAllRequestParams(request);
		ModelAndView result = new ModelAndView();
		result.setViewName("wszygl/xqtj3");
		try {
			result.addObject("startdate", startdate);
			result.addObject("enddate", enddate);
			result.addObject("pid", pid);
			PageRequest pageRequest = newPageRequest(request);
			PageResult<YqjgzsDaoModel> page = wcxzManger.pageSelect(pageRequest);
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

	 
	@RequestMapping("/logout")
	public void  logout(HttpServletRequest request, HttpServletResponse response) throws Exception{
		
		  
		 //清除设置session
		HttpSession session = request.getSession();
		session.removeAttribute("ssoUsername");
		session.invalidate();		
	response.sendRedirect("http://10.10.100.173:8080/login.jsp");
		
		 
	}

	@Override
	public Class<YqjgzsDaoModel> getEntityClass() {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public BaseMybatisManager<YqjgzsDaoModel, String> getBaseManager() {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public String getViewPath() {
		// TODO Auto-generated method stub
		return null;
	}

}
