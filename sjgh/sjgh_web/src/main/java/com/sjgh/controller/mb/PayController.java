package com.sjgh.controller.mb;

import com.jpay.ext.kit.HttpKit;
import com.jpay.ext.kit.IpKit;
import com.jpay.ext.kit.PaymentKit;
import com.jpay.vo.AjaxResult;
import com.jpay.weixin.api.WxPayApi;
import com.jpay.weixin.api.WxPayApiConfig;
import com.jpay.weixin.api.WxPayApiConfigKit;
import com.sjgh.payConfig.H5ScencInfo;
import com.sjgh.payConfig.H5ScencInfo.H5;
import com.sjgh.payConfig.WxPayConfig;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.HashMap;
import java.util.Map;

/**
 * 支付控制器
 */
@Controller
@RequestMapping("/mb_pay")
public class PayController {

    //阿里支付
    public String al;
    //"https://isjgh.com/alipay/notify"


    /**
     * 微信支付
     */
    private Logger log = LoggerFactory.getLogger(this.getClass());
    private AjaxResult result = new AjaxResult();


    public static WxPayApiConfig getApiConfig() {
        return WxPayApiConfig.New()
                .setAppId(WxPayConfig.appID)
                .setMchId(WxPayConfig.mchID)
                .setPaternerKey(WxPayConfig.partnerKey)
                .setPayModel(WxPayApiConfig.PayModel.BUSINESSMODEL);
    }


    /**
     * 微信H5 支付
     * 注意：必须再web页面中发起支付且域名已添加到开发配置中
     * 调用时，需传递商品描述以及价钱
     */
    @RequestMapping(value = "/wxpay.do", method = {RequestMethod.POST, RequestMethod.GET})
    public void wapPay(HttpServletRequest request, HttpServletResponse response, @RequestParam(value = "commodityDescription") int commodityDescription, @RequestParam(value = "price") String price) {
        String body;

        //商品描述
        //1：事件代办；2：失物招领；3：事物交易
        if (commodityDescription == 1) {
            body = "事件代办";
        } else if (commodityDescription == 2) {
            body = "失物招领";
        } else {
            body = "事物交易";
        }

        String ip = IpKit.getRealIp(request);
        if (com.jpay.ext.kit.StrKit.isBlank(ip)) {
            //ip = "127.0.0.1";
            //本地ip，用于测试
            ip = "192.168.137.1";
        }

        H5ScencInfo sceneInfo = new H5ScencInfo();

        H5 h5_info = new H5();
        h5_info.setType("Wap");
        //此域名必须在商户平台--"产品中心"--"开发配置"中添加

        //h5_info.setWap_url("https://www.zzw777.com");
        h5_info.setWap_url("https://www.isjgh.com");
        h5_info.setWap_name("腾讯充值");
        sceneInfo.setH5_info(h5_info);
        //WxPayApiConfig wxPayApiConfig=getApiConfig();
        Map<String, String> params = WxPayApiConfig.New()
                .setAppId(WxPayConfig.appID)
                .setMchId(WxPayConfig.mchID)
                .setBody(body)        //商品描述
                //.setOutTradeNo("111111")	商品订单号
                .setSpbillCreateIp(ip)
                .setTotalFee(price)       //交易金额
                .setTradeType(WxPayApi.TradeType.MWEB)
                .setNotifyUrl(WxPayConfig.notify_url)
                .setPaternerKey(WxPayConfig.partnerKey)
                .setOutTradeNo(String.valueOf(System.currentTimeMillis()))
                .setSceneInfo("{\"h5_info\": {\"type\":\"cz\",\"app_name\": \"sjgh\",\"package_name\": \"com.sjgh.controller.mb\"}}")
                .setAttach("赏金工会")    //附加数据
                .build();
        String xmlResult = WxPayApi.pushOrder(false, params);
        Map<String, String> result = PaymentKit.xmlToMap(xmlResult);

        String return_code = result.get("return_code");    //返回状态码
        String return_msg = result.get("return_msg");        //返回信息

        if (!PaymentKit.codeIsOK(return_code)) {
            log.error("return_code>" + return_code + " return_msg>" + return_msg);
            //此处进行成功时候的配置
            throw new RuntimeException(return_msg);
        }
        String result_code = result.get("result_code");
        if (!PaymentKit.codeIsOK(result_code)) {
            log.error("result_code>" + result_code + " return_msg>" + return_msg);
            throw new RuntimeException(return_msg);
        }

        // 以下字段在return_code 和result_code都为SUCCESS的时候有返回
        String prepay_id = result.get("prepay_id");
        String mweb_url = result.get("mweb_url");

        log.info("prepay_id:" + prepay_id + " mweb_url:" + mweb_url);
        try {
            response.sendRedirect(mweb_url);
        } catch (IOException e) {
            e.printStackTrace();
        }
    }


    /**
     * 微信支付异步通知，如果成功，进行业务处理
     */
    @RequestMapping(value = "/pay_notify.do", method = {RequestMethod.POST, RequestMethod.GET})
    @ResponseBody
    public String pay_notify(HttpServletRequest request) {

        String xmlMsg = HttpKit.readData(request);
        System.out.println("pay notice---------" + xmlMsg);
        Map<String, String> params = PaymentKit.xmlToMap(xmlMsg);
        String appid = params.get("appid");
		//商户号
        String mch_id = params.get("mch_id");
        String result_code = params.get("result_code");
        String openId = params.get("openid");
        //交易类型
        String trade_type = params.get("trade_type");
        //付款银行
        String bank_type = params.get("bank_type");
		// 总金额
        String total_fee = params.get("total_fee");
        //现金支付金额
        String cash_fee = params.get("cash_fee");
        // 微信支付订单号
        String transaction_id = params.get("transaction_id");
		// 商户订单号
        String out_trade_no = params.get("out_trade_no");
		// 支付完成时间，格式为yyyyMMddHHmmss
        String time_end = params.get("time_end");

        /////////////////////////////以下是附加参数///////////////////////////////////

        String attach = params.get("attach");
//		String fee_type      = params.get("fee_type");
//		String is_subscribe      = params.get("is_subscribe");
//		String err_code      = params.get("err_code");
//		String err_code_des      = params.get("err_code_des");
        // 注意重复通知的情况，同一订单号可能收到多次通知，请注意一定先判断订单状态
        // 避免已经成功、关闭、退款的订单被再次更新
		//Order order = Order.dao.getOrderByTransactionId(transaction_id);
		//if (order==null) {
        WxPayApiConfigKit.setThreadLocalWxPayApiConfig(getApiConfig());
        if (PaymentKit.verifyNotify(params, WxPayApiConfigKit.getWxPayApiConfig().getPaternerKey())) {
            //查询用户支付是否成功
            if (("SUCCESS").equals(result_code)) {
                //更新订单信息
                log.warn("更新订单信息:" + attach);
                //发送通知等
                Map<String, String> xml = new HashMap<String, String>();
                xml.put("return_code", "SUCCESS");
                xml.put("return_msg", "OK");

                //执行业务操作


                //
                return PaymentKit.toXml(xml);
            }
        }
		//}

        return null;
    }

}



