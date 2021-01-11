package com.wondersgroup.wszygl.manager;

import java.util.HashMap;
import java.util.List;
 

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import com.wondersgroup.api.mybatis.dao.BaseMybatisDao;
import com.wondersgroup.api.mybatis.manager.BaseMybatisManager;
import com.wondersgroup.wszygl.dao.SqlYjcxDao;
import com.wondersgroup.wszygl.model.SqlModel;
 

@Component
public class SqlYjcxManger extends BaseMybatisManager<SqlModel, String>{
	@Autowired 
	public SqlYjcxDao sqlYjcxDao;
	@Override
	public BaseMybatisDao<SqlModel, String> getBaseDao() {
		// TODO Auto-generated method stub
		return sqlYjcxDao;
	}
	public List<HashMap<String, Object>>  getsqlyjcx(String sqlbk){
		return sqlYjcxDao.getsqlyjcx(sqlbk);
	}
}
