package com.hg.p2p_2.web.base.alipay;

/**
 * AppPayConfig
 */
public class AliPayConfig {

    // APPID
    public static String app_id = "2016092000558683";

    // 应用私钥
    public static String marchant_private_key = "MIIEvQIBADANBgkqhkiG9w0BAQEFAASCBKcwggSjAgEAAoIBAQCdfO3SAUHo31thh2fWxVYVM4RzDmAgbrfN4rBmci0TKDszhDRXnTNEEd23tUAxEiFpF7T5u9FS4A34NBoeZCfAzcVyYku52RSD9plvtSoxh27I0FvQqwlQxQHOMLR+bfqxn1ozNQsjB3RvsWga8bErnY+REV4L1qZCsbOLpsVIpNpUQX58fPbwhRpyMOJaiJvMoZWq3rmFXa5qD5t/xCPAuiZQnG8V5HbRpG36XDEIJfyS4ZwWCgO6J7EfLhl+o7JXvWTGuC/JQoMXLke/JZpANt82/cHoW1WeB0xNj7mKmenP5171vgU9ONCGDDKUNt6A3kU6krfI3g8L6SVpHWPhAgMBAAECggEAZQ9Q8S0bZVtHIYuph7l0JwC7IrX723QRAM5SEjt8T0nGy6UvjXVz+19XntZxjcurouuyl3r9tSfP7xFIHW550BB7fo4zN9xkfNYW2gcwPz5ASh7ifEH1JV52bSD2AheDAs5WLHwCXIUhI7d9LaUg4vMluJqjdgdVA4FSzO/Es3sMOZeUBaJlZ8ahelMWhj8FvExSJaAS0JXpZ2NoRCQXGush1ajWtHz7tVfvchHEThYWSYiiuOed66Ge7D+Pb4XSThgpbG6Um95jh4fe+dtdmHLAD9RLqfH3IpSr/ayeuMi3RYWSE+gjmgCXcWHyyYASGpOoQd7j1pUXLr1m1338UQKBgQDQhspA7D/Y4ms74cyShxMDEBRwwkonY6WFMogdnGUumfLdwzfg5CGi2dPWLKNtJQuvq8KO9UcP4i4htNJ3zh2t3E9aghT0Vpgu/Y0c0ri4/SE7gbIC24nkqiqXpGnNmrq7m9aI+Z+zdldN4Ihu0+hda2lvuREQWt4ojvQ0rVqLfQKBgQDBV4thJ4XlgmkFRGONRNNGEDuPVq98bTWQmemudIN3sV80b2cfPvEe1uQV8BVD16TknKsclIudPqOvC7KwAZxEe/NUcBaooeorWjmmjr19qEC3SZLMyZ3xRNLuoj3PzibaA9l38iJNspKWEjf+00y/VybQhGcxxziay0KE37H/NQKBgFxSAMNjlRTZkW5OlrqcsK8fdF1Dt37e4A4rhBXQAv/xypOh9WBMwBOQavgchTIyP41D9vxB3XdLxO7JVpESIROzQTKp+sr+d5v+R3ZmWMAV2Zu13PDk75TcPcUrVmhfw6KB6SZ1ld3nW9mvudePXAXYIzMCdWqPQGImgDm+MiMlAoGAeMWg0R2JLGacB6hCr3owp3F4Yv95OzZU4XDjYhByFxB7MhvsxL3ijKsbawC/p9NKs2uSD5ZS5/S69ptOEVfQL49l3nbuEISj7FS98mbzw0yYsGWLB9Vhjda6FErQZcCW0FTbQWvFNde4bXoP9GQ1asib/GDYvWV+3GLfuHSrkYkCgYEAsJ4o1NHmM8ekjpLR+F8lUoNPgeaxJgRRAiY7GnOk/Qz2/Gu5hY7ci+4GYgQBoOK5nBKPs2YU+dPYQmBxIMuUiCUIzMhKsATsCPqs2Fnag8eZTr/mKN1nz6yTSmouPz4ELXuxo+ypJQ+pBw1aGH81Gyuyu8Zva+/QfgozwIrcX1o=";

    //支付宝公钥
    public static String alipay_public_key = "MIIBIjANBgkqhkiG9w0BAQEFAAOCAQ8AMIIBCgKCAQEA82jTnt4UcQ7bGql8hPLyA5cOcJrzcxzx4jkArnPIKk3nIitSxI+I2Uo5+zpC5i41bHDJvdtiC9oJzGpksAVJCm/qA705VzUkEp4zyUBCCoCVlRztv2sM4d0O/XAv+Plyc0U7NZ7AgB4FSZ/OdxtAAbpD8+ZmVAFX3rWo7VRHoZ1/Rt6l1F7tDmPVL3V2L6+KiBaTgGiI4xrLdP4dWYtWzhXy+8UhwJG5Ogjbj8bwnfjBD8e79mV5ab0nO56aRpfNUyrq36Lso6fpyJpjkte+Ycv9rfUK+oOfLBns6qE0TwOYHM9GCIGkiZh9ZS7DW2btu/ntm9uKKmr/CPTeOnr2zQIDAQAB";

    // 支付宝网管
    public static String gateway_url = "https://openapi.alipaydev.com/gateway.do";

    // 服务器异步通知页面；必须外网正常访问
    // 家里联通112.65.1.81
    public static String notify_url = "http://39.104.138.102:8080/springboot/front/pay/notifyPage";

    // 服务器同步通知页面；必须外网正常访问
    public static String return_url = "http://39.104.138.102:8080/springboot/front/pay/returnFun";

    //签名方式
    public static String sign_type = "RSA2";

    //字符编码格式
    public static String charset = "UTF-8";

}
