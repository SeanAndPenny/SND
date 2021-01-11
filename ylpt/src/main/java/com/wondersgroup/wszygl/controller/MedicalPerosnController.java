package  com.wondersgroup.wszygl.controller;

import java.io.File;
import java.io.FileInputStream;
import java.util.List;

import javax.servlet.ServletOutputStream;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.context.request.RequestContextHolder;
import org.springframework.web.context.request.ServletRequestAttributes;
import org.springframework.web.servlet.ModelAndView;
import com.wondersgroup.api.beans.page.PageRequest;
import com.wondersgroup.api.beans.page.PageResult;
import com.wondersgroup.api.mybatis.manager.BaseMybatisManager;
import com.wondersgroup.commons.model.TbAuthUser;
import com.wondersgroup.frame.spr_mybt_mvc.basic.controller.BaseMybatisController;
import com.wondersgroup.wszygl.manager.MedicalPersonManager;
import com.wondersgroup.wszygl.model.FileUtils;
import com.wondersgroup.wszygl.model.MedicalPersonHtModel;
import com.wondersgroup.wszygl.model.MedicalPersonModel;
import com.wondersgroup.wszygl.model.MedicalPersonTxModel;
import com.wondersgroup.ylfwgl.manager.XdsjManager;
import com.wondersgroup.ylfwgl.model.YljgModel;

@Controller
@RequestMapping("/mdeical")
public class MedicalPerosnController extends  BaseMybatisController<MedicalPersonModel, String>{
	@Autowired
	public MedicalPersonManager medicalPersonManager;
	@Autowired
	public XdsjManager xdsjManager;

	/**
	 * 公众号
	 * @param request
	 * @param response
	 * @return
	 */
	@RequestMapping("/gzh")
	public ModelAndView gzh(HttpServletRequest request,HttpServletResponse response) {
		debugAllRequestParams(request);
		ModelAndView result = new ModelAndView();
		result.setViewName("wszygl/gzh");
		return result;
	}
	@RequestMapping("/jkdaapp")
	public ModelAndView jkdaapp(HttpServletRequest request,HttpServletResponse response) {
		debugAllRequestParams(request);
		ModelAndView result = new ModelAndView();
		result.setViewName("wszygl/app");
		return result;
	}
	
	
	@RequestMapping("/check")
	public ModelAndView login(HttpServletRequest request,HttpServletResponse response) {
		debugAllRequestParams(request);
		ModelAndView result = new ModelAndView();
		result.setViewName("wszygl/query_medicalperson");
		try {
			List<YljgModel> jgList =  xdsjManager.getAllYljg();
			request.setAttribute("jgList", jgList);
			PageRequest pageRequest = newPageRequest(request);
			PageResult<MedicalPersonModel> page = this.getBaseManager().pageSelect(pageRequest);
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

	@RequestMapping("/showHt")
	public ModelAndView showHt(HttpServletRequest request,HttpServletResponse response) {
		debugAllRequestParams(request);
		ModelAndView result = new ModelAndView();
		String id=request.getParameter("s_id");
		MedicalPersonHtModel medicalPersonHtModel=medicalPersonManager.getByPersonid(id);
		if(medicalPersonHtModel==null) {
			result.setViewName("wszygl/show_ht_error");
			result.addObject("errorMsg", "此人未建合同！");
		}else {
			String yljgdm=medicalPersonHtModel.getYljgdm();
			YljgModel xx = xdsjManager.getByYljgdm(yljgdm);
			if(xx!=null) {
				medicalPersonHtModel.setYljgmc(xx.getJgmc());
			}
			result.setViewName("wszygl/show_ht");
			result.addObject("one", medicalPersonHtModel);
			
		}
		return result;
	}
	
	//续签合同
	@RequestMapping("/getXq")
	public ModelAndView getXq(HttpServletRequest request,HttpServletResponse response) {
		String id=request.getParameter("s_id2");
		String yljgmc=request.getParameter("yljgmc");
	    ModelAndView result =new ModelAndView();
	    MedicalPersonHtModel medicalPersonHtModel=medicalPersonManager.getByPersonid(id);
	   // List<MedicalPersonTxModel> medicalPersonTxModel=medicalPersonManager.getTxByPersonid(id);
	    int i=medicalPersonManager.getXq(id,yljgmc);
	    if(medicalPersonHtModel==null)  {
	    	result.setViewName("wszygl/show_ht_error");
			result.addObject("errorMsg", "此人没有合同,无法续签！");
	    }else {
	    	if(i>0) {
	    		//修改续签状态
	    		medicalPersonManager.getXgxqzt(id);
	    		result.setViewName("wszygl/show_ht_error");
				result.addObject("errorMsg", "续签成功"); 
	    	}else {
	    		result.setViewName("wszygl/show_ht_error");
				result.addObject("errorMsg", "续签失败");
}
	    	
	    }
	    return result;
	}
	
	//合同提醒
	@RequestMapping("/showTx")
	public ModelAndView showTx(HttpServletRequest request,HttpServletResponse response) {
		String id=request.getParameter("s_id");
	    ModelAndView result =new ModelAndView();
	    MedicalPersonHtModel medicalPersonHtModel=medicalPersonManager.getByPersonid(id);
	    List<MedicalPersonTxModel> medicalPersonTxModel=medicalPersonManager.getTxByPersonid(id);
	    if(medicalPersonHtModel==null)  {
	    	result.setViewName("wszygl/show_ht_error");
			result.addObject("errorMsg", "此人未建合同！没有提醒信息！");
	    }else {
	    	if(medicalPersonTxModel.size()==0) {
	    		result.setViewName("wszygl/show_ht_error");
				result.addObject("errorMsg", "没有提醒信息！");
	    	}else {
	    		result.setViewName("wszygl/show_tx");
				result.addObject("medicalPersonTxModel", medicalPersonTxModel);
	    	}
	    }
	    return result;
		/*
		debugAllRequestParams(request);
		ModelAndView result = new ModelAndView();
		String id=request.getParameter("s_id");
		MedicalPersonHtModel medicalPersonHtModel=medicalPersonManager.getByPersonid(id);
		if(medicalPersonHtModel==null) {
			result.setViewName("wszygl/show_ht_error");
			result.addObject("errorMsg", "此人未建合同！没有提醒信息！");
		}else {
			MedicalPersonTxModel medicalPersonTxModel=medicalPersonManager.getTxByPersonid(id);
			if(medicalPersonTxModel==null) {
				result.setViewName("wszygl/show_ht_error");
				result.addObject("errorMsg", "没有提醒信息！");
			}else {
				result.setViewName("wszygl/show_tx");
				result.addObject("medicalPersonTxModel", medicalPersonTxModel);
			}
		}
		return result;*/
	}
	
	

	@RequestMapping("/newHt")
	public ModelAndView newHt(HttpServletRequest request,HttpServletResponse response) {
		debugAllRequestParams(request);
		ModelAndView result = new ModelAndView();
		String id=request.getParameter("s_id");
		MedicalPersonModel medicalPersonModel=medicalPersonManager.getById(id);
		MedicalPersonHtModel medicalPersonHtModel=medicalPersonManager.getByPersonid(id);
		if(medicalPersonHtModel!=null) {
			result.setViewName("wszygl/show_ht_error");
			result.addObject("errorMsg", "此人已经有了合同！");
		}else {
			result.setViewName("wszygl/new_ht");
			result.addObject("id", id);
			result.addObject("medicalPersonModel", medicalPersonModel);
			List<YljgModel> jgList =  xdsjManager.getAllYljg();
			request.setAttribute("jgList", jgList);
		}
		
		
		return result;
	}
	@RequestMapping("/saveHt")
	public ModelAndView saveHt(HttpServletRequest request,HttpServletResponse response) {
		debugAllRequestParams(request);
		ModelAndView result = new ModelAndView();
		try {
		String  starttime=request.getParameter("starttime");
		String  endtime=request.getParameter("endtime");
		String  yljgdm=request.getParameter("yljgdm");
		String  id=request.getParameter("id");
		YljgModel xx = xdsjManager.getByYljgdm(yljgdm);
		MedicalPersonHtModel ht=new MedicalPersonHtModel();
		ht.setStarttime(starttime);
		ht.setEndtime(endtime);
		ht.setYljgdm(yljgdm);
		ht.setPersonid(id);
		if(xx!=null) {
			ht.setYljgmc(xx.getJgmc());
		}
		TbAuthUser loginUser = (TbAuthUser) request.getSession().getAttribute("loginUser");
		ht.setCreateid(loginUser.getUserid());
		
			medicalPersonManager.saveHt(ht);
			result.addObject("code", 0);
		}catch (Exception e) {
			logger.warn(e.getMessage());
			result.addObject("code", 500);
			result.addObject("msg", e.getMessage());
		}
		
		return result;
	}
	
	
	
	//查看信息
	
	@RequestMapping("/ckxx")
	public ModelAndView ckxx(HttpServletRequest request,HttpServletResponse response) { 
		String idcard=request.getParameter("idcard");
	    ModelAndView result =new ModelAndView();
	    
	    List<MedicalPersonModel> ckxxSj=medicalPersonManager.getCkxxByidcard(idcard);
	    
	     
	    result.setViewName("wszygl/ckxx");
	    result.addObject("ckxxSj", ckxxSj);
		return result;
	}
	
	 // 模板下载
	@RequestMapping("/toExcel")
	public void exportXls(HttpServletRequest request,HttpServletResponse response) throws Exception{
		String  xm=request.getParameter("xm");
		String  idcardtype=request.getParameter("idcardtype");
		String  yljgdm=request.getParameter("yljgdm");
	// 一个流
	// 两个头
	// 下载文件的mime类型
	response.setContentType("application/vnd.ms-excel"); // 常见的文件 可以省略

	// 文件的打开方式 inline在线打开 attachment
	String agent = request.getHeader("User-Agent");
	String filename = FileUtils.encodeDownloadFilename("人事合同人员信息.xlsx", agent);
	response.setHeader("content-disposition", "attachment;fileName="+filename);
	ServletOutputStream outputStream = response.getOutputStream();

	// 获取模板 在当前项目
	ServletRequestAttributes attributes = (ServletRequestAttributes) RequestContextHolder.currentRequestAttributes();
	String templatePath = System.getProperty("catalina.home")+File.separator+"人事合同人员信息.xlsx";
	
	System.out.println(templatePath);
	FileInputStream fileInputStream = new FileInputStream(templatePath);
	medicalPersonManager.exportdb(fileInputStream, outputStream,xm,idcardtype,yljgdm);
	}
	
	@Override
	public Class<MedicalPersonModel> getEntityClass() {
		return MedicalPersonModel.class;
	}


	@Override
	public BaseMybatisManager<MedicalPersonModel, String> getBaseManager() {
		return medicalPersonManager;
	}


	@Override
	public String getViewPath() {
		return null;
	}
	
}