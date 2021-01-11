package com.wondersgroup.wszygl.manager;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;
import com.wondersgroup.api.mybatis.dao.BaseMybatisDao;
import com.wondersgroup.api.mybatis.manager.BaseMybatisManager;
import com.wondersgroup.commons.model.TbAuthOrganization;
import com.wondersgroup.wszygl.dao.OperationRecordDao;
import com.wondersgroup.wszygl.model.AreaModel;
import com.wondersgroup.wszygl.model.OpeCatlogModel;
import com.wondersgroup.wszygl.model.OperationRecordModel;
import com.wondersgroup.wszygl.model.SsbmyljgModel;
import com.wondersgroup.ylfwgl.model.YljgModel;

@Component
public class OperationRecordManager extends BaseMybatisManager<OperationRecordModel, String> {

	@Autowired
	private OperationRecordDao operationRecordDao;

	@Override
	public BaseMybatisDao<OperationRecordModel, String> getBaseDao() {
		return operationRecordDao;
	}

	public List<OperationRecordModel> getAll() {
		return operationRecordDao.getAll();
	}

	public List<OpeCatlogModel> getAllCatlog() {

		return operationRecordDao.getAllCatlog();
	}
	
	public List<OpeCatlogModel> getYljg(String id) {

		return operationRecordDao.getYljg(id);
	}
	public TbAuthOrganization getOrgCodeByOrgid(String orgid) {
		return operationRecordDao.getOrgCodeByOrgid(orgid);
	}
	public YljgModel getJgmc(String jgdm) {
		return operationRecordDao.getJgmc(jgdm);
	}

	public OperationRecordModel getOpeByGradeid(String gradeid) {
		// TODO Auto-generated method stub
		return operationRecordDao.getOpeByGradeid(gradeid);
	}




}