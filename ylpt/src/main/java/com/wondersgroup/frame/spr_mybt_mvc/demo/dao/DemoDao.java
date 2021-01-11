package com.wondersgroup.frame.spr_mybt_mvc.demo.dao;

import org.apache.ibatis.annotations.Mapper;
import org.springframework.stereotype.Component;

import com.wondersgroup.api.mybatis.dao.BaseMybatisDao;
import com.wondersgroup.frame.spr_mybt_mvc.demo.model.DemoEntity;

@Mapper
@Component
public interface DemoDao extends BaseMybatisDao<DemoEntity, String> {
}