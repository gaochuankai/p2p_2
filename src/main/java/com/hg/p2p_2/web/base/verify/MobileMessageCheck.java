package com.hg.p2p_2.web.base.verify;

import com.alibaba.fastjson.JSON;
import com.hg.p2p_2.biz.base.util.SMSUtils;
import org.apache.http.HttpResponse;
import org.apache.http.NameValuePair;
import org.apache.http.client.entity.UrlEncodedFormEntity;
import org.apache.http.client.methods.HttpPost;
import org.apache.http.impl.client.CloseableHttpClient;
import org.apache.http.impl.client.HttpClients;
import org.apache.http.message.BasicNameValuePair;
import org.apache.http.util.EntityUtils;

import java.io.IOException;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

/**
 * 手机信息检查
 */
public class MobileMessageCheck {

    public static void main(String[] args) throws Exception {
        System.out.println(checkMsg("*****", "123456"));
    }

    /**
     * @param phone    手机号
     * @param authCode 验证码
     * @return
     * @throws IOException
     */
    public static String checkMsg(String phone, String authCode) throws IOException {
        CloseableHttpClient httpclient = HttpClients.createDefault();
        HttpPost post = new HttpPost(SMSUtils.WY_SERVER_URL);


        String curTime = String.valueOf((new Date().getTime() / 1000L));
        String checkSum = CheckSumBuilder.getCheckSum(SMSUtils.WY_APP_SECRET, SMSUtils.WY_NONCE, curTime);


        //设置请求的header
        post.addHeader("AppKey", SMSUtils.WY_APP_KEY);
        post.addHeader("Nonce", SMSUtils.WY_NONCE);
        post.addHeader("CurTime", curTime);
        post.addHeader("CheckSum", checkSum);
        post.addHeader("Content-Type", "application/x-www-form-urlencoded;charset=utf-8");


        //设置请求参数
        List<NameValuePair> nameValuePairs = new ArrayList<NameValuePair>();
        /*设置验证码*/
        nameValuePairs.add(new BasicNameValuePair("authCode", authCode));
        /*启用短信模板*/
        nameValuePairs.add(new BasicNameValuePair("templateid", SMSUtils.WY_TEMPLATEID));
        /*手机号*/
        nameValuePairs.add(new BasicNameValuePair("mobile", phone));
        /*验证码长度*/
        nameValuePairs.add(new BasicNameValuePair("codeLen", SMSUtils.WY_CODELEN));

        post.setEntity(new UrlEncodedFormEntity(nameValuePairs, "utf-8"));


        //执行请求
        HttpResponse response = httpclient.execute(post);
        String responseEntity = EntityUtils.toString(response.getEntity(), "utf-8");


        //判断是否发送成功，发送成功返回true
        String code = JSON.parseObject(responseEntity).getString("code");
        if (code.equals("200")) {
            return "success";
        }
        return "error";
    }
}
