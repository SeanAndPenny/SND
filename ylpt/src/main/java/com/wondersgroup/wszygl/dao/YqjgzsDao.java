package com.wondersgroup.wszygl.dao;

import java.util.List;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Component;
import com.wondersgroup.api.mybatis.dao.BaseMybatisDao;
import com.wondersgroup.wszygl.model.JcModel;
import com.wondersgroup.wszygl.model.JyModel;
import com.wondersgroup.wszygl.model.RyzxtModel;
import com.wondersgroup.wszygl.model.YqjgzsDaoModel;

@Mapper
@Component
public interface YqjgzsDao extends BaseMybatisDao<YqjgzsDaoModel, String> {
	List<YqjgzsDaoModel>getAllTb(@Param(value="startdate")String startdate,@Param(value="enddate")String enddate); 
	List<YqjgzsDaoModel>getAllTb2(@Param(value="startdate")String startdate,@Param(value="enddate")String enddate);
	List<YqjgzsDaoModel>getAllTbZhyy(@Param(value="startdate")String startdate,@Param(value="enddate")String enddate); 
	List<YqjgzsDaoModel>getAllTbZhyy2(@Param(value="startdate")String startdate,@Param(value="enddate")String enddate);
	List<RyzxtModel> getRyxx();//人员职称柱形图
	List<RyzxtModel> getRyxl();//学历柱形图
	YqjgzsDaoModel getBlList();
	YqjgzsDaoModel getZhyyBlList();
	String  getname(@Param(value="ssoUsername")String ssoUsername );
	List<JyModel>getJy();
	List<JcModel>getJc();
	String getStartdate();
}
