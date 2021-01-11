package com.huanya.ws;


import com.huanya.ws.bean.WebsvcResult;
import com.wondersgroup.api.commons.XmlMapper;

import junit.framework.TestCase;

public class HuanyaTest extends TestCase {

	public void testXml2Bean() {
		String xml = "<root><code>0</code><msg>查询成功！</msg><data><dataDetail><JDJGID>320505001</JDJGID><JDJGMC>枫桥街道社区卫生服务中心</JDJGMC><TDID>320505007106</TDID><TDMC>枫桥郑晓英全科医疗服务团队</TDMC><JDRS>11199</JDRS><DADTS>877</DADTS><BL>0.0783105634431645682650236628270381284043</BL></dataDetail></data></root>";
		XmlMapper xmlmapper = XmlMapper.buildXmlMapper(WebsvcResult.class);
		WebsvcResult res = xmlmapper.xml2bean(xml, WebsvcResult.class);
		System.out.println(res);
	}

}
