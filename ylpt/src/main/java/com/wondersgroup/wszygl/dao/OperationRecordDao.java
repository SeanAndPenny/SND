package com.wondersgroup.wszygl.dao;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Component;
import com.wondersgroup.api.mybatis.dao.BaseMybatisDao;
import com.wondersgroup.commons.model.TbAuthOrganization;
import com.wondersgroup.wszygl.model.OpeCatlogModel;
import com.wondersgroup.wszygl.model.OperationRecordModel;
import com.wondersgroup.wszygl.model.SsbmyljgModel;
import com.wondersgroup.ylfwgl.model.YljgModel;

@Mapper
@Component
public interface OperationRecordDao extends BaseMybatisDao<OperationRecordModel, String> {

	List<OperationRecordModel> getAll();

	List<OpeCatlogModel> getAllCatlog();
	
	List<OpeCatlogModel>getYljg(@Param(value="id")String id);

	OperationRecordModel getOpeByGradeid(@Param(value="gradeid")String gradeid);
	TbAuthOrganization getOrgCodeByOrgid(@Param(value="orgid")String orgid);
	
	YljgModel getJgmc(@Param(value="jgdm")String jgdm);

	
}