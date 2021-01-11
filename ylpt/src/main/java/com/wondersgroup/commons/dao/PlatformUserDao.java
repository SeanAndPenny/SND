package com.wondersgroup.commons.dao;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Component;

import com.wondersgroup.api.mybatis.dao.BaseMybatisDao;
import com.wondersgroup.commons.model.PlatformSys;
import com.wondersgroup.commons.model.PlatformUser;
import com.wondersgroup.commons.model.PtLog;

@Mapper
@Component
public interface PlatformUserDao extends BaseMybatisDao<PlatformUser, String> {

	PlatformUser getByUseridAndKeyWord(@Param(value="userid")String userid, @Param(value="otherplatkey")String otherplatkey);

	PlatformSys getSysByKeyWord(@Param(value="platfromkey")String platfromkey);

	void insertPtlog(PtLog ptLog);

	void insertUser(PlatformUser platformUser);

	void insertSys(PlatformSys platformSys);

	
}