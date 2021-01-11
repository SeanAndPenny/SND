package com.wondersgroup.wszygl.manager;




import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;
import com.wondersgroup.api.mybatis.dao.BaseMybatisDao;
import com.wondersgroup.api.mybatis.manager.BaseMybatisManager;
import com.wondersgroup.wszygl.dao.JkdaLogDao;
import com.wondersgroup.wszygl.model.JkdaLogModel;
@Component
public class JkdaLogManager extends BaseMybatisManager<JkdaLogModel, String>{

	@Autowired
	private JkdaLogDao jkdaLogDao;
	@Override
	public BaseMybatisDao<JkdaLogModel, String> getBaseDao() {
		return jkdaLogDao;
	}
	
}
