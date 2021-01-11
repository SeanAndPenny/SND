package com.wondersgroup.wszygl.dao;

import java.util.HashMap;
import java.util.List;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Component;

import com.wondersgroup.api.mybatis.dao.BaseMybatisDao;
import com.wondersgroup.ggwsgl.model.OptionModel;
import com.wondersgroup.wszygl.model.SqlModel;
import com.wondersgroup.wszygl.model.XxymZdModel;
import com.wondersgroup.wszygl.model.YwbmModel;
import com.wondersgroup.wszygl.model.ZwbmModel;
@Component
@Mapper
public interface YwxxXzDao extends BaseMybatisDao<SqlModel, String>{
	YwbmModel getYwbm(@Param(value="sl1") String sl1,
            @Param(value="ywbz") String ywbz);
	List<ZwbmModel> getzwbm(@Param(value="tablename") String tablename,
            @Param(value="ywbz") String ywbz);
	
	List<XxymZdModel> getXxymZdList(@Param(value="wdyw") String wdyw,
			@Param(value="ywbz") String ywbz);
	List<OptionModel>getOption(@Param(value="ywbz") String ywbz,
			@Param(value="wdyw") String wdyw,
			@Param(value="zddm") String zddm,
			@Param(value="yljgdm") String yljgdm
			);
	List<OptionModel>getOptions(@Param(value="ywbz") String ywbz,
			@Param(value="wdyw") String wdyw,
			@Param(value="zddm") String zddm
			 
			);
	
	int getCount(@Param(value="kssj") String kssj,
			@Param(value="jssj") String jssj,
			@Param(value="jgdm") String jgdm,
			@Param(value="sqlnr") String sqlnr,
			@Param(value="pdtj1") String pdtj1,
			@Param(value="pdtj2") String pdtj2,
			@Param(value="pdtj3") String pdtj3,
			@Param(value="pdtj4") String pdtj4,
			@Param(value="pdtj5") String pdtj5,
			@Param(value="pdtj6") String pdtj6,
			@Param(value="pdtj7") String pdtj7,
			@Param(value="pdtj8") String pdtj8,
			@Param(value="pdtj9") String pdtj9,
			@Param(value="pdtj10") String pdtj10,
			@Param(value="mcdm") String mcdm,
			@Param(value="id6") String id6
			);
	
	List<HashMap<String, Object>>getYwxxzs(
			@Param(value="kssj") String kssj,
			@Param(value="jssj") String jssj,
			@Param(value="jgdm") String jgdm,
			@Param(value="sqlnr") String sqlnr,
			@Param(value="pdtj1") String pdtj1,
			@Param(value="pdtj2") String pdtj2,
			@Param(value="pdtj3") String pdtj3,
			@Param(value="pdtj4") String pdtj4,
			@Param(value="pdtj5") String pdtj5,
			@Param(value="pdtj6") String pdtj6,
			@Param(value="pdtj7") String pdtj7,
			@Param(value="pdtj8") String pdtj8,
			@Param(value="pdtj9") String pdtj9,
			@Param(value="pdtj10") String pdtj10,
			@Param(value="mcdm") String mcdm,
			@Param(value="ccc") int ccc,
			@Param(value="id6") String id6
			
			);
}
