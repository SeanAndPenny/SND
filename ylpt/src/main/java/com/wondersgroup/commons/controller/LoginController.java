package  com.wondersgroup.commons.controller;

import java.io.IOException;
import java.io.InputStream;
import java.util.ArrayList;
import java.util.List;
import java.util.Properties;
import java.util.UUID;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;
import com.wondersgroup.api.mybatis.manager.BaseMybatisManager;
import com.wondersgroup.commons.manager.PlatformUserManager;
import com.wondersgroup.commons.manager.TbAuthResourceManager;
import com.wondersgroup.commons.manager.TbAuthUserManager;
import com.wondersgroup.commons.model.PlatformSys;
import com.wondersgroup.commons.model.PlatformUser;
import com.wondersgroup.commons.model.PtLog;
import com.wondersgroup.commons.model.TbAuthResource;
import com.wondersgroup.commons.model.TbAuthResourceTree;
import com.wondersgroup.commons.model.TbAuthUser;
import com.wondersgroup.commons.utils.HttpUtils;
import com.wondersgroup.commons.utils.MD5Util;
import com.wondersgroup.frame.spr_mybt_mvc.basic.controller.BaseMybatisLayuiController;

@Controller
@RequestMapping("/login")
public class LoginController extends BaseMybatisLayuiController<TbAuthUser, String> {
	private static Properties pro = new Properties(); 
	private static Properties proname = new Properties(); 
	private static String pkeyword;
	static {
		InputStream in = null;
		InputStream hh = null;
		try {
			in = LoginController.class.getClassLoader().getResourceAsStream("//keyword.properties");
			pro.load(in);
			pkeyword = pro.getProperty("keyword");
			hh = LoginController.class.getClassLoader().getResourceAsStream("//ptname.properties");
			proname.load(hh);
		} catch (IOException e) {
			e.printStackTrace();
		} finally {
			if (in!=null) {
				try {
					in.close();
				} catch (IOException e) {
					e.printStackTrace();
				}
			}
			if (hh!=null) {
				try {
					hh.close();
				} catch (IOException e) {
					e.printStackTrace();
				}
			}
		}
	}

	
	
	@Autowired
	public TbAuthUserManager tbAuthUserManager;
	@Autowired
	public TbAuthResourceManager tbAuthResourceManager;
	@Autowired
	public  PlatformUserManager platformUserManager;
	@RequestMapping("/index")
	public String  index(){
		return "commons/login";
	}
	@RequestMapping("/main")
	public ModelAndView  main(HttpServletRequest request,HttpServletResponse response){
		String ptname=request.getParameter("ptname");
		ModelAndView modelAndView=new ModelAndView();
		modelAndView.setViewName("commons/main");
		modelAndView.addObject("ptname", ptname);
		return modelAndView;
	}
	
	@RequestMapping("/check")
	public ModelAndView login(HttpServletRequest request,HttpServletResponse response) {
		ModelAndView modelAndView=new ModelAndView();
		String loginname=request.getParameter("loginname");
		String passWord=request.getParameter("password");
		String keyword=request.getParameter("keyword");
		if (loginname != null && !"".equals(loginname)){
			//加密
			
			TbAuthUser tbAuthUser=new TbAuthUser();
			if(passWord != null && !"".equals(passWord)) {
				passWord = MD5Util.getInstance().calcMD5(passWord);
				
				if(keyword != null && !"".equals(keyword)) {//传了keyword	
					request.getSession().setAttribute("keyword", keyword);
				}else {
					if(request.getSession().getAttribute("keyword") != null&& !"".equals(request.getSession().getAttribute("keyword"))) {
						keyword=(String) request.getSession().getAttribute("keyword");
					}else {
						keyword=pkeyword;
					}
					request.getSession().setAttribute("keyword", keyword);
				}
				tbAuthUser.setLoginname(loginname);
				TbAuthUser user=tbAuthUserManager.getByEntity(tbAuthUser);
				if(user!=null) {
					if(!passWord.equals(user.getPsw())) {//密码不正确
						modelAndView.addObject("errorMsg","账号密码错误");	
						modelAndView.setViewName("commons/login");
					}else {
						request.getSession().setAttribute("loginUser",user);
						
						//用户名密码正确，获取该用户菜单
						List<TbAuthResourceTree> authList = getAuthList(loginname,keyword);
						modelAndView.setViewName("commons/index");
						String ptname=proname.getProperty(keyword);
						modelAndView.addObject("authList", authList);
						modelAndView.addObject("ptname", ptname);
					}
				}else {
			
					modelAndView.addObject("errorMsg","账户不存在");
					modelAndView.setViewName("commons/login");
				}
				
			}else {
				TbAuthUser loginUser = (TbAuthUser) request.getSession().getAttribute("loginUser");
				if(loginUser!=null) {
					List<TbAuthResourceTree> authList = getAuthList(loginUser.getLoginname(),(String)request.getSession().getAttribute("keyword"));
					modelAndView.setViewName("commons/index");
					modelAndView.addObject("authList", authList);
				}else {
					modelAndView.addObject("errorMsg","密码为空");	
					modelAndView.setViewName("commons/login");
				}
			}
					
		}else {
			TbAuthUser loginUser = (TbAuthUser) request.getSession().getAttribute("loginUser");
			if(loginUser!=null) {
				List<TbAuthResourceTree> authList = getAuthList(loginUser.getLoginname(),(String)request.getSession().getAttribute("keyword"));
				modelAndView.setViewName("commons/index");
				String ptname=proname.getProperty(keyword);
				modelAndView.addObject("authList", authList);
				modelAndView.addObject("ptname", ptname);
			}else {
				modelAndView.addObject("errorMsg","账号为空");	
				modelAndView.setViewName("commons/login");
			}
		}
		
		return modelAndView;
	}
	
	@RequestMapping("/ssoLogin")
	public ModelAndView ssoLogin(HttpServletRequest request,HttpServletResponse response) {
		ModelAndView modelAndView=new ModelAndView();
		
		System.out.println("********begin********** ");
		// 判断是否已经在sso验证通过
		if ((request.getRemoteUser() != null)
				&& (!request.getRemoteUser().equals(""))) {
			System.out.println("loginname===="+request.getRemoteUser());
			String loginname = request.getRemoteUser();
			//用户名密码正确，获取该用户菜单
			String keyword=request.getParameter("keyword");
			if(keyword != null && !"".equals(keyword)) {//传了keyword	
				request.getSession().setAttribute("keyword", keyword);
			}else {
				if(request.getSession().getAttribute("keyword") != null&& !"".equals(request.getSession().getAttribute("keyword"))) {
					keyword=(String) request.getSession().getAttribute("keyword");
				}else {
					keyword=pkeyword;
				}
				request.getSession().setAttribute("keyword", keyword);
			}
			TbAuthUser tbAuthUser=new TbAuthUser();
			tbAuthUser.setLoginname(loginname);
			TbAuthUser user=tbAuthUserManager.getByEntity(tbAuthUser);
			List<TbAuthResourceTree> authList = getAuthList(loginname,keyword);
			request.getSession().setAttribute("loginUser",user);
			modelAndView.setViewName("commons/index");
			String ptname=proname.getProperty(keyword);
			modelAndView.addObject("authList", authList);
			modelAndView.addObject("ptname", ptname);
		} else {//账户不存在
			modelAndView.addObject("errorMsg","账户不存在");
			modelAndView.setViewName("commons/login");
		}
		return modelAndView;
	}
	
	@RequestMapping("/otherPt")
	public ModelAndView otherPt(HttpServletRequest request,HttpServletResponse response) {
		ModelAndView modelAndView=new ModelAndView();
		modelAndView.setViewName("commons/otherPt");
		String userid=request.getParameter("userid");
		String otherplatkey=request.getParameter("otherplatkey");
		modelAndView.addObject("userid", userid);
		modelAndView.addObject("otherplatkey", otherplatkey);
		if(userid != null && !"".equals(userid)&&otherplatkey != null && !"".equals(otherplatkey)) {
			modelAndView.addObject("code", 0);
		}else {
			modelAndView.addObject("code", 500);
			modelAndView.addObject("msg", "用户id或者key错误");
		}
		return modelAndView;
	}
	
	
	@RequestMapping("/otherLogin")
	public ModelAndView otherLogin(HttpServletRequest request,HttpServletResponse response) {
		ModelAndView modelAndView=new ModelAndView();
		if ((request.getRemoteUser() != null)&& (!request.getRemoteUser().equals(""))) {	
		String username = request.getRemoteUser();
		TbAuthUser tbAuthUser=new TbAuthUser();
		tbAuthUser.setLoginname(username);
		TbAuthUser loginUser=tbAuthUserManager.getByEntity(tbAuthUser);
		String userid=loginUser.getUserid();
		String otherplatkey=request.getParameter("otherplatkey");
		if(userid != null && !"".equals(userid)&&otherplatkey != null && !"".equals(otherplatkey)) {
			PlatformUser platformUser=platformUserManager.getByUseridAndKeyWord(userid, otherplatkey);
			if(platformUser!=null) {
				PlatformSys platformSys = platformUserManager.getSysByKeyWord(otherplatkey);
				PtLog ptLog=new PtLog();
				TbAuthUser user = tbAuthUserManager.getById(userid);
				ptLog.setLogid(UUID.randomUUID().toString());
				ptLog.setOperationname(platformSys.getPlatfromname()+"平台登录");
				ptLog.setOperator(user.getUsername()+"("+user.getLoginname()+")");
				ptLog.setActionclassname(this.toString());
				ptLog.setActionmethodname("login");
				ptLog.setIp(HttpUtils.getIpAddress(request));
				ptLog.setProjectname(platformSys.getPlatfromname());
				ptLog.setSsproject("PT_LOGIN");
				platformUserManager.insertPtlog(ptLog);
//				modelAndView.setViewName("commons/redirect");
				modelAndView.addObject("url", platformSys.getUrl());
				modelAndView.addObject("loginname", platformSys.getLoginname());
				modelAndView.addObject("otherlogname", platformUser.getOtherlogname());
				modelAndView.addObject("password", platformSys.getPassword());
				modelAndView.addObject("otherlogpsw", platformUser.getOtherlogpsw());
				modelAndView.setViewName("redirect:"+platformSys.getUrl()+"?"+platformSys.getLoginname()+"="+platformUser.getOtherlogname()+"&"+platformSys.getPassword()+"="+platformUser.getOtherlogpsw());
			}else {
				modelAndView.addObject("userid", userid);
				modelAndView.addObject("otherplatkey", otherplatkey);
				modelAndView.setViewName("commons/other_login");
			}
		}else {
			modelAndView.setViewName("commons/other_login_error");
			modelAndView.addObject("code", 500);
			modelAndView.addObject("msg", "用户id或者key错误");
		}
		}else {
			modelAndView.setViewName("commons/other_login_error");
			modelAndView.addObject("code", 500);
			modelAndView.addObject("msg", "没有登录");
		}
		return modelAndView;
	}
	
	@RequestMapping("/zj")
	public ModelAndView zj(HttpServletRequest request,HttpServletResponse response) {
		ModelAndView modelAndView=new ModelAndView();
		String otherplatkey=request.getParameter("otherplatkey");
		String userid=request.getParameter("userid");
		modelAndView.addObject("userid", userid);
		modelAndView.addObject("otherplatkey", otherplatkey);
		modelAndView.setViewName("commons/other_login_add");
		return modelAndView;
	}
	
	
	@RequestMapping("/savePlatLogin")
	public ModelAndView savePlatLogin(HttpServletRequest request,HttpServletResponse response) {
		ModelAndView modelAndView=new ModelAndView();
		String userid=request.getParameter("userid");
		String otherplatkey=request.getParameter("otherplatkey");
		if(userid != null && !"".equals(userid)&&otherplatkey != null && !"".equals(otherplatkey)) {
			PlatformUser platformUser=new PlatformUser();
			platformUser.setUserid(userid);
			platformUser.setOtherlogxm(request.getParameter("otherlogxm"));
			platformUser.setOtherlogname(request.getParameter("otherlogname"));
			platformUser.setOtherlogpsw( request.getParameter("otherlogpsw"));
			platformUser.setOtherplatkey(otherplatkey);
			platformUser.setOtherplatname(request.getParameter("otherplatname"));
			platformUser.setOtherlogxm(request.getParameter("otherlogxm"));
			platformUserManager.insertUser(platformUser);
			PlatformSys platformSys=new PlatformSys();
			platformSys.setLoginname(request.getParameter("loginname"));
			platformSys.setPassword(request.getParameter("password"));
			platformSys.setUrl(request.getParameter("url"));
			platformSys.setPlatfromname(request.getParameter("otherplatname"));
			platformSys.setPlatfromkey(otherplatkey);
			platformUserManager.insertSys(platformSys);
			modelAndView.addObject("code", 0);
		}else {
			modelAndView.addObject("code", 500);
			modelAndView.addObject("msg", "用户id或者key为空");
		}
		return modelAndView;
	}
	
	/**
	 * 
	 * @param loginname
	 * @return
	 */
	private List<TbAuthResourceTree> getAuthList(String loginname,String keyword) {
		List<TbAuthResource> userResoucreList = tbAuthResourceManager.getResourceByUser(loginname);
		List<TbAuthResource> unitResoucreList = tbAuthResourceManager.getResourceByUnit(loginname);
		List<TbAuthResource> roleResoucreList = tbAuthResourceManager.getResourceByRole(loginname);
		List<TbAuthResource> orgResoucreList = tbAuthResourceManager.getResourceByOrg(loginname);
		List<TbAuthResource> listAll = new ArrayList<TbAuthResource>();
		listAll.addAll(userResoucreList);
		listAll.addAll(unitResoucreList);
		listAll.addAll(roleResoucreList);
		listAll.addAll(orgResoucreList);
		//去重
		List<TbAuthResource> list = removeDuplicate(listAll);
		//根据keyword  查询 所有的权限
		List<TbAuthResource> keywordResoucreList = tbAuthResourceManager.getResourceByKeyword(keyword);
		//以上两个list求交集，即为登陆账号，在该系统拥有的权限菜单
		List<TbAuthResource> authlist = new ArrayList<TbAuthResource>();
		for (int i = 0; i < list.size(); i++){
			TbAuthResource os1 = (TbAuthResource) list.get(i);
			for (int j = 0; j < keywordResoucreList.size(); j++){
				TbAuthResource os2 = (TbAuthResource) keywordResoucreList.get(j);
				if(os1.getResid().equals(os2.getResid())){
					authlist.add(os2);
				}
			}
		}
		
		List<TbAuthResourceTree> xx=new ArrayList<TbAuthResourceTree>();
		
		for(int i=0;i<authlist.size();i++) {
			 if(3==authlist.get(i).getRes_level()) {
				TbAuthResourceTree father=new  TbAuthResourceTree();
				father.setComments(authlist.get(i).getComments());
				father.setKeyword(authlist.get(i).getKeyword());
				father.setPresid(authlist.get(i).getPresid());
				father.setResid(authlist.get(i).getResid());
				father.setUrl(authlist.get(i).getUrl());
				father.setResname(authlist.get(i).getResname());
				xx.add(father);
			}
		}
		for(int i=0;i<xx.size();i++) {
			List<TbAuthResource> childs=new ArrayList<TbAuthResource>();
			for(int j=0;j<authlist.size();j++) {
				if(xx.get(i).getResid().equals(authlist.get(j).getPresid())) {
					childs.add(authlist.get(j));
				}
			}
			xx.get(i).setChilds(childs);
		}
		
		
		return xx;
	}
	

	private List<TbAuthResource> removeDuplicate(List<TbAuthResource> listAll) {
		for ( int i = 0; i < listAll.size()- 1 ; i ++ ){
			for ( int j = listAll.size()- 1 ; j > i; j -- ){    
				TbAuthResource os1 = (TbAuthResource) listAll.get(i);
				TbAuthResource os2 = (TbAuthResource) listAll.get(j);
				if  (os1.getResid().equals(os2.getResid())){
					listAll.remove(j);
				}
			}
		}
		return listAll;  
	}



		@Override
		public Class<TbAuthUser> getEntityClass() {
			// TODO Auto-generated method stub
			return null;
		}


		@Override
		protected String getPk(TbAuthUser entity) {
			// TODO Auto-generated method stub
			return null;
		}


		@Override
		public BaseMybatisManager<TbAuthUser, String> getBaseManager() {
			// TODO Auto-generated method stub
			return null;
		}
		
		
		@Override
		public String getViewPath() {
			// TODO Auto-generated method stub
			return null;
		}
}