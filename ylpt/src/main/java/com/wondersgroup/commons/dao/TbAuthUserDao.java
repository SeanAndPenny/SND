package com.wondersgroup.commons.dao;

import org.apache.ibatis.annotations.Mapper;
import org.springframework.stereotype.Component;

import com.wondersgroup.api.mybatis.dao.BaseMybatisDao;
import com.wondersgroup.commons.model.TbAuthUser;

@Mapper
@Component
public interface TbAuthUserDao extends BaseMybatisDao<TbAuthUser, String> {

	TbAuthUser getByEntity(TbAuthUser entity);
}