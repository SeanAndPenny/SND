package com.wondersgroup.wszygl.manager;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import com.wondersgroup.api.mybatis.dao.BaseMybatisDao;
import com.wondersgroup.api.mybatis.manager.BaseMybatisManager;
import com.wondersgroup.wszygl.dao.JdtjDao;
import com.wondersgroup.wszygl.model.JdtjModel;
 
@Component
public class JdtjManger extends BaseMybatisManager<JdtjModel, String>{
	@Autowired
	private   JdtjDao jdtjDao;
	public List<JdtjModel> getJdxx(){
		return jdtjDao.getJdxx();
	}
	public List<JdtjModel> jdtjXzxx(String jdlx){
		return jdtjDao.jdtjXzxx(jdlx);
	}
	public JdtjModel getJdtj() {
		return jdtjDao.getJdtj();
	} 
	public List<JdtjModel>  getJdTjxxecharts(){
		return jdtjDao.getJdTjxxecharts();
	}
	@Override
	public BaseMybatisDao<JdtjModel, String> getBaseDao() {
		// TODO Auto-generated method stub
		return jdtjDao;
	}

}
