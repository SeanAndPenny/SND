package com.huanya.ws.bean;

import java.util.List;

import javax.xml.bind.annotation.XmlElement;
import javax.xml.bind.annotation.XmlRootElement;
import javax.xml.bind.annotation.XmlType;

/**
 * 文档范例soap文档
<soap:Envelope xmlns:soap="http://schemas.xmlsoap.org/soap/envelope/">
   <soap:Body>
      <ns1:getNewMessageResponse xmlns:ns1="http://webservice.mat.aadata.cn/">
         <return><![CDATA[
         			<root>
         				<code>0</code>
         				<msg>查询成功！</msg>
         				<data>
         					<dataDetail>
         						<JDJGID>320505001</JDJGID>
         						<JDJGMC>枫桥街道社区卫生服务中心</JDJGMC>
         						<TDID>320505007106</TDID>
         						<TDMC>枫桥郑晓英全科医疗服务团队</TDMC>
         						<JDRS>11199</JDRS>
         						<DADTS>877</DADTS>
         						<BL>0.0783105634431645682650236628270381284043</BL>
         					</dataDetail>
         				</data>
         			</root>]]></return>
      </ns1:getNewMessageResponse>
   </soap:Body>
</soap:Envelope>备注：考虑到返回数据量较多，本文档只选取一条作为返回值。
 * @author dell
 */
@XmlRootElement(name = "root")
@XmlType(propOrder = { "code", "msg", "data" })
public class WebsvcResult {
	private String code;			// code 交易结果代码 Y 1：成功，0：失败
	private String msg;				// msg 交易结果信息 Y 返回结果
	private Data data;				// data 查询结果

	@XmlElement(name = "code")
	public String getCode() {
		return code;
	}

	public void setCode(String code) {
		this.code = code;
	}

	@XmlElement(name = "msg")
	public String getMsg() {
		return msg;
	}

	public void setMsg(String msg) {
		this.msg = msg;
	}

	@XmlElement(name = "data")
	public Data getData() {
		return data;
	}

	public void setData(Data data) {
		this.data = data;
	}
}
