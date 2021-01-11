package com.wondersgroup.wszygl.dao;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Component;

import com.wondersgroup.api.mybatis.dao.BaseMybatisDao;
import com.wondersgroup.wszygl.model.YbFytjModel;
import com.wondersgroup.wszygl.model.YljgModel;
@Mapper
@Component
public interface GxqYbFytjDao extends  BaseMybatisDao<YbFytjModel,String>{
	List<YbFytjModel> getechar01(
			@Param(value="kssj")  String kssj,
            @Param(value="jssj")  String jssj,
            @Param(value="jgdm")  String jgdm,
            @Param(value="sjlx")  String sjlx
			);
	List<YbFytjModel> getechar02(
			@Param(value="kssj")  String kssj,
            @Param(value="jssj")  String jssj,
            @Param(value="jgdm")  String jgdm,
            @Param(value="sjlx")  String sjlx
			);
	List<YbFytjModel> getechar03(
			@Param(value="kssj")  String kssj,
            @Param(value="jssj")  String jssj,
            @Param(value="jgdm")  String jgdm,
            @Param(value="sjlx")  String sjlx,
            @Param(value="qylx")  String qylx
			);
	List<YbFytjModel> getechar04(
			@Param(value="kssj")  String kssj,
            @Param(value="jssj")  String jssj,
            @Param(value="jgdm")  String jgdm,
            @Param(value="sjlx")  String sjlx,
            @Param(value="qylx")  String qylx
			);
	List<YbFytjModel> getechar05(
			@Param(value="kssj")  String kssj,
            @Param(value="jssj")  String jssj,
            @Param(value="jgdm")  String jgdm,
            @Param(value="sjlx")  String sjlx,
            @Param(value="qylx")  String qylx,
            @Param(value="jglx")  String jglx
			);
	List<YbFytjModel> getechar06(
			@Param(value="kssj")  String kssj,
            @Param(value="jssj")  String jssj,
            @Param(value="jgdm")  String jgdm,
            @Param(value="sjlx")  String sjlx,
            @Param(value="qylx")  String qylx,
            @Param(value="jglx")  String jglx
			);
	List<YbFytjModel> getechar07(
			@Param(value="kssj")  String kssj,
            @Param(value="jssj")  String jssj,
            @Param(value="jgdm")  String jgdm,
            @Param(value="sjlx")  String sjlx,
            @Param(value="qylx")  String qylx,
            @Param(value="jglx")  String jglx,
            @Param(value="jbdm")  String jbdm
			);
	List<YbFytjModel> getechar08(
			@Param(value="kssj")  String kssj,
            @Param(value="jssj")  String jssj,
            @Param(value="jgdm")  String jgdm,
            @Param(value="sjlx")  String sjlx,
            @Param(value="qylx")  String qylx,
            @Param(value="jglx")  String jglx,
            @Param(value="jbdm")  String jbdm
			);
	List<YbFytjModel> getechar09(
			@Param(value="kssj")  String kssj,
            @Param(value="jssj")  String jssj,
            @Param(value="jgdm")  String jgdm,
            @Param(value="sjlx")  String sjlx,
            @Param(value="qylx")  String qylx,
            @Param(value="jglx")  String jglx,
            @Param(value="jbdm")  String jbdm
			);
	List<YbFytjModel> getechar10(
			@Param(value="kssj")  String kssj,
            @Param(value="jssj")  String jssj,
            @Param(value="jgdm")  String jgdm,
            @Param(value="sjlx")  String sjlx,
            @Param(value="qylx")  String qylx,
            @Param(value="jglx")  String jglx,
            @Param(value="jbdm")  String jbdm
			);
	List<YbFytjModel> getechar11(
			@Param(value="kssj")  String kssj,
            @Param(value="jssj")  String jssj,
            @Param(value="jgdm")  String jgdm,
            @Param(value="sjlx")  String sjlx,
            @Param(value="qylx")  String qylx,
            @Param(value="jglx")  String jglx,
            @Param(value="jbdm")  String jbdm
			);
	List<YbFytjModel> getechar12(
			@Param(value="kssj")  String kssj,
            @Param(value="jssj")  String jssj,
            @Param(value="jgdm")  String jgdm,
            @Param(value="sjlx")  String sjlx,
            @Param(value="qylx")  String qylx,
            @Param(value="jglx")  String jglx,
            @Param(value="jbdm")  String jbdm
			);
	List<YbFytjModel> getechar13(
			@Param(value="kssj")  String kssj,
            @Param(value="jssj")  String jssj,
            @Param(value="jgdm")  String jgdm,
            @Param(value="sjlx")  String sjlx,
            @Param(value="qylx")  String qylx,
            @Param(value="jglx")  String jglx,
            @Param(value="jbdm")  String jbdm
			);
	List<YbFytjModel> getechar14(
			@Param(value="kssj")  String kssj,
            @Param(value="jssj")  String jssj,
            @Param(value="jgdm")  String jgdm,
            @Param(value="sjlx")  String sjlx,
            @Param(value="qylx")  String qylx,
            @Param(value="jglx")  String jglx,
            @Param(value="jbdm")  String jbdm
			);
	List<YljgModel> getYljgModel( 
            @Param(value="jgdm")  String jgdm    
			);
	
	String getMinSwsj();
	String getMaxSwsj();
}
