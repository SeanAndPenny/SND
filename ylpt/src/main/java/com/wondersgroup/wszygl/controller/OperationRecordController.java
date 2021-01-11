package  com.wondersgroup.wszygl.controller;

import java.util.ArrayList;
import java.util.List;
import java.util.UUID;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.commons.lang3.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.wondersgroup.api.beans.page.PageRequest;
import com.wondersgroup.api.beans.page.PageResult;
import com.wondersgroup.api.mybatis.manager.BaseMybatisManager;
import com.wondersgroup.commons.model.TbAuthUser;
import com.wondersgroup.frame.spr_mybt_mvc.basic.controller.BaseMybatisController;
import com.wondersgroup.wszygl.manager.OpeHospitalManager;
import com.wondersgroup.wszygl.manager.OperationRecordManager;
import com.wondersgroup.wszygl.manager.ShHospitalManager;
import com.wondersgroup.wszygl.model.OpeCatlogModel;
import com.wondersgroup.wszygl.model.OpeHospitalModel;
import com.wondersgroup.wszygl.model.OperationRecordModel;
import com.wondersgroup.wszygl.model.SsbmyljgModel;
import com.wondersgroup.wszygl.model.YyjsModel;
import com.wondersgroup.ylfwgl.manager.XdsjManager;
import com.wondersgroup.wszygl.manager.YyssbmManager;
import com.wondersgroup.wszygl.manager.YyjsManager;
import com.wondersgroup.ylfwgl.model.YljgModel;

@Controller
@RequestMapping("/operation")
public class OperationRecordController extends  BaseMybatisController<OperationRecordModel, String>{
	@Autowired
	public OperationRecordManager operationRecordManager;
	
	@Autowired
	public YyssbmManager YyssbmManager;
	
	@Autowired
	public YyjsManager YyjsManager;
	
	@Autowired
	public OpeHospitalManager opeHospitalManager;
	@Autowired
	public XdsjManager xdsjManager;
	@Autowired
	public ShHospitalManager shHospitalManager;
	
	@RequestMapping("/tree")
	public ModelAndView tree(HttpServletRequest request,HttpServletResponse response) {
		
		debugAllRequestParams(request);
		ModelAndView result = new ModelAndView();
		try {
			List<OpeCatlogModel> alls=operationRecordManager.getAllCatlog();
//			List<OperationRecordModel> alls=operationRecordManager.getAll();
			// 最后的结果
		    List<OpeCatlogModel> menuList = new ArrayList<OpeCatlogModel>();
		    // 先找到所有的一级菜单
		    for (int i = 0; i < alls.size(); i++) {
		        // 一级菜单没有parentId
		        if ("1".equals(alls.get(i).getCatalogup())) {
		        	menuList.add(alls.get(i));
		        }
		        
		    }
			
		    // 为一级菜单设置子菜单，getChild是递归调用的
		    for (OpeCatlogModel menu : menuList) {
		        menu.setChildren(getChild(menu.getId(), alls));
		    }
		    OpeCatlogModel menu1 = new OpeCatlogModel();
		    menu1.setCataloglevel("3");
		    menu1.setCatalogup("3");
		    menu1.setId("11111111111111111111111111111111");
		    menu1.setName("江苏省手术分级目录");
		    menu1.setChildren(menuList);
		    List<OpeCatlogModel> menuList1 = new ArrayList<OpeCatlogModel>();
		    menuList1.add(menu1);
//			List<AreaModel> treeList=treeUtils.toAreaTreeList(alls);

			result.addObject("treeList", menuList1);
		} catch (Exception e) {
			logger.warn(e.getMessage());
			result.addObject("code", 500);
			result.addObject("msg", e.getMessage());
		}
		return result;
		
	}
	
	@RequestMapping("/tree2")
	public ModelAndView tree2(HttpServletRequest request,HttpServletResponse response) {
		debugAllRequestParams(request);
		ModelAndView result = new ModelAndView();
		try {
			TbAuthUser user = (TbAuthUser) request.getSession().getAttribute("loginUser");
			String yljgdm = null;
			if(Integer.parseInt(user.getOrgid())<12) {
				yljgdm = operationRecordManager.getOrgCodeByOrgid(user.getOrgid()).getOrgcode();				
			}
			List<OpeCatlogModel> SsbmYljgList = new ArrayList<OpeCatlogModel>();
			OpeCatlogModel ssbmyljg = new OpeCatlogModel();
			ssbmyljg.setCataloglevel("3");
			ssbmyljg.setCatalogup("3");
			ssbmyljg.setId("JSXMB");
			ssbmyljg.setName("相城区技术项目表");
			ssbmyljg.setChildren(null);
			SsbmYljgList.add(ssbmyljg);
			result.addObject("treeList", SsbmYljgList);
		} catch (Exception e) {
			logger.warn(e.getMessage());
			result.addObject("code", 500);
			result.addObject("msg", e.getMessage());
		}
		return result;
		
	}
	

	/**
	 * 递归查找子菜单
	 * 
	 * @param id
	 *            当前菜单id
	 * @param rootMenu
	 *            要查找的列表
	 * @return
	 */
	private List<OpeCatlogModel> getChild(String id, List<OpeCatlogModel> rootMenu) {
	    // 子菜单
	    List<OpeCatlogModel> childList = new ArrayList<>();
	    for (OpeCatlogModel menu : rootMenu) {
	        // 遍历所有节点，将父菜单id与传过来的id比较
	        if (StringUtils.isNotBlank(menu.getCatalogup())) {
	            if (menu.getCatalogup().equals(id)) {
	                childList.add(menu);
	            }
	        }
	    }
	    // 把子菜单的子菜单再循环一遍
	    for (OpeCatlogModel menu : childList) {// 没有url子菜单还有子菜单
	        if (StringUtils.isBlank(menu.getName())) {
	            // 递归
	            menu.setChildren(getChild(menu.getId(), rootMenu));
	        }
	    } // 递归退出条件
	    if (childList.size() == 0) {
	        return null;
	    }
	    return childList;
	}

	
	@RequestMapping("/showHospital")
	public ModelAndView showHospital(HttpServletRequest request,HttpServletResponse response) {
		debugAllRequestParams(request);
		ModelAndView result = new ModelAndView();
		TbAuthUser user = (TbAuthUser) request.getSession().getAttribute("loginUser");
		String yljgdm = null;
		if(user.getOrgid()!=null) {
			yljgdm = operationRecordManager.getOrgCodeByOrgid(user.getOrgid()).getOrgcode();
		}else {
			yljgdm="";
		}
		
		String gradeid=request.getParameter("p_gradeid");
		result.addObject("gradeid", gradeid);
		result.setViewName("wszygl/show_ope_hospital");
		try {
			PageRequest pageRequest = newPageRequest(request);
			PageResult<OpeHospitalModel> page = opeHospitalManager.pageSelect(pageRequest);
			if("320507-1".equals(yljgdm)) {
				result.addObject("auth","1");
			}else {
				result.addObject("auth","2");
			}
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
	
	
	@RequestMapping("/shHospital")
	public ModelAndView shHospital(HttpServletRequest request,HttpServletResponse response) {
		debugAllRequestParams(request);
		ModelAndView result = new ModelAndView();
		result.setViewName("wszygl/show_sh_hospital");
		try {
			List<YljgModel> jgList =  xdsjManager.getAllYljg();
			PageRequest pageRequest = newPageRequest(request);
			PageResult<OpeHospitalModel> page = shHospitalManager.pageSelect(pageRequest);
			result.addObject("jgList", jgList);
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
	
	/**
	 * 医院要申请手术操作
	 * @param request
	 * @param response
	 * @return
	 */
	@RequestMapping("/shOpe")
	public ModelAndView shOpe(HttpServletRequest request,HttpServletResponse response) {
		debugAllRequestParams(request);
		ModelAndView result = new ModelAndView();
		List<YljgModel> jgList =  xdsjManager.getAllYljg();
		TbAuthUser user = (TbAuthUser) request.getSession().getAttribute("loginUser");
		String yljgdm = null;
		if(user.getOrgid()!=null) {
			yljgdm = operationRecordManager.getOrgCodeByOrgid(user.getOrgid()).getOrgcode();
		}else {
			yljgdm="";
		}
		String name = user.getUsername();
		String yljgmc = xdsjManager.getByYljgdm(yljgdm).getJgmc();
		request.setAttribute("jgList", jgList);
		result.addObject("yljgdm", yljgdm);
		result.addObject("yljgmc", yljgmc);
		result.addObject("name", name);
		String gradeid=request.getParameter("p_gradeid");
		OperationRecordModel model=operationRecordManager.getOpeByGradeid(gradeid);
		result.addObject("model", model);
		result.addObject("gradeid", gradeid);
		result.setViewName("wszygl/sh_ope");
		return result;
	}
	
	@RequestMapping("/check")
	public ModelAndView login(HttpServletRequest request,HttpServletResponse response) {
		debugAllRequestParams(request);
		ModelAndView result = new ModelAndView();
		result.setViewName("wszygl/query_operation");
		TbAuthUser user = (TbAuthUser) request.getSession().getAttribute("loginUser");
		String yljgdm = null;
		if(user.getOrgid()!=null) {
			yljgdm = operationRecordManager.getOrgCodeByOrgid(user.getOrgid()).getOrgcode();
		}else {
			yljgdm="";
		}
		if("320507-1".equals(yljgdm)) {
			result.addObject("auth","1");
		}else {
			result.addObject("auth","2");
		}
		try {
			String a = request.getParameter("type");
			if("1".equals(a)) {
				PageRequest pageRequest = newPageRequest(request);
				PageResult<OperationRecordModel> page = this.getBaseManager().pageSelect(pageRequest);
				result.addObject("code", 0);
				result.addObject("msg", "success");
				result.addObject("count", page.getTotalCount());
				result.addObject("data", page.getResult());
			}else if("2".equals(a)) {
				PageRequest pageRequest = newPageRequest(request);
				PageResult<SsbmyljgModel> page = YyssbmManager.pageSelect(pageRequest);
				result.addObject("code", 0);
				result.addObject("msg", "success");
				result.addObject("count", page.getTotalCount());
				result.addObject("data", page.getResult());
			}else if("3".equals(a)) {
				PageRequest pageRequest = newPageRequest(request);
				PageResult<YyjsModel> page = YyjsManager.pageSelect(pageRequest);
				result.addObject("code", 0);
				result.addObject("msg", "success");
				result.addObject("count", page.getTotalCount());
				result.addObject("data", page.getResult());
			}
		} catch (Exception e) {
			logger.warn(e.getMessage());
			result.addObject("code", 500);
			result.addObject("msg", e.getMessage());
		}
		return result;
		
	}
	@RequestMapping("/showxc")
	public ModelAndView showxc(HttpServletRequest request,HttpServletResponse response) {
		debugAllRequestParams(request);
		ModelAndView result = new ModelAndView();
		result.setViewName("wszygl/query_xcss");
		try {
				PageRequest pageRequest = newPageRequest(request);
				PageResult<SsbmyljgModel> page = YyssbmManager.pageSelect(pageRequest);
				TbAuthUser user = (TbAuthUser) request.getSession().getAttribute("loginUser");
				String yljgdm = null;
				if(user.getOrgid()!=null) {
					yljgdm = operationRecordManager.getOrgCodeByOrgid(user.getOrgid()).getOrgcode();
				}else {
					yljgdm="";
				}
				List<YljgModel> jgList = YyssbmManager.getAllYljg(yljgdm);
				request.setAttribute("jgList", jgList);
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
	
	@RequestMapping("/showjs")
	public ModelAndView showjs(HttpServletRequest request,HttpServletResponse response) {
		debugAllRequestParams(request);
		ModelAndView result = new ModelAndView();
		result.setViewName("wszygl/query_xcjs");
		try {
				PageRequest pageRequest = newPageRequest(request);
				PageResult<YyjsModel> page = YyjsManager.pageSelect(pageRequest);
				TbAuthUser user = (TbAuthUser) request.getSession().getAttribute("loginUser");
				String yljgdm = null;
				if(user.getOrgid()!=null) {
					yljgdm = operationRecordManager.getOrgCodeByOrgid(user.getOrgid()).getOrgcode();
				}else {
					yljgdm="";
				}
				List<YljgModel> jgList = YyssbmManager.getAllYljg(yljgdm);
				request.setAttribute("jgList", jgList);
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
	
	@RequestMapping("/saveRequest")
	public ModelAndView saveAreaOne(HttpServletRequest request,HttpServletResponse response) {
		debugAllRequestParams(request);
		ModelAndView result = new ModelAndView();
		try {
			String detailid = request.getParameter("detailid");
			String yljgdm = request.getParameter("yljgdm");
			String reason = request.getParameter("reason");
			String sqr = request.getParameter("sqr");
			String yljgmc = request.getParameter("yljgmc");
			OperationRecordModel entity=new OperationRecordModel();
			String uuid = UUID.randomUUID().toString();
			String uuid1 = UUID.randomUUID().toString();
			entity.setId(uuid);
			entity.setDetailid(detailid);
			entity.setRequestid(uuid1);
			entity.setYljgdm(yljgdm);
			entity.setRemark(reason);
			entity.setSqr(sqr);
			if(yljgdm==null || "".equals(yljgdm)) {
				result.addObject("code", 500);
				result.addObject("msg", "机构名称不可为空");
			}
			operationRecordManager.save(entity);
			result.addObject("code", 0);
			result.addObject("msg", "success");
		}catch(Exception e) {
			logger.warn(e.getMessage());
			result.addObject("code", 500);
			result.addObject("msg", e.getMessage());
		}
		return result;
		
	}
	@RequestMapping("/updateRequest")
	public ModelAndView updateRequest(HttpServletRequest request,HttpServletResponse response) {
		debugAllRequestParams(request);
		ModelAndView result = new ModelAndView();
		try {
			String id = request.getParameter("id");
			opeHospitalManager.updateOpe(id);
			result.addObject("code", 0);
			result.addObject("msg", "success");
		}catch(Exception e) {
			logger.warn(e.getMessage());
			result.addObject("code", 500);
			result.addObject("msg", e.getMessage());
		}
		return result;
		
	}
	@RequestMapping("/updateRequest1")
	public ModelAndView updateRequest1(HttpServletRequest request,HttpServletResponse response) {
		debugAllRequestParams(request);
		ModelAndView result = new ModelAndView();
		try {
			String id = request.getParameter("id");
			opeHospitalManager.updateOpe1(id);
			result.addObject("code", 0);
			result.addObject("msg", "success");
		}catch(Exception e) {
			logger.warn(e.getMessage());
			result.addObject("code", 500);
			result.addObject("msg", e.getMessage());
		}
		return result;
		
	}
	@Override
	public Class<OperationRecordModel> getEntityClass() {
		return OperationRecordModel.class;
	}


	@Override
	public BaseMybatisManager<OperationRecordModel, String> getBaseManager() {
		return operationRecordManager;
	}


	@Override
	public String getViewPath() {
		return null;
	}
	
}