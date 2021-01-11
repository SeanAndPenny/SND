package com.wondersgroup.smsCenter.client;

import javax.xml.bind.annotation.XmlRegistry;


/**
 * This object contains factory methods for each 
 * Java content interface and Java element interface 
 * generated in the com.wondersgroup.smsCenter.client package. 
 * <p>An ObjectFactory allows you to programatically 
 * construct new instances of the Java representation 
 * for XML content. The Java representation of XML 
 * content can consist of schema derived interfaces 
 * and classes representing the binding of schema 
 * type definitions, element declarations and model 
 * groups.  Factory methods for each of these are 
 * provided in this class.
 * 
 */
@XmlRegistry
public class ObjectFactory {


    /**
     * Create a new ObjectFactory that can be used to create new instances of schema derived classes for package: com.wondersgroup.smsCenter.client
     * 
     */
    public ObjectFactory() {
    }

    /**
     * Create an instance of {@link SendSmsResp }
     * 
     */
    public SendSmsResp createSendSmsResp() {
        return new SendSmsResp();
    }

    /**
     * Create an instance of {@link SendSmsReq }
     * 
     */
    public SendSmsReq createSendSmsReq() {
        return new SendSmsReq();
    }

    /**
     * Create an instance of {@link SendSmsResp.Result }
     * 
     */
    public SendSmsResp.Result createSendSmsRespResult() {
        return new SendSmsResp.Result();
    }

    /**
     * Create an instance of {@link SendSmsReq.Sms }
     * 
     */
    public SendSmsReq.Sms createSendSmsReqSms() {
        return new SendSmsReq.Sms();
    }

}
