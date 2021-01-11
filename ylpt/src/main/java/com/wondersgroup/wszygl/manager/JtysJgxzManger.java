package com.wondersgroup.wszygl.manager;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import com.wondersgroup.api.mybatis.dao.BaseMybatisDao;
import com.wondersgroup.api.mybatis.manager.BaseMybatisManager;
import com.wondersgroup.wszygl.dao.JtysJgxzDao;
import com.wondersgroup.wszygl.model.JtysModel;
@Component
public class JtysJgxzManger extends BaseMybatisManager<JtysModel, String>{
	@Autowired 
	public JtysJgxzDao  jtysJgxzDao;
	
	public List<JtysModel> getJtysFwbXz(String qyjgid ){
		return jtysJgxzDao.getJtysFwbXz(qyjgid);
	}
	
	@Override
	public BaseMybatisDao<JtysModel, String> getBaseDao() {
		// TODO Auto-generated method stub
		return jtysJgxzDao;
	}

}
