package com.wondersgroup.wszygl.dao;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Component;

import com.wondersgroup.api.mybatis.dao.BaseMybatisDao;
import com.wondersgroup.wszygl.model.CsrsModel;
import com.wondersgroup.wszygl.model.CsrscxlbModel;
 

@Mapper
@Component
public interface CsrsDao extends BaseMybatisDao<CsrsModel,String>{
	List<CsrsModel>	getCsrsXzjgechartsList (@Param(value="yylx") String yylx);
	 public List<CsrsModel>getCsrstj(); 
	 public List<CsrscxlbModel>getCxlb();
	 public List<CsrsModel>getFmrstj(); 
}
