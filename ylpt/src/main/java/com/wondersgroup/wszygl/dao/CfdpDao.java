package com.wondersgroup.wszygl.dao;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Component;

import com.wondersgroup.api.mybatis.dao.BaseMybatisDao;
import com.wondersgroup.wszygl.model.CfModel;
import com.wondersgroup.wszygl.model.Cfdp;
import com.wondersgroup.wszygl.model.CfdpModel;
import com.wondersgroup.wszygl.model.CfdpTjfxModel;
import com.wondersgroup.wszygl.model.HzxxModel;
import com.wondersgroup.wszygl.model.JyjcModel;

@Mapper
@Component
public interface CfdpDao extends BaseMybatisDao<CfdpModel,String> {
	//通过yljgdm和处方编号获得患者信息
	HzxxModel findXx(@Param(value="yljgdm")String yljgdm,@Param(value="cfbh")String cfbh);
	//通过yljgdm和处方编号获得处方信息
	List<CfModel> findCf(@Param(value="yljgdm")String yljgdm,@Param(value="cfbh")String cfbh);
	//保存处方点评内容
	void insertCfdp(CfdpModel cfdpmodel);
	//通过yljgdm和处方编号获得处方点评内容
	List<Cfdp> findCfdp(@Param(value="yljgdm")String yljgdm,@Param(value="cfbh")String cfbh);
	//修改点评状态
	void updateCfdp(@Param(value="yljgdm")String yljgdm,@Param(value="cfbh")String cfbh);
	//修改点评状态
	void updateCfdp1(@Param(value="yljgdm")String yljgdm,@Param(value="cfbh")String cfbh);
	//通过id获得处方点评唯一内容
	Cfdp findCfdpnr(String id);
	//修改处方点评内容
	void updateCfdpnr(Cfdp cfdp);
	//找到校验信息
	JyjcModel findJy(@Param(value="yljgdm")String yljgdm,@Param(value="jzlsh")String jzlsh);
	//找到检查信息
	List<JyjcModel>findJc(@Param(value="yljgdm")String yljgdm,@Param(value="sfzh")String sfzh);
	//删除点评内容
	void deleteCfdp(String id);
	
	List <CfdpTjfxModel> findTjfx();
}
