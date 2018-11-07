<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="dynamicURL" value="${pageContext.request.contextPath }"></c:set>

<!--Partner-->
<div class="Partner mt10">
    <div class="wrap clearfix">
        <div class="hd fl">
            <b>合作伙伴</b>
            <span class="en">Partners</span>
        </div>
        <div class="bd fr">
            <div id="Marquee_x">
                <ul>
                    <li>
                        <a href="http://www.cardanro.com.cn" target="_blank" class="img">
                            <img src="${dynamicURL}/folder/upload/logo_03.jpg">
                        </a>
                        <a href="http://www.hsbank.com.cn" target="_blank" class="img">
                            <img src="${dynamicURL}/folder/upload/logo_06.jpg">
                        </a>
                        <a href="http://www.hongren.com.cn" target="_blank" class="img">
                            <img src="${dynamicURL}/folder/upload/logo_08.jpg">
                        </a>
                        <a href="http://www.boc.cn" target="_blank" class="img">
                            <img src="${dynamicURL}/folder/upload/logo_11.jpg">
                        </a>
                        <a href="http://www.xtep.com" target="_blank" class="img">
                            <img src="${dynamicURL}/folder/upload/logo_14.jpg">
                        </a>
                        <a href="http://www.edenbo.com" target="_blank" class="img">
                            <img src="${dynamicURL}/folder/upload/logo_17.jpg">
                        </a>
                        <a href="http://www.ayilian.com" target="_blank" class="img">
                            <img src="${dynamicURL}/folder/upload/logo_19.jpg">
                        </a>
                        <a href="http://www.tonlion.com" target="_blank" class="img">
                            <img src="${dynamicURL}/folder/upload/logo_22.jpg">
                        </a>
                        <a href="http://mall.jd.com/index-34890.html" target="_blank" class="img">
                            <img src="${dynamicURL}/folder/upload/logo_25.jpg">
                        </a>
                        <a href="http://www.cmbc.com.cn" target="_blank" class="img">
                            <img src="${dynamicURL}/folder/upload/logo_28.jpg">
                        </a>
                        <a href="http://itisf4.tmall.com" target="_blank" class="img">
                            <img src="${dynamicURL}/folder/upload/logo_31.jpg">
                        </a>
                        <a href="http://www.cebbank.com" target="_blank" class="img">
                            <img src="${dynamicURL}/folder/upload/logo_33.jpg">
                        </a>
                    </li>
                </ul>
            </div>
        </div>
    </div>
</div>
<!--foot-->
<div class="foot">
    <div class="wrap clearfix">
        <div class="footsection fl">
            <a href="about.html">关于我们</a> |
            <a href="news.html">网站公告</a> |
            <a href="reports.html">媒体报道</a> |
            <a href="partners.html">合作伙伴</a> |
            <a href="#">安全保障</a> |
            <a href="#">本金保障</a> |
            <a href="#">帮助中心</a> |
            <a href="#">如何投资</a> |
            <a href="#">如何借款</a>
            <p class="mt10">Copyright 2014 十七贷款, All Rights Reserved 版权所有 沪ICP备00000000号</p>
            <div class="img mt15 clearfix">
                <a href="#" target="_blank"><img src="${dynamicURL}/folder/images/img1.jpg"></a>
                <a href="#" target="_blank"><img src="${dynamicURL}/folder/images/img2.jpg"></a>
                <a href="#" target="_blank"><img src="${dynamicURL}/folder/images/img3.jpg"></a>
                <a href="#" target="_blank"><img src="${dynamicURL}/folder/images/img4.jpg"></a>
                <a href="#" target="_blank"><img src="${dynamicURL}/folder/images/img5.jpg"></a>
            </div>
        </div>
        <div class="footaside fr">
            热线电话 (服务时间 09:00 - 21:00 )
            <p><span class="tel">400-601-6629</span><a href="#" target="_blank">在线客服<em class="ico"></em></a></p>
            关注我们 <a href="#" target="_blank" class="ico weibo"></a> <a href="#" target="_blank"
                                                                       class="ico weixin"></a><a href="#"
                                                                                                 target="_blank"
                                                                                                 class="ico qq"></a>
        </div>
    </div>
</div>

<div class="Pop-up">
    <div class="pop-bd">
        <div class="hand">
            <div class="myfont close">&#xe611;</div>
        </div>
        <div class="bd" id="form1">
            <div class="hd">会员登录</div>
            <div class="txt"><h1>为您提供简单、安全、高收益的理财服务</h1>优先选择有担保的优质债权 足值抵押物可以降低风险 分散投资，更能降低风险</div>
            <div class="form">
                <form id="form11" method="post" novalidate="novalidate">
                    <label><span>手机号</span>
                    <input type="text" class="form-control first" value="" name="telphone"
                                                  id="telphone"></label>
                    <label>
                    	<span>密码</span>
                    	<input type="password" class="form-control last" value="" name="password" id="password">
                    </label>
                    <button type="button" value="" class="button login" id="login">登录</button>
                    <div class="mt15"><a href="javascript:;" id="btnreg">没有帐号？</a>&nbsp;|&nbsp;<a href="#">忘记密码？</a>
                    </div>
                </form>
            </div>
        </div>
        <div class="bd none" id="form2">
            <div class="hd">会员注册</div>
            <div class="txt">
                <h1>为您提供简单、安全、高收益的理财服务</h1>
                优先选择有担保的优质债权 足值抵押物可以降低风险 分散投资，更能降低风险
            </div>
            <div class="form">
            	<form id="form22" method="post" novalidate="novalidate">
	                <label><span>用户名</span><input type="text" class="form-control first" value="" name="username" id="username0"></label>
	                <label><span>手机</span><input type="text" class="form-control" value="" name="telephone0" id="telephone0"></label>
	                <label><span>密码</span><input type="password" class="form-control" value="" name="password" id="password0"></label>
	                <label><span>确认密码</span><input type="password" class="form-control" value="" name="repassword" id="repassword0"></label>
	                <!-- <button type="button" value="" class="button login" id="reg"
	                        onclick="window.location.href='member.html'">注册
	                </button> -->
	                <label><input type="text" class="form-control last" value="" name="valider" id="valider" readonly="readonly"></label>
	                 <button type="button" value="" class="button login" id="reg">注册</button>
	             </form>
                <div class="mt15"><a href="javascript:;" id="btnlogin">直接登录</a>&nbsp;|&nbsp;<a href="#">忘记密码？</a></div>
            </div>
        </div>
    </div>
</div>

<script>
	//定义手机号是否被注册变量
    var telFlag = false;

    $(function () {
        $('#Marquee_x').jcMarquee({'marquee': 'x', 'margin_right': '10px', 'speed': 20});
        $(".loginbtn").click(function () {
            $(".Pop-up").show();
            $(".pop-bd").slideDown(500);
            $("#form2").hide().siblings("#form1").show();
        });
        $(".regbtn").click(function () {
            $(".Pop-up").show();
            $(".pop-bd").slideDown(500);
            $("#form1").hide().siblings("#form2").show();
        });
        $("#btnreg").click(function () {
            $(this).parents("#form1").hide().siblings("#form2").show();
        });
        $("#btnlogin").click(function () {
            $(this).parents("#form2").hide().siblings("#form1").show();
        });
        $(".close").click(function () {
            $(this).parents(".Pop-up").hide().find(".pop-bd").hide()
        });

        $(".form .form-control").each(function () {
            var thisVal = $(this).val();
            if (thisVal != "") {
                $(this).siblings("span").hide();
            }
            else {
                $(this).siblings("span").show();
            }
            $(this).focus(function () {
                $(this).siblings("span").hide().parents("label").css("z-index", "10009").siblings("label").css("z-index", "10008");
            }).blur(function () {
                var val = $(this).val();
                if (val != "") {
                    $(this).siblings("span").hide().siblings("label").css("z-index", "10008");
                }
                else {
                    $(this).siblings("span").show().siblings("label").css("z-index", "10008");
                }
            });
        });
		/**
		         注册手机验证
		*/
		$("#telephone0").keyup(function () {
            var value = $("#telephone0").val();
            //验证手机号格式的js正则表达式
            var myreg = /^[1][3,4,5,7,8][0-9]{9}$/;
            if (myreg.test(value)) {
                $.ajax({
                    url: "${dynamicURL }/login/checkTel?telphone=" + value,//请求路径
                    type: "POST",//请求类型
                    dataType: "JSON",//服务器响应数据类型
                    //data: {"logingName": name},//参数
                    success: function (data) {
                    	console.log(data);
                        if (!data.success) {
                            telFlag = true;
                            $("#telphoneFromSpanId").html("");
                        } else {
                            telFlag = false;
                            $("#telphoneFromSpanId").html(data.errorMsg);
                        }
                    },//请求成功后回调
                    error: function (data) {

                    }//请求失败后回调
                });
            } else {
                $("#telphoneFromSpanId").html("格式不正确");
            }
        });
        /**
         * 手机号验证
         */
        $("#telphone").keyup(function () {
            var value = $("#telphone").val();
            //验证手机号格式的js正则表达式
            var myreg = /^[1][3,4,5,7,8][0-9]{9}$/;
            if (myreg.test(value)) {
                $.ajax({
                    url: "${dynamicURL }/login/checkTel?telphone=" + value,//请求路径
                    type: "POST",//请求类型
                    dataType: "JSON",//服务器响应数据类型
                    //data: {"logingName": name},//参数
                    success: function (data) {
                        if (data.success) {
                            telFlag = true;
                            $("#telphoneFromSpanId").html("");
                        } else {
                            telFlag = false;
                            $("#telphoneFromSpanId").html(data.errorMsg);
                        }
                    },//请求成功后回调
                    error: function (data) {

                    }//请求失败后回调
                });
            } else {
                $("#telphoneFromSpanId").html("格式不正确");
            }
        });
        //点击注册
        $('#reg').click(function () {
            if (telFlag) {
            	var username0=$("#username0").val();
        		var telephone0=$("#telephone0").val();
        		var password0=$("#password0").val();
        		var repassword0=$("#repassword0").val();
        		if (username0==null) {
        			$("#valider").val("用户名不能为空！");
        			return false;
        		}
        		if (telephone0==null) {
        			$("#valider").val("用户名不能为空！");
        			return false;
        		}
        		if (password0==null) {
        			$("#valider").val("用户名不能为空！");
        			return false;
        		}
        		if (repassword0==null) {
        			$("#valider").val("用户名不能为空！");
        			return false;
        		}
        		if (repassword0!=password0) {
        			$("#valider").val("两次输入的密码不一致！");
        			return false;
        		}
        		
                var options = {
                    type: 'post',                     //post提交
                    url: '${dynamicURL}/register/register',     //url
                    dataType: "json",                //json格式
                    data: {
                        "username": username0,
                        "telephone": telephone0,
                        "password": password0
                    },        //如果需要提交附加参数，视情况添加
                    clearForm: true,                //成功提交后，清除所有表单元素的值
                    resetForm: true,                //成功提交后，重置所有表单元素的值
                    cache: false,
                    async: false,                    //同步返回
                    success: function (data) {
                        //服务器端返回处理逻辑
                        if (data.success) {
                            window.location.href = "${dynamicURL }/login";
                        } else {
                            layer.confirm("注册失败！", {
                                btn: ['取消', '重新注册'],
                                title: ""
                            }, function (index, layero) {
                                window.location.href = "${dynamicURL }/login";
                            }, function (index) {
                                window.location.href = "${dynamicURL }/reg";
                            });
                        }
                    },
                    error: function (XmlHttpRequest, textStatus, errorThrown) {
                        alert(errorThrown);
                    }
                };
                $("#form22").ajaxSubmit(options);
            } else {
                if (!telFlag) {
                    layer.msg('电话格式不正确！');
                    return false;
                }
                return false;
            }
        });
		//点击登录
        $('#login').click(function () {
            if (telFlag) {
                var telphone = $("#telphone").val();
                var password = $("#password").val();
                var options = {
                    type: 'post',                     //post提交
                    url: '${dynamicURL}/login/login',     //url
                    dataType: "json",                //json格式
                    data: {
                        "username": telphone,
                        "password": password
                    },        //如果需要提交附加参数，视情况添加
                    clearForm: true,                //成功提交后，清除所有表单元素的值
                    resetForm: true,                //成功提交后，重置所有表单元素的值
                    cache: false,
                    async: false,                    //同步返回
                    success: function (data) {
                        //服务器端返回处理逻辑
                        if (data.success) {
                            window.location.href = "${dynamicURL }/front/main";
                        } else {
                            layer.confirm("登录失败！", {
                                btn: ['找回密码', '重新登录'],
                                title: ""
                            }, function (index, layero) {
                                window.location.href = "${dynamicURL }/forget";
                            }, function (index) {
                                window.location.href = "${dynamicURL }/login";
                            });
                        }
                    },
                    error: function (XmlHttpRequest, textStatus, errorThrown) {
                        alert(errorThrown);
                    }
                };
                $("#form11").ajaxSubmit(options);
            } else {
                if (!telFlag) {
                    layer.msg('电话格式不正确！');
                    return false;
                }
                return false;
            }
        });
    });
</script>