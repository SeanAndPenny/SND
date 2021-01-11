package com.wondersgroup.wszygl.manager;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import com.wondersgroup.api.mybatis.dao.BaseMybatisDao;
import com.wondersgroup.api.mybatis.manager.BaseMybatisManager;
import com.wondersgroup.wszygl.dao.YyssbmDao;
import com.wondersgroup.wszygl.model.SsbmyljgModel;
import com.wondersgroup.ylfwgl.model.YljgModel;


@Component
public class YyssbmManager extends BaseMybatisManager<SsbmyljgModel, String>{

	@Autowired
	private YyssbmDao yyssbmDao;
	
	public List<YljgModel> getAllYljg(String yljgdm){
		return yyssbmDao. getAllYljg(yljgdm);
	}
	@Override
	public BaseMybatisDao<SsbmyljgModel, String> getBaseDao() {
		return yyssbmDao;
	}
}
