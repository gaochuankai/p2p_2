<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="dynamicURL" value="${pageContext.request.contextPath }"></c:set>

<!--head-->
<div class="top">
    <div class="wrap clearfix">
        <em class="myfont">&#xe632;</em>
        <span class="songti">服务热线：</span>
        <span class="tel">400-121-8232</span>
        <a href="#" target="_blank" class="ico weibo"></a>
        <a href="#" target="_blank" class="ico weixin"></a>
        <a href="#" target="_blank" class="ico qq"></a>
        
        <c:if test="${sessionScope.loginUser!=null }">		
        	<span class="fr"><span style="font-size: 15px">欢迎:</span><font color="red">${loginUser.username}</font>
	           			<span style="font-size: 15px">登录</span>
	           			&nbsp;
	           			<a href="#" onclick="loginout();">退&nbsp;出</a>&nbsp;
	            <a href="about.html">帮助中心</a>
        	</span>
        </c:if>
        <c:if test="${sessionScope.loginUser==null }">
	        <span class="fr"><a href="javascript:;" class="loginbtn">登录</a>
	            <a href="javascript:;" class="o regbtn">免费注册</a>
	            <a href="about.html">帮助中心</a>
	        </span>
	       </c:if>
    </div>
</div>
<div class="head">
    <div class="wrap pct-h clearfix">
        <a href="index.html" class="logo indent">logo</a>
        <div class="adtxt indent">有钱没钱，找十七金融</div>
        <ul class="nav">
            <li><a href="index.html">首页</a></li>
            <li><a href="invest.html">我要投资</a></li>
            <li><a href="borrow.html">我要借款</a></li>
            <li><a href="about.html">关于我们</a></li>
        </ul>
    </div>
</div>
<script type="text/javascript">

    function loginout(){
        layer.confirm("确定要退出系统吗？", {btn: ['确定', '取消'], title: ""}, function(){
            var url = "${dynamicURL }/login/logout";
            $.post(url,function () {
                window.location.href = "${dynamicURL }/login";
            });
        });
    }

</script>