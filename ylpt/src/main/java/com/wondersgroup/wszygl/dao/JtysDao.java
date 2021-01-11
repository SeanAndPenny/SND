package com.wondersgroup.wszygl.dao;

import java.util.List;
import org.apache.ibatis.annotations.Mapper;
import org.springframework.stereotype.Component;
import com.wondersgroup.api.mybatis.dao.BaseMybatisDao;
import com.wondersgroup.wszygl.model.CsrsModel;
import com.wondersgroup.wszygl.model.JtysModel;
@Mapper
@Component
public interface JtysDao extends BaseMybatisDao<JtysModel, String>{
	public JtysModel getJtys();
	public List<JtysModel>getJtywFwb();
	public List<JtysModel>getJtywJg();
	public List<JtysModel>getJtywTd();
	public List<JtysModel>getJtyslb();
	public CsrsModel getCstj();
}
