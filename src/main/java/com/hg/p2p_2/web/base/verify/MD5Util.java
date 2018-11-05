package com.hg.p2p_2.web.base.verify;

import org.springframework.util.DigestUtils;

/**
 * MD5加密util
 */
public class MD5Util {

    /**
     * 创建MD5密码
     *
     * @param key 传入的明文密码
     * @return
     * @throws Exception
     */
    public static String md5(String key) {
        StringBuilder text = new StringBuilder();
        byte[] btInput = key.getBytes();
        //加密后的字符串
        StringBuilder encodeStr = DigestUtils.appendMd5DigestAsHex(btInput, text);
        //System.out.println("MD5加密后的字符串为:encodeStr="+encodeStr);
        return encodeStr.toString();
    }

    /**
     * 判断密码相等
     *
     * @param key 明文密码
     * @param md5 传入的MD5密码
     * @return
     * @throws Exception
     */
    public static boolean verify(String key, String md5) {

        //根据传入的密钥进行验证
        String md5Text = md5(key);
        if (md5Text.equalsIgnoreCase(md5)) {
            return true;
        }

        return false;
    }
}
