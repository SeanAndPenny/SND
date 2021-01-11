package com.wondersgroup.wszygl.manager;

import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;
import com.wondersgroup.api.mybatis.dao.BaseMybatisDao;
import com.wondersgroup.api.mybatis.manager.BaseMybatisManager;
import com.wondersgroup.wszygl.dao.JtysFwbXzDao;
import com.wondersgroup.wszygl.model.JtysModel;
 

@Component
public class JtysFwbXzManger extends BaseMybatisManager<JtysModel, String>{
	@Autowired 
	public JtysFwbXzDao jtysFwbXzDao;
	public List<JtysModel> getJtysFwbXz(String fwbid ){
		return jtysFwbXzDao.getJtysFwbXz(fwbid);
	}
	
	@Override
	public BaseMybatisDao<JtysModel, String> getBaseDao() {
		// TODO Auto-generated method stub
		return jtysFwbXzDao;
	}

}
