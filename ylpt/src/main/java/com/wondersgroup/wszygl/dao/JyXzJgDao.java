package com.wondersgroup.wszygl.dao;
import java.util.List;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Component;
import com.wondersgroup.api.mybatis.dao.BaseMybatisDao;
import com.wondersgroup.wszygl.model.JyModel;
 

@Mapper
@Component
public interface JyXzJgDao extends BaseMybatisDao<JyModel,String>{
	 List<JyModel>  getJyXzJg(@Param(value="sfws") String sfws);
}

