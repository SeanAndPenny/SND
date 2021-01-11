package com.wondersgroup.wszygl.manager;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import com.wondersgroup.api.mybatis.dao.BaseMybatisDao;
import com.wondersgroup.api.mybatis.manager.BaseMybatisManager;
import com.wondersgroup.wszygl.dao.XxxDao;
import com.wondersgroup.wszygl.dao.XxxQsfxDao;
import com.wondersgroup.wszygl.model.McpzModel;
import com.wondersgroup.wszygl.model.wdtjModel;
import com.wondersgroup.wszygl.model.xxxModel;
@Component
public class XxxQsfxManger extends BaseMybatisManager<xxxModel,String>{
	@Autowired
	private  XxxQsfxDao xxxqsfxdao;
	
	public xxxModel getXxx(String ywbz,String yxbz){
		return xxxqsfxdao.getXxx(ywbz,yxbz);
	}
	public xxxModel getYyy(String ywbz,String wdtj){
		return xxxqsfxdao.getYyy(ywbz,wdtj);
	}
	
	public List<McpzModel> getmcpzList(String ywbz,String wdtj){
		return xxxqsfxdao.getmcpzList(ywbz,wdtj);
	}
	public List<McpzModel> getmcp(String ywbz,String wdtj){
		return xxxqsfxdao.getmcp(ywbz,wdtj);
	}
	public List<wdtjModel> getAllWdtj(String ywbz){
		return xxxqsfxdao.getAllWdtj(ywbz);
	}
	public List<xxxModel>  getXxxlist(String kssj,String jssj,String jgdm,
			String sqlnr1,
			String sqlnr2,
			String sqlnr3,
			String sqlnr4,
			String sqlnr5,
			String pdtj1,
			String pdtj2,
			String pdtj3, 
			String wdtj,
			String sjlx) {
		
		return xxxqsfxdao.getXxxlist(kssj, jssj, 
				                 jgdm, sqlnr1,
				                 sqlnr2,sqlnr3, 
				                 sqlnr4,sqlnr5,
				                 pdtj1,pdtj2, 
				                 pdtj3, wdtj,
				                 sjlx);
		
	}
	public List<xxxModel>  getYyylist(String kssj,String jssj,String jgdm,
			String sqlnr1,
			String sqlnr2,
			String sqlnr3,
			String sqlnr4,
			String sqlnr5,
			String pdtj1,
			String pdtj2,
			String pdtj3, 
			String wdtj,
			String sjlx) {
		
		return xxxqsfxdao.getYyylist(kssj, jssj, 
				                 jgdm, sqlnr1,
				                 sqlnr2,sqlnr3, 
				                 sqlnr4,sqlnr5,
				                 pdtj1,pdtj2, 
				                 pdtj3, wdtj,
				                 sjlx);
		
	}
	
	
	@Override
	public BaseMybatisDao<xxxModel, String> getBaseDao() {
		// TODO Auto-generated method stub
		return xxxqsfxdao;
	}
}
