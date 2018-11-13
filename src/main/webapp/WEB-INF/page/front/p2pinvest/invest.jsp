<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="dynamicURL" value="${pageContext.request.contextPath }"></c:set>

<!--main-->
<div class="wrap mt10 clearfix">
  <div class="bg-w pd20 bdr">
    <!--invest-->
    <div class="crumbs" style="margin-bottom:20px;"><span>净值标</span><a href="#" class="ico Prompt indent loginbtn">您尚未登录</a></div>
    <p class="f14">每天固定时间发布新项目，首次投资可前往“<span class="o">净值标</span>”投资新手专享项目，抢债权可前往“<span class="o">转让区</span>”</p>
  </div> 
  
  <div class="invest mt20 clearfix">
    <div class="item mark bdr">
      <div class="bd">
        <div class="title"><em class="ico"></em>净值标</div>
        <ul class="list">
          <li>一次性加入，省去每天投资烦恼</li>
          <li>多种期限可选，满足不同流动性需求</li>
          <li class="o">每月返还收益，到期返还本金</li>
          <li>1000元即可加入，期限内可随时赎回</li>
        </ul>
        <a href="${root }/index/investlist.action" class="ico more">查看更多</a>
      </div>
      <div class="bottom">97,781人已加入，完成4,252,686,000元投资额</div>
    </div>
    <div class="item Credit mid bdr">
      <div class="lj indent">ico</div>
      <div class="lj lj_l indent">ico</div>
      <div class="bd">
        <div class="title"><em class="ico"></em>信用标</div>
        <ul class="list">
          <li>享受每天自主投资乐趣</li>
          <li>年化收益率可达13.24%，是银行的30倍</li>
          <li class="o">每月还本付息，月月都有现金流</li>
          <li>50元即可体验，期限内可随时赎回</li>
        </ul>
        <a href="invest-list.html" class="ico more">查看更多</a>
      </div>
      <div class="bottom">97,781人已加入，完成4,252,686,000元投资额</div>
    </div>
    <div class="item claims bdr">
      <div class="bd">
        <div class="title"><em class="ico"></em>债权转让</div>
        <ul class="list">
          <li>一次性加入，省去每天投资烦恼</li>
          <li>多种期限可选，满足不同流动性需求</li>
          <li class="o">每月返还收益，到期返还本金</li>
          <li>1000元即可加入，期限内可随时赎回</li>
        </ul>
        <a href="invest-list.html" class="ico more">查看更多</a>
      </div>
      <div class="bottom">97,781人已加入，完成4,252,686,000元投资额</div>
    </div>
  </div>
  
  <div class="ad img mt20"><img src="${root }/images/ad.jpg"></div>
   
</div>