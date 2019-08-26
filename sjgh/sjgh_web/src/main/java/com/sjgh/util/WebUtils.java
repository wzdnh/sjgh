/*
package com.sjgh.util;

import com.sun.org.apache.xml.internal.security.utils.XMLUtils;

import java.io.BufferedInputStream;
import java.util.HashMap;
import java.util.Map;


*/
/**
 * @Author: 陈政
 * @Date: 2019/6/5 4:01
 **//*

public class WebUtils {

        public static Map getMwebUrl(String url, String xmlParam){
            String jsonStr = null;
            HttpClient httpClient = new HttpClient() {

            };
            Map map = new HashMap();
            try {
                PostMethod method = null;
                RequestEntity reqEntity = new StringRequestEntity(xmlParam,"text/json","UTF-8");
                method = new PostMethod(url);
                method.setRequestEntity(reqEntity);
                method.addRequestHeader("Content-Type","application/json;charset=utf-8");
                httpClient.executeMethod(method);
                StringBuffer resBodyBuf = new StringBuffer();
                byte[] responseBody = new byte[1024];
                int readCount = 0;
                BufferedInputStream is = new BufferedInputStream(method.getResponseBodyAsStream());
                while((readCount = is.read(responseBody,0,responseBody.length))!=-1){
                    resBodyBuf.append(new String(responseBody,0,readCount,"utf-8"));
                }
                jsonStr = resBodyBuf.toString();
                System.out.println(jsonStr);
                map = XMLUtils.parseXmlToList(jsonStr);
            } catch (Exception e) {
                e.printStackTrace();
            }
            return map;
        }

}
*/
