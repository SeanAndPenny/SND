package com.wondersgroup.wszygl.manager;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import com.wondersgroup.api.mybatis.dao.BaseMybatisDao;
import com.wondersgroup.api.mybatis.manager.BaseMybatisManager;
import com.wondersgroup.wszygl.dao.CwtjDao;
import com.wondersgroup.wszygl.model.CwtjModel;

@Component
public class CwtjManger extends BaseMybatisManager<CwtjModel,String>{
	@Autowired
	private CwtjDao cwtjDao;
    public List<CwtjModel>getCwbxt(){
    	return cwtjDao.getCwbxt();
    }
    public List<CwtjModel>getCwtj(){
    	return cwtjDao.getCwtj();
    }
	@Override
	public BaseMybatisDao<CwtjModel, String> getBaseDao() {
		// TODO Auto-generated method stub
		return cwtjDao;
	}
}
