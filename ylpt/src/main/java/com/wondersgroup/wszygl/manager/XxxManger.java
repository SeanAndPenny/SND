package com.wondersgroup.wszygl.manager;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import com.wondersgroup.api.mybatis.dao.BaseMybatisDao;
import com.wondersgroup.api.mybatis.manager.BaseMybatisManager;
import com.wondersgroup.wszygl.dao.XxxDao;
import com.wondersgroup.wszygl.model.McpzModel;
import com.wondersgroup.wszygl.model.YljgMcModel;
import com.wondersgroup.wszygl.model.ZhjgUserModel;
import com.wondersgroup.wszygl.model.wdtjModel;
import com.wondersgroup.wszygl.model.xxxModel;
@Component
public class XxxManger extends BaseMybatisManager<xxxModel,String>{
	@Autowired
	private  XxxDao xxxdao;
	public xxxModel getXxx(String ywbz,String yxbz){
		return xxxdao.getXxx(ywbz,yxbz);
	}
	public List<ZhjgUserModel> getQx(String loginUser){
		return xxxdao.getQx(loginUser);
	}
	public ZhjgUserModel fakeAuthUserInfo(String loginname1,String pwd1) {
		return xxxdao.fakeAuthUserInfo(loginname1,pwd1);
	}
	public xxxModel getKkk(String ywbz,String wdtj){
		return xxxdao.getKkk(ywbz,wdtj);
	}
	public List<xxxModel>  getXxxlist(String kssj,String jssj,String jgdm,String sqlnr1,
			String sqlnr2,String sqlnr3,
			String pdtj1,
			String pdtj2,
			String pdtj3,
			String tjsjwd,
			String wdtj) {
		
		return xxxdao.getXxxlist(kssj, jssj, 
				                 jgdm, sqlnr1,
				                 sqlnr2,sqlnr3, 
				                 pdtj1,pdtj2, 
				                 pdtj3,tjsjwd,
				                 wdtj);
		
	}
	public String getzlSum(String kssj,String jssj,String jgdm,String sqlnr1,
			String sqlnr2,String sqlnr3,
			String pdtj1,
			String pdtj2,
			String pdtj3,
			String tjsjwd,
			String wdtj) {
		
		return xxxdao.getzlSum(kssj, jssj, 
				                 jgdm, sqlnr1,
				                 sqlnr2,sqlnr3, 
				                 pdtj1,pdtj2, 
				                 pdtj3,tjsjwd,
				                 wdtj);
		
	}
	
	
	public List<xxxModel>  getKkklist(String kssj,String jssj,String jgdm,String sqlnr1,
			String sqlnr2,String sqlnr3,
			String pdtj1,
			String pdtj2,
			String pdtj3,
			String tjsjwd,
			String wdtj) {
		
		return xxxdao.getKkklist(kssj, jssj, 
				                 jgdm, sqlnr1,
				                 sqlnr2,sqlnr3, 
				                 pdtj1,pdtj2, 
				                 pdtj3,tjsjwd,
				                 wdtj);
		
	}
	public String getzlSum2(String kssj,String jssj,String jgdm,String sqlnr1,//维度总量分析 
			String sqlnr2,String sqlnr3,
			String pdtj1,
			String pdtj2,
			String pdtj3,
			String tjsjwd,
			String wdtj) {
		
		return xxxdao.getzlSum2(kssj, jssj, 
				                 jgdm, sqlnr1,
				                 sqlnr2,sqlnr3, 
				                 pdtj1,pdtj2, 
				                 pdtj3,tjsjwd,
				                 wdtj);
		
	}
	
	
	public List<McpzModel> getmcpzList(String ywbz,String wdtj){
		return xxxdao.getmcpzList(ywbz,wdtj);
	}
	public List<McpzModel> getmcp(String ywbz,String wdtj){
		return xxxdao.getmcp(ywbz,wdtj);
	}
	public List<YljgMcModel> getAllYljg(String yljgdm){
		return xxxdao.getAllYljg(yljgdm);
	}
	public List<YljgMcModel> getCzrkYljg(String yljgdm){
		return xxxdao.getCzrkYljg(yljgdm);
		
	}
	public List<YljgMcModel> getLdrkYljg(String yljgdm){
		return xxxdao.getLdrkYljg(yljgdm);
		
	}
	
	public List<wdtjModel> getAllWdtj(String ywbz){
		return xxxdao.getAllWdtj(ywbz);
	}
	@Override
	public BaseMybatisDao<xxxModel, String> getBaseDao() {
		// TODO Auto-generated method stub
		return xxxdao;
	}

}
