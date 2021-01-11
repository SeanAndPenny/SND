package com.wondersgroup.ggwsgl.dao;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Component;

import com.wondersgroup.api.mybatis.dao.BaseMybatisDao;
import com.wondersgroup.ggwsgl.model.CkztModel;
import com.wondersgroup.ggwsgl.model.WJDTX;
import com.wondersgroup.ggwsgl.model.WjdtxxModel;
import com.wondersgroup.ggwsgl.model.YljgModel;


@Mapper
@Component
public interface WjdtxxDao extends BaseMybatisDao<WjdtxxModel,String>{
	List<YljgModel> getAllYljg();
	WjdtxxModel getWjktx(@Param(value="yljgdm") String yljgdm,
			@Param(value="zjhm") String zjhm,
			@Param(value="xm") String xm);
	void updatetxzt(@Param(value="zjhm") String zjhm);
	List<CkztModel> getAllCkzt();
	//老年人高危提醒
    void updaLnrGwTx(@Param(value="zjhm") String zjhm);
    WjdtxxModel getLnrGwTx(@Param(value="yljgdm") String yljgdm,
			@Param(value="zjhm") String zjhm,
			@Param(value="xm") String xm);
    
}
