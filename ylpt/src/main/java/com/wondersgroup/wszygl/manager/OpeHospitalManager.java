package com.wondersgroup.wszygl.manager;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;
import com.wondersgroup.api.mybatis.dao.BaseMybatisDao;
import com.wondersgroup.api.mybatis.manager.BaseMybatisManager;
import com.wondersgroup.wszygl.dao.OpeHopitalDao;
import com.wondersgroup.wszygl.dao.OperationRecordDao;
import com.wondersgroup.wszygl.model.AreaModel;
import com.wondersgroup.wszygl.model.OpeCatlogModel;
import com.wondersgroup.wszygl.model.OpeHospitalModel;
import com.wondersgroup.wszygl.model.OperationRecordModel;

@Component
public class OpeHospitalManager extends BaseMybatisManager<OpeHospitalModel, String> {

	@Autowired
	private OpeHopitalDao opeHopitalDao;
	
	public List<OpeHospitalModel>findXx(String gradeid){
		return opeHopitalDao.findXx(gradeid);
	}
	
	public void updateOpe(String id) {
		opeHopitalDao.updateOpe(id);
	}
	
	public void updateOpe1(String id) {
		opeHopitalDao.updateOpe1(id);
	}

	@Override
	public BaseMybatisDao<OpeHospitalModel, String> getBaseDao() {
		return opeHopitalDao;
	}

	




}