<%@ page language="java" contentType="text/html; UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN"
"http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="dynamicURL" value="${pageContext.request.contextPath }"></c:set>


<div class="container login">
    <div class="span12">
        <div class="ad">
            <img src="${dynamicURL}/image/login.jpg" width="500" height="330" alt="会员登录" title="会员登录">
        </div>
    </div>
    <div class="span12 last">
        <div class="wrap">
            <div class="main">
                <div class="title">
                    <strong>会员登录</strong>USER LOGIN
                    <strong>| <a href="${dynamicURL}/login/toLoginByTelPage">手机号登录</a></strong>
                </div>
                <form id="loginForm" method="post" novalidate="novalidate">
                    <%--action="${dynamicURL}/login/loginByUN">--%>
                    <table>
                        <tbody>
                        <tr>
                            <th>
                                用户名/E-mail:
                            </th>
                            <td>
                                <input type="text" id="username" name="username" class="text" maxlength="40">
                                <span id="usernameFromSpanId"></span>
                            </td>
                        </tr>
                        <tr>
                            <th>
                                密&nbsp;&nbsp;码:
                            </th>
                            <td>
                                <input type="password" id="password" name="password" class="text" maxlength="20"
                                       autocomplete="off" />
                                <span id="passwordFromSpanID"></span>
                            </td>
                        </tr>
                        <tr>
                            <th>
                                验证码:
                            </th>
                            <td>
                                <span class="fieldSet">
                                    <input type="text" id="captcha" name="captcha" class="text captcha"
                                           maxlength="4" autocomplete="off"/>
                                    <img id="captchaImage" class="captchaImage" src="${dynamicURL}/code"
                                         style="width: 76px;height: 30px" title="点击更换验证码" onclick="createCode()"/>
                                </span>
                                <span id="codeFromSpanId"></span>
                            </td>
                        </tr>
                        <tr>
                            <th>&nbsp;
                            </th>
                            <td>
                                <label>
                                    <input type="checkbox" id="isRememberUsername" name="isRememberUsername"
                                           value="1"/>记住用户名
                                </label>
                                <label>
                                    &nbsp;&nbsp;<a href="${dynamicURL }/forget">找回密码</a>
                                </label>
                            </td>
                        </tr>
                        <tr>
                            <th>&nbsp;
                            </th>
                            <td>
                                <input type="submit" class="submit" value="登 录" id="login"/>
                            </td>
                        </tr>
                        <tr class="register">
                            <th>&nbsp;
                            </th>
                            <td>
                                <dl>
                                    <dt>还没有注册账号？</dt>
                                    <dd>
                                        立即注册即可体验在线购物！
                                        <a href="${dynamicURL }/register">立即注册</a>
                                    </dd>
                                </dl>
                            </td>
                        </tr>
                        </tbody>
                    </table>
                </form>
            </div>
        </div>
    </div>
</div>

<script type="text/javascript">
    var usernameFlag = false;
    var passswordFalg = false;
    var codeFlag = false;

    $(function () {

        /**
         * 验证登录名（用户名或者是邮箱）
         */
        $("#username").keyup(function () {
            var value = $("#username").val();
            // 用户名格式
            var reg = /^[A-Za-z0-9-_]*$/;
            //验证邮箱格式的js正则表达式
            var isEmail = /\w[-\w.+]*@([A-Za-z0-9][-A-Za-z0-9]+\.)+[A-Za-z]{2,14}/g;
            if (reg.test(value) || isEmail.test(value)) {
                $.ajax({
                    url: "${dynamicURL }/login/checkLoginName?loginName=" + value,//请求路径
                    type: "POST",//请求类型
                    dataType: "JSON",//服务器响应数据类型
                    //data: {"logingName": name},//参数
                    success: function (data) {
                        if (data.success) {
                            usernameFlag = true;
                            $("#usernameFromSpanId").html("");
                        } else {
                            usernameFlag = false;
                            $("#usernameFromSpanId").html(data.errorMsg);
                        }
                    },//请求成功后回调
                    error: function (data) {

                    }//请求失败后回调
                });
            } else {
                $("#usernameFromSpanId").html("格式不正确");
            }
        });

        //passwordFromSpanID
        $("#password").keyup(function () {
            var value = $("#password").val();
            if(value == undefined || value == '' || value == null){
                passswordFalg = false;
                $("#passwordFromSpanID").html("密码不能为空！");
            }else{
                passswordFalg = true;
                $("#passwordFromSpanID").html("");
            }
        });

        $("#captcha").keyup(function () {
            var value = $("#captcha").val();
            $.ajax({
                url: "${dynamicURL }/login/checkCode?code=" + value,//请求路径
                type: "POST",//请求类型
                dataType: "JSON",//服务器响应数据类型
                //data: [{"code": value}],//参数
                success: function (data) {
                    if (data.success) {
                        codeFlag = true;
                        $("#codeFromSpanId").html("");
                    } else {
                        codeFlag = false;
                        $("#codeFromSpanId").html("验证码不正确！");
                    }
                },//请求成功后回调
                error: function (data) {

                }//请求失败后回调
            });
        });

        $("#login").click(function (e) {
            if(!(!usernameFlag || !passswordFalg || !codeFlag)){
                $("#loginForm").ajaxForm(function () {
                    var username = $("#username").val();
                    var password = $("#password").val();
                    var remenber = $("#isRememberUsername").val();
                    var inputcode = $("#captcha").val();
                    $.ajax({
                        type: 'post',
                        url: '${dynamicURL}/login/loginByUN',
                        dataType: 'json',
                        data: {
                            "username": username,
                            "password": password,
                            "saveUserName": remenber,
                            "code": inputcode
                        },
                        success: function (data) {
                            if(data.success){
                                window.location.href = "${dynamicURL }/front/main";
                            }else{
                                layer.confirm("登录失败！"+data.errorMsg, {
                                    btn: ['找回密码', '重新登录'],
                                    title: ""
                                }, function(index, layero){
                                    window.location.href = "${dynamicURL }/forget";
                                },function (index) {
                                    window.location.href = "${dynamicURL }/login";
                                });
                            }
                        }
                    });
                });
            }else{
                layer.alert("请正确填写信息");
                if(!telFlag){
                    return false;
                }
                return false;
            }
        });
    });

    //获取验证码
    function createCode() {
        var imgSrc = $("#captchaImage");
        var src = imgSrc.attr("src");
        imgSrc.attr("src", chgUrl(src));
    }

    //时间戳
    //为了使每次生成图片不一致，即不让浏览器读缓存，所以需要加上时间戳
    function chgUrl(url) {
        var timestamp = (new Date()).valueOf();
        urlurl = url.substring(0, 35);
        if ((url.indexOf("&") >= 0)) {
            urlurl = url + "×tamp=" + timestamp;
        } else {
            urlurl = url + "?timestamp=" + timestamp;
        }
        return urlurl;
    }
</script>

