package com.wondersgroup.wszygl.manager;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;
import com.wondersgroup.api.mybatis.dao.BaseMybatisDao;
import com.wondersgroup.api.mybatis.manager.BaseMybatisManager;
import com.wondersgroup.wszygl.dao.ShHopitalDao;
import com.wondersgroup.wszygl.model.OpeHospitalModel;


@Component
public class ShHospitalManager extends BaseMybatisManager<OpeHospitalModel, String> {

	@Autowired
	private ShHopitalDao shHopitalDao;
	

	@Override
	public BaseMybatisDao<OpeHospitalModel, String> getBaseDao() {
		return shHopitalDao;
	}

	




}