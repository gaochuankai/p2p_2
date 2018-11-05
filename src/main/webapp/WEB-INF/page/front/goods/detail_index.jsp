<%@ page language="java" contentType="text/html; UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN"
"http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="dynamicURL" value="${pageContext.request.contextPath }"></c:set>

<link href="${dynamicURL}/css/product.css" rel="stylesheet" type="text/css">

<div class="container productContent">
    <div class="span6">
        <div class="hotProductCategory" id="hotProductCategoryList"></div>
    </div>
    <div class="span18 last">
        <div class="productImage">
            <a title="" style="outline-style: none; text-decoration: none;" id="zoom"
               href="http://image/r___________renleipic_01/bigPic1ea8f1c9-8b8e-4262-8ca9-690912434692.jpg"
               rel="gallery">
                <div class="zoomPad">
                    <img style="opacity: 1;" title="" class="medium" src="${dynamicURL}/${entity.titleimage}"/>
                    <div style="display: block; top: 0px; left: 162px; width: 0px; height: 0px; position: absolute; border-width: 1px;"
                         class="zoomPup"></div>
                    <div style="position: absolute; z-index: 5001; left: 312px; top: 0px; display: block;"
                         class="zoomWindow">
                        <div style="width: 368px;" class="zoomWrapper">
                            <div style="width: 100%; position: absolute; display: none;" class="zoomWrapperTitle"></div>
                            <div style="width: 0%; height: 0px;" class="zoomWrapperImage">
                                <img src="%E5%B0%9A%E9%83%BD%E6%AF%94%E6%8B%89%E5%A5%B3%E8%A3%852013%E5%A4%8F%E8%A3%85%E6%96%B0%E6%AC%BE%E8%95%BE%E4%B8%9D%E8%BF%9E%E8%A1%A3%E8%A3%99%20%E9%9F%A9%E7%89%88%E4%BF%AE%E8%BA%AB%E9%9B%AA%E7%BA%BA%E6%89%93%E5%BA%95%E8%A3%99%E5%AD%90%20%E6%98%A5%E6%AC%BE%20-%20Powered%20By%20Mango%20Team_files/6d53c211-2325-41ed-8696-d8fbceb1c199-large.jpg"
                                     style="position: absolute; border: 0px none; display: block; left: -432px; top: 0px;">
                            </div>
                        </div>
                    </div>
                    <div style="visibility: hidden; top: 129.5px; left: 106px; position: absolute;" class="zoomPreload">
                        Loading zoom
                    </div>
                </div>
            </a>
        </div>
        <div class="name">${entity.name}</div>
        <div class="sn">
            <div>编号：${entity.id}</div>
        </div>
        <div class="info">
            <dl>
                <dt>亿家价:</dt>
                <dd>
                    <strong>￥：${entity.estoreprice}元/份</strong>
                    参 考 价：
                    <del>￥${entity.marketprice}元/份</del>
                </dd>
            </dl>
            <dl>
                <dt>促销:</dt>
                <dd>
                    <a target="_blank" title="限时抢购 (2014-07-30 ~ 2015-01-01)">限时抢购</a>
                </dd>
            </dl>
            <dl>
                <dt></dt>
                <dd>
                    <span>    </span>
                </dd>
            </dl>
        </div>
        <div class="action">
            <dl class="quantity">
                <dt>购买数量:</dt>
                <dd>
                    <input id="quantity" name="quantity" value="1" maxlength="2" onpaste="return false;" type="text"
                           onkeyup="value=value.replace(/[^\d]/g,'')">
                    <div>
                        <span id="increase" class="increase">&nbsp;</span>
                        <span id="decrease" class="decrease">&nbsp;</span>
                    </div>
                </dd>
                <dd>
                    件
                </dd>
            </dl>
            <div class="buy">
                <input id="addCart" class="addCart" value="加入购物车" type="button" onclick="addCart()"/>
            </div>
        </div>
        <div id="bar" class="bar">
            <ul>
                <li id="introductionTab">
                    <a href="#introduction">商品介绍</a>
                </li>
            </ul>
        </div>

        <div id="introduction" name="introduction" class="introduction">
            <div class="title">
                <strong>商品介绍</strong>
            </div>
            <div>
                <img src="${dynamicURL}/${entity.titleimage}">
                <br>
                ${entity.description}
            </div>
        </div>
    </div>
</div>

<script type="text/javascript">
    $(function () {
        categoryList();
        $("#increase").click(function () {
            var num = Number($("#quantity").val());
            if (num != NaN && num < 99) {
                $("#quantity").val(num + 1);
            }
        });
        $("#decrease").click(function () {
            var num = Number($("#quantity").val());
            if (num != NaN && num > 1) {
                $("#quantity").val(num - 1);
            }
        });
    });

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

    /**
     * 添加购物车
     */
    function addCart() {
        var num = $("#quantity").val();
        $.post("${dynamicURL}/front/cart/addCartItem?gid=${entity.id}&buynum=" + num, function (data) {
            if (data.success) {
                layer.confirm("添加成功！现在前往购物车？", {
                    btn: ['确定'], title: "", cancel: function (index, layero) {
                        window.location.href = "${dynamicURL }/front/goods/detail?goodsId=${entity.id}";
                    }
                }, function () {
                    window.location.href = "${dynamicURL }/front/cart";
                });
            } else {
                layer.confirm("数据繁忙，请稍后尝试！", {
                    btn: ['确定'], title: "", cancel: function (index, layero) {
                        window.location.href = "${dynamicURL }/front/goods/detail?goodsId=${entity.id}";
                    }
                }, function () {
                    window.location.href = "${dynamicURL }/front/goods/detail?goodsId=${entity.id}";
                });
            }
        });
    }
</script>
