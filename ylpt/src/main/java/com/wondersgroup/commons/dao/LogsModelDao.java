package com.wondersgroup.commons.dao;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Component;

import com.wondersgroup.api.mybatis.dao.BaseMybatisDao;
import com.wondersgroup.commons.model.LogsModel;
import com.wondersgroup.commons.model.PlatformSys;
import com.wondersgroup.commons.model.PlatformUser;
import com.wondersgroup.commons.model.PtLog;

@Mapper
@Component
public interface LogsModelDao extends BaseMybatisDao<LogsModel, String> {

}