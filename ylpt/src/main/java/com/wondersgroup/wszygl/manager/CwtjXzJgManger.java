package com.wondersgroup.wszygl.manager;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import com.wondersgroup.api.mybatis.dao.BaseMybatisDao;
import com.wondersgroup.api.mybatis.manager.BaseMybatisManager;
import com.wondersgroup.wszygl.dao.CwtjXzJgDao;
import com.wondersgroup.wszygl.model.CwtjModel;
@Component

public class CwtjXzJgManger extends BaseMybatisManager<CwtjModel, String>{
	@Autowired 
	public CwtjXzJgDao cwtjXzJgDao;
	public List<CwtjModel>getCwtjXzJg(String id){
		return cwtjXzJgDao.getCwtjXzJg(id);
	}
	@Override
	public BaseMybatisDao<CwtjModel, String> getBaseDao() {
		// TODO Auto-generated method stub
		return cwtjXzJgDao;
	}

}
