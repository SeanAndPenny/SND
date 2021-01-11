package com.huanya.ws.bean;

import javax.xml.bind.annotation.XmlElement;
import javax.xml.bind.annotation.XmlType;

@XmlType(name = "data", propOrder = {
	    "dataDetail"
})
public class Data {
	private DataDetail dataDetail;

	@XmlElement(name = "dataDetail")
	public DataDetail getDataDetail() {
		return dataDetail;
	}

	public void setDataDetail(DataDetail dataDetail) {
		this.dataDetail = dataDetail;
	}
}
