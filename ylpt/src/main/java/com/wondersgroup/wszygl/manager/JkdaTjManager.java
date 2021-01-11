package com.wondersgroup.wszygl.manager;




import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;
import com.wondersgroup.api.mybatis.dao.BaseMybatisDao;
import com.wondersgroup.api.mybatis.manager.BaseMybatisManager;
import com.wondersgroup.wszygl.dao.JkdaLogDao;
import com.wondersgroup.wszygl.dao.JkdaTjDao;
import com.wondersgroup.wszygl.model.JkdaLogModel;
import com.wondersgroup.wszygl.model.JkdaTjModel;
@Component
public class JkdaTjManager extends BaseMybatisManager<JkdaTjModel, String>{

	@Autowired
	private JkdaTjDao jkdaTjDao;
	@Override
	public BaseMybatisDao<JkdaTjModel, String> getBaseDao() {
		return jkdaTjDao;
	}
	
}
