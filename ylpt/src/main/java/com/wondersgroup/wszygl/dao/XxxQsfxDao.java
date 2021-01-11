package com.wondersgroup.wszygl.dao;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Component;

import com.wondersgroup.api.mybatis.dao.BaseMybatisDao;
import com.wondersgroup.wszygl.model.McpzModel;
import com.wondersgroup.wszygl.model.wdtjModel;
import com.wondersgroup.wszygl.model.xxxModel;

@Mapper
@Component
public interface XxxQsfxDao extends BaseMybatisDao<xxxModel,String>{
	xxxModel getXxx(@Param(value="ywbz") String ywbz,
            @Param(value="yxbz") String yxbz);
	xxxModel getYyy(
			@Param(value="ywbz") String ywbz,
            @Param(value="wdtj") String wdtj
			);
	List<McpzModel>  getmcpzList(@Param(value="ywbz")  String ywbz,
			@Param(value="wdtj")  String wdtj);
	
	List<McpzModel>   getmcp(@Param(value="ywbz")  String ywbz,
            @Param(value="wdtj")  String wdtj);
	
	List<wdtjModel> getAllWdtj(@Param(value="ywbz")  String ywbz);
	
	List<xxxModel>  getXxxlist(@Param(value="kssj")  String kssj,
            @Param(value="jssj")  String jssj,
            @Param(value="jgdm")  String jgdm,
            @Param(value="sqlnr1") String sqlnr1,
            @Param(value="sqlnr2") String sqlnr2,
            @Param(value="sqlnr3") String sqlnr3,
            @Param(value="sqlnr4") String sqlnr4,
            @Param(value="sqlnr5") String sqlnr5,
            
            @Param(value="pdtj1") String pdtj1,
            @Param(value="pdtj2") String pdtj2,
            @Param(value="pdtj3") String pdtj3,  
            @Param(value="wdtj") String wdtj,
            @Param(value="sjlx") String sjlx
            );
	
	List<xxxModel>  getYyylist(@Param(value="kssj")  String kssj,
            @Param(value="jssj")  String jssj,
            @Param(value="jgdm")  String jgdm,
            @Param(value="sqlnr1") String sqlnr1,
            @Param(value="sqlnr2") String sqlnr2,
            @Param(value="sqlnr3") String sqlnr3,
            @Param(value="sqlnr4") String sqlnr4,
            @Param(value="sqlnr5") String sqlnr5,
            
            @Param(value="pdtj1") String pdtj1,
            @Param(value="pdtj2") String pdtj2,
            @Param(value="pdtj3") String pdtj3,  
            @Param(value="wdtj") String wdtj,
            @Param(value="sjlx") String sjlx
            );
}
