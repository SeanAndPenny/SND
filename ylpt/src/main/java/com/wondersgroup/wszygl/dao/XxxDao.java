package com.wondersgroup.wszygl.dao;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Component;

import com.wondersgroup.api.mybatis.dao.BaseMybatisDao;
import com.wondersgroup.wszygl.model.McpzModel;
import com.wondersgroup.wszygl.model.QxModel;
import com.wondersgroup.wszygl.model.YljgMcModel;
import com.wondersgroup.wszygl.model.ZhjgUserModel;
import com.wondersgroup.wszygl.model.wdtjModel;
import com.wondersgroup.wszygl.model.xxxModel;
@Mapper
@Component
public interface XxxDao extends BaseMybatisDao<xxxModel,String>{
	xxxModel getXxx(@Param(value="ywbz") String ywbz,
			              @Param(value="yxbz") String yxbz);
	
	xxxModel getKkk(@Param(value="ywbz") String ywbz,
    @Param(value="wdtj") String wdtj); 
	List<xxxModel>  getXxxlist(@Param(value="kssj")  String kssj,
			                   @Param(value="jssj")  String jssj,
			                   @Param(value="jgdm")  String jgdm,
			                   @Param(value="sqlnr1") String sqlnr1,
			                   @Param(value="sqlnr2") String sqlnr2,
			                   @Param(value="sqlnr3") String sqlnr3,
			                   @Param(value="pdtj1") String pdtj1,
			                   @Param(value="pdtj2") String pdtj2,
			                   @Param(value="pdtj3") String pdtj3,
			                   @Param(value="tjsjwd") String tjsjwd,
			                   @Param(value="wdtj") String wdtj
			                   );
	String  getzlSum(@Param(value="kssj")  String kssj,
            @Param(value="jssj")  String jssj,
            @Param(value="jgdm")  String jgdm,
            @Param(value="sqlnr1") String sqlnr1,
            @Param(value="sqlnr2") String sqlnr2,
            @Param(value="sqlnr3") String sqlnr3,
            @Param(value="pdtj1") String pdtj1,
            @Param(value="pdtj2") String pdtj2,
            @Param(value="pdtj3") String pdtj3,
            @Param(value="tjsjwd") String tjsjwd,
            @Param(value="wdtj") String wdtj
            );
	
	
	List<xxxModel> getKkklist(@Param(value="kssj")  String kssj,
            @Param(value="jssj")  String jssj,
            @Param(value="jgdm")  String jgdm,
            @Param(value="sqlnr1") String sqlnr1,
            @Param(value="sqlnr2") String sqlnr2,
            @Param(value="sqlnr3") String sqlnr3,
            @Param(value="pdtj1") String pdtj1,
            @Param(value="pdtj2") String pdtj2,
            @Param(value="pdtj3") String pdtj3,
            @Param(value="tjsjwd") String tjsjwd,
            @Param(value="wdtj") String wdtj
            );
	String getzlSum2(@Param(value="kssj")  String kssj,
            @Param(value="jssj")  String jssj,
            @Param(value="jgdm")  String jgdm,
            @Param(value="sqlnr1") String sqlnr1,
            @Param(value="sqlnr2") String sqlnr2,
            @Param(value="sqlnr3") String sqlnr3,
            @Param(value="pdtj1") String pdtj1,
            @Param(value="pdtj2") String pdtj2,
            @Param(value="pdtj3") String pdtj3,
            @Param(value="tjsjwd") String tjsjwd,
            @Param(value="wdtj") String wdtj
            );
	
	List<McpzModel>  getmcpzList(@Param(value="ywbz")  String ywbz,
								@Param(value="wdtj")  String wdtj);
	List<McpzModel>   getmcp(@Param(value="ywbz")  String ywbz,
			                    @Param(value="wdtj")  String wdtj);
	 
	 
	List<YljgMcModel> getAllYljg(@Param(value="yljgdm")  String yljgdm);
	
	List<YljgMcModel> getCzrkYljg(@Param(value="yljgdm")  String yljgdm);
	List<YljgMcModel>getLdrkYljg(@Param(value="yljgdm")  String yljgdm);
	List<wdtjModel> getAllWdtj(@Param(value="ywbz")  String ywbz);
	
	List<ZhjgUserModel> getQx(@Param(value="loginUser") String loginUser);
	
	ZhjgUserModel fakeAuthUserInfo(@Param(value="loginname1") String loginname1,
			@Param(value="pwd1") String pwd1
			);
	
}
