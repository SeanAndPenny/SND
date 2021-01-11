package com.wondersgroup.wszygl.dao;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Component;
import com.wondersgroup.api.mybatis.dao.BaseMybatisDao;
import com.wondersgroup.wszygl.model.MedicalPersonHtModel;
import com.wondersgroup.wszygl.model.MedicalPersonModel;
import com.wondersgroup.wszygl.model.MedicalPersonTxModel;

@Mapper
@Component
public interface MedicalPersonDao extends BaseMybatisDao<MedicalPersonModel, String> {

	MedicalPersonHtModel getByPersonid(@Param(value="id")String id);

	void saveHt(MedicalPersonHtModel ht);

	List<MedicalPersonTxModel> getTxByPersonid(String id);
	
	List<MedicalPersonModel> getCkxxByidcard(String idcard);
   int  getXq(@Param(value="id")String id,@Param(value="yljgmc")String yljgmc);
   void getXgxqzt(@Param(value="id")String id);
   List<MedicalPersonModel> findAll(@Param(value="xm") String xm,@Param(value="idcardtype") String idcardtype,
		   @Param(value="yljgdm") String yljgdm);
}