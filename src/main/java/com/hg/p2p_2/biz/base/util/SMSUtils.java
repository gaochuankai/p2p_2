package com.hg.p2p_2.biz.base.util;

public class SMSUtils {

    /**
     * 网易云短信接口参数-start
     * -----------------------------------------------------------------------------------------------------------------
     */
    public static final String WY_SERVER_URL = "https://api.netease.im/sms/sendcode.action";//发送验证码的请求路径URL
    public static final String WY_APP_KEY = "b40c906d391d43a830a99bef2f747462";//网易云信分配的账号
    public static final String WY_APP_SECRET = "36bd4973b973";//网易云信分配的密钥
    public static final String WY_NONCE = "123456";//随机数
    //短信模板ID
    public static final String WY_TEMPLATEID = "9384079";
    //验证码长度，范围4～10，默认为4
    public static final String WY_CODELEN = "6";
    /**
     * -----------------------------------------------------------------------------------------------------------------
     * 网易云短信接口参数-end
     */

}
