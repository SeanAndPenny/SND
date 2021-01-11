package com.wondersgroup.wszygl.manager;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import com.wondersgroup.api.mybatis.dao.BaseMybatisDao;
import com.wondersgroup.api.mybatis.manager.BaseMybatisManager;
import com.wondersgroup.wszygl.dao.SsywjcxzDao;
import com.wondersgroup.wszygl.model.SsywjcModel;
@Component
public class SsywjcxzManger extends BaseMybatisManager<SsywjcModel,String>{
  @Autowired
  private SsywjcxzDao ssywjcxzDao;

  @Override
  public BaseMybatisDao<SsywjcModel, String> getBaseDao() {
    // TODO Auto-generated method stub
    return ssywjcxzDao;
  }
}

