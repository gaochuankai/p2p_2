<%@ page language="java" contentType="text/html; UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN"
"http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="dynamicURL" value="${pageContext.request.contextPath }"></c:set>

<link href="${dynamicURL}/css/product.css" rel="stylesheet" type="text/css"/>
<link href="${dynamicURL}/css/paging.css" rel="stylesheet" type="text/css"/>
<script type="text/javascript" src="${dynamicURL}/js/paging.js"></script>

<div class="container productList">
    <div class="span6">
        <div class="hotProductCategory" id="hotProductCategoryList"></div>
    </div>
    <div class="span18 last">
        <div id="result" class="result table clearfix"></div>
        <div class="pagger-box pagger" id="box"></div>
    </div>
</div>

<script type="text/javascript">
    var setTotalCount = 0;
    var cun = 1;
    var count = 1;

    function wocao(data) {
        $('#box').paging({
            initPageNo: 1, // 初始页码
            totalPages: data.end, //总页数
            totalCount: '合计' + setTotalCount + '条数据', // 条目总数
            slideSpeed: 600, // 缓动速度。单位毫秒
            jump: true, //是否支持跳转
            callback: function (page) { // 回调函数s
                if (cun != page) {
                    // 此处刷新页面
                    updatePageData(page);
                    cun = page;
                }
            }
        });
    }

    $(function () {
        categoryList();
        updatePageData(1);
    });

    /**
     * 显示信息列表
     */
    function updatePageData(page) {
        $.post("${dynamicURL}/front/goods/list?categoryId=${categoryId}&page=" + page, function (data) {
            if (data.success) {
                var str = "";
                $.each(data.list, function (index, element) {
                    str += '<ul>';
                    str += '    <li class="last">';
                    str += '        <a href="${dynamicURL}/front/goods/detail?goodsId=' + element.id + '">';
                    str += '            <img src="${dynamicURL}/' + element.titleimage + '" width="170" height="170" />';
                    str += '            <span style="color:green">' + element.name + '</span>';
                    str += '            <span class="price">商城价： ￥' + element.marketprice + '/份</span>';
                    str += '        </a>';
                    str += '    </li>';
                    str += '</ul>';
                });
                $("#result").html(str);
                setTotalCount = data.page.total;
                if (count == 1) {
                    count = count + 1;
                    wocao(data.page);
                }
                // $('#box').paging({
                //     initPageNo: data.page.pageNum, // 初始页码
                //     totalPages: data.page.end, //总页数
                //     totalCount: '合计' + setTotalCount + '条数据', // 条目总数
                //     slideSpeed: 600, // 缓动速度。单位毫秒
                //     jump: true, //是否支持跳转
                //     callback: function (page) { // 回调函数
                //         if(cun != data.page.pageNum){
                //             // 此处刷新页面
                //             updatePageData(page);
                //         }
                //     }
                // });
            }
        });
    }

    /**
     * 左侧类型树
     */
    function categoryList() {
        $.post("${dynamicURL}/front/goods/category/tree", function (data) {
            if (data.success) {
                var str = "";
                $.each(data.list, function (index, element) {
                    str += '<dl>';
                    str += '    <dt>';
                    str += '        <a href="${dynamicURL}/front/goods?categoryId=' + element.id + '">' + element.type + '</a>';
                    str += '    </dt>';
                    $.each(element.categoryList, function (i, e) {
                        str += '    <dd>';
                        str += '        <a href="${dynamicURL}/front/goods?categoryId=' + e.id + '">' + e.type + '</a>';
                        str += '    </dd>';
                    });
                    str += '</dl>';
                });
                $("#hotProductCategoryList").html(str);
            }
        });
    }
</script>
