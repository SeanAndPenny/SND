package com.huanya.ws.client;

import javax.jws.WebParam;
import javax.jws.WebService;

@WebService(name="huanyaDocumentInfoClient",
			serviceName="CommonWebserviceImplService",
			portName="CommonWebserviceImplPort",
			targetNamespace="http://impl.service.webservice.ifd.aadata.cn/")
public interface HuanyaDocumentInfoClient {
	public String getMessage(@WebParam(name = "startTime") String startTime, @WebParam(name = "endTime") String endTime);
}
