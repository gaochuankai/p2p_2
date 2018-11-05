<%@ page language="java" contentType="text/html; UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN"
"http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="dynamicURL" value="${pageContext.request.contextPath }"></c:set>

<link href="${dynamicURL}/css/index.css" rel="stylesheet" type="text/css"/>

<div class="container index">
    <div class="span24">
        <div id="hotProduct" class="hotProduct clearfix">
            <div class="title">
                <strong>热门商品</strong>
                <!-- <a  target="_blank"></a> -->
            </div>
            <ul class="tab">
                <li class="current">
                    <a href="${dynamicURL}/蔬菜分类.htm?tagIds=1" target="_blank"></a>
                </li>
                <li>
                    <a target="_blank"></a>
                </li>
                <li>
                    <a target="_blank"></a>
                </li>
            </ul>
            <ul class="tabContent" style="display: block;" id="hostList"></ul>
        </div>
    </div>
    <div class="span24">
        <div id="newProduct" class="newProduct clearfix">
            <div class="title">
                <strong>最新商品</strong>
                <a target="_blank"></a>
            </div>
            <ul class="tab">
                <li class="current">
                    <a href="./蔬菜分类.htm?tagIds=2" target="_blank"></a>
                </li>
                <li>
                    <a target="_blank"></a>
                </li>
                <li>
                    <a target="_blank"></a>
                </li>
            </ul>
            <ul class="tabContent" style="display: block;" id="newestList">
                <%--<li>--%>
                    <%--<a target="_blank"><img src="./image/l.jpg"--%>
                                            <%--data-original="http://storage.shopxx.net/demo-image/3.0/201301/4a51167a-89d5-4710-aca2-7c76edc355b8-thumbnail.jpg"--%>
                                            <%--style="display: block;"></a></li>--%>
            </ul>
        </div>
    </div>
    <div class="span24">
        <div class="friendLink">
            <dl>
                <dt>新手指南</dt>
                <dd>
                    <a target="_blank">支付方式</a>
                    |
                </dd>
                <dd>
                    <a target="_blank">配送方式</a>
                    |
                </dd>
                <dd>
                    <a target="_blank">售后服务</a>
                    |
                </dd>
                <dd>
                    <a target="_blank">购物帮助</a>
                    |
                </dd>
                <dd>
                    <a target="_blank">蔬菜卡</a>
                    |
                </dd>
                <dd>
                    <a target="_blank">礼品卡</a>
                    |
                </dd>
                <dd>
                    <a target="_blank">银联卡</a>
                    |
                </dd>
                <dd>
                    <a target="_blank">亿家卡</a>
                    |
                </dd>
                <dd class="more">
                    <a>更多</a>
                </dd>
            </dl>
        </div>
    </div>
</div>

<script type="text/javascript">
    $(function () {
        findHostList();
        findNewestList();
    });

    /**
     * 查询最新的信息
     */
    function findNewestList() {
        $.ajax({
            url: "${dynamicURL }/front/main/list?contentType=2",//请求路径
            type: "POST",//请求类型
            dataType: "JSON",//服务器响应数据类型
            //data: [{"code": value}],//参数
            success: function (data) {
                if (data.success) {
                    //newestList
                    var str = "";
                    $.each(data.datas, function(index,element){
                        str += '<li>';
                        str += '    <a href="${dynamicURL}/front/goods/detail?goodsId='+element.goods_id+'">';
                        str += '        <img src="${dynamicURL}/'+element.goodsEntity.titleimage+'" style="display: block;"';
                        str += "            data-original=\"http://storage.shopxx.net/demo-image/3.0/201301/0ff130db-0a1b-4b8d-a918-ed9016317009-thumbnail.jpg\" />";
                        str += "    </a>";
                        str += "</li>";
                    });
                    $("#newestList").html(str);
                }
            },//请求成功后回调
            error: function (data) {

            }//请求失败后回调
        });
    }

    /**
     * 查询热门信息
     */
    function findHostList() {
        $.ajax({
            url: "${dynamicURL }/front/main/list?contentType=1",//请求路径
            type: "POST",//请求类型
            dataType: "JSON",//服务器响应数据类型
            //data: [{"code": value}],//参数
            success: function (data) {
                if (data.success) {
                    var str = "";
                    $.each(data.datas, function(index,element){
                        str += '<li>';
                        str += '    <a href="${dynamicURL}/front/goods/detail?goodsId='+element.goods_id+'">';
                        str += '        <img src="${dynamicURL}/'+element.goodsEntity.titleimage+'" style="display: block;"';
                        str += "            data-original=\"http://storage.shopxx.net/demo-image/3.0/201301/0ff130db-0a1b-4b8d-a918-ed9016317009-thumbnail.jpg\" />";
                        str += "    </a>";
                        str += "</li>";
                    });
                    $("#hostList").html(str);
                }
            },//请求成功后回调
            error: function (data) {

            }//请求失败后回调
        });
    }

</script>

