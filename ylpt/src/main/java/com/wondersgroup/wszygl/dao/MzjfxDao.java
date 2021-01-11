package com.wondersgroup.wszygl.dao;

import java.util.List;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Component;
import com.wondersgroup.api.mybatis.dao.BaseMybatisDao;
import com.wondersgroup.wszygl.model.MjzywFxModel;
import com.wondersgroup.wszygl.model.SwxxJgdmModel;

@Mapper
@Component
public interface MzjfxDao extends BaseMybatisDao<MjzywFxModel,String>{
	List<MjzywFxModel>  getMzjfx(
			@Param(value="kssj")  String kssj,
            @Param(value="jssj")  String jssj,
            @Param(value="jgdm")  String jgdm
            );
	List<MjzywFxModel>  getMzjjcfx
	        (@Param(value="kssj")  String kssj,
            @Param(value="jssj")  String jssj,
            @Param(value="jgdm")  String jgdm
            );
	List<MjzywFxModel>getMzJbfl(@Param(value="kssj")  String kssj,
            @Param(value="jssj")  String jssj,
            @Param(value="jgdm")  String jgdm
            );
	
	
	List<SwxxJgdmModel>  getmjzjgList( 
            @Param(value="jgdm")  String jgdm
            );
	List<MjzywFxModel> getMjzywecharts
	(@Param(value="jgdm")  String jgdm,
    @Param(value="kssj")  String kssj,
    @Param(value="jssj")  String jssj
    );
	
	List<MjzywFxModel>getechars03( 
			@Param(value="jgdm")  String jgdm,
		    @Param(value="kssj")  String kssj,
		    @Param(value="jssj")  String jssj
		    );
	
	List<MjzywFxModel>getechars04(
			@Param(value="jbflbm")  String jbflbm,
			@Param(value="jgdm")  String jgdm,
		    @Param(value="kssj")  String kssj,
		    @Param(value="jssj")  String jssj
		    );
	
	String getMinSwsj();
	String getMaxSwsj();
}
