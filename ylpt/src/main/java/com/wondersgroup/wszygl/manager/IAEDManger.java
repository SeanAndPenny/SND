package com.wondersgroup.wszygl.manager;

import com.wondersgroup.api.mybatis.dao.BaseMybatisDao;
import com.wondersgroup.api.mybatis.manager.BaseMybatisManager;
import com.wondersgroup.wszygl.dao.BassDao;
import com.wondersgroup.wszygl.dao.IAEDDao;
import com.wondersgroup.wszygl.model.BassModel;
import com.wondersgroup.wszygl.model.IAEDModel;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import java.util.List;
/*资金服务层*/
@Component
public class IAEDManger extends BaseMybatisManager<IAEDModel,String>{
	@Autowired
	private IAEDDao iaeddao;

	public List<IAEDModel> getChart01(String kssj,String jssj,String jgdm,String objectCode) {
		return iaeddao.getChart01(kssj,jssj,jgdm,objectCode);
	}
	public List<IAEDModel> getCicleChart01(String kssj,String jssj,String jgdm,String objectLen,String objectCode) {
		return iaeddao.getCicleChart01(kssj,jssj,jgdm,objectLen,objectCode);
	}
	public List<IAEDModel> getAreaChart01(String jgdm,String kssj,String jssj,String objectCode,String objectLen) {
		return iaeddao.getAreaChart01(jgdm,kssj,jssj,objectCode,objectLen);
	}

	public  String getMinSwsj() {
		return iaeddao.getMinSwsj();
	}
	public  String getMaxSwsj() {
		return iaeddao.getMaxSwsj();
	}
	@Override
	public BaseMybatisDao<IAEDModel, String> getBaseDao() {
		// TODO Auto-generated method stub
		return iaeddao;
	}

}
