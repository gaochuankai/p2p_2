<%@ page language="java" contentType="text/html; UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN"
"http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="dynamicURL" value="${pageContext.request.contextPath }"></c:set>

<link href="${dynamicURL}/css/cart.css" rel="stylesheet" type="text/css"/>

<div class="container cart">
    <div class="span24">
        <div class="step step1">
            <ul>
                <li class="current"></li>
                <li>生成订单成功</li>
            </ul>
        </div>
        <table>
            <tbody>
            <tr>
                <th>图片</th>
                <th>商品</th>
                <th>价格</th>
                <th>数量</th>
                <th>小计</th>
            </tr>
            </tbody>
            <tbody id="detailCartList"></tbody>
        </table>
        <dl id="giftItems" class="hidden" style="display: none;">
        </dl>
        <div class="total">
            <em id="promotion"></em>
            商品金额: <strong id="effectivePrice">￥100元</strong>
        </div>
        <form id="orderForm" action="${dynamicURL}/order_payOrder.action" method="post">
            <input type="hidden" name="order.oid" value=""/>
            <div class="span24">
                <p>
                    收货地址：<input id="address" name="address" type="text" value="" style="width:350px"
                                onkeyup="value=value.replace(/[^\w\u4E00-\u9FA5]/g, '')"/>
                    <br/>
                    收货人&nbsp;&nbsp;&nbsp;：<input id="receivename" name="receivename" type="text" value=""
                                                 style="width:150px"
                                                 onkeyup="value=value.replace(/[^\w\u4E00-\u9FA5]/g, '')"/>
                    <br/>
                    联系方式：
                    <input id="phone" name="phone" type="text" value="" style="width:150px" maxlength="11"
                           onkeyup="value=value.replace(/[^\d]/g,'') "
                           onbeforepaste="clipboardData.setData('text',clipboardData.getData('text').replace(/[^\d]/g,''))"/>
                </p>
                <hr/>
                <p style="text-align:right">
                    <a onclick="affirmOrder();">
                        <img src="${dynamicURL}/images/finalbutton.gif" width="204" height="51" border="0"/>
                    </a>
                </p>
            </div>
        </form>
    </div>
</div>

<script type="text/javascript">

    var gids = new Array();
    var sum = 0.0;

    $(function () {
        if ('${gids}' != '') {
            $.each(${gids}, function (i, e) {
                gids.push(e);
            });
            loadData();
        }
    });

    /**
     * 确认订单
     */
    function affirmOrder() {
        $.ajax({
            url: "${dynamicURL }/front/order/createOrder",//请求路径
            type: "POST",//请求类型
            dataType: "JSON",//服务器响应数据类型
            data: {
                "gids": gids,
                "totalprice": sum,
                "address": $("#address").val(),
                "phone": $("#phone").val(),
                "receivename": $("#receivename").val()
            },//参数
            success: function (data) {
                if (data.success) {
                    layer.confirm("确认订单成功，是否现在去支付吗？", {
                        btn: ['确定', '取消'], title: ""
                    }, function () {
                        window.location.href = "${dynamicURL }/front/pay?oid=" + data.entity.id;
                    });
                } else {
                    layer.confirm("确认订单失败" + data.errorMsg, {
                        btn: ['确定', '取消'], title: ""
                    }, function () {
                        window.location.href = "${dynamicURL }/front/order?ids=" + gids;
                    });
                }
            },//请求成功后回调
            error: function (data) {

            }//请求失败后回调
        });
    }

    function loadData() {
        $.ajax({
            url: "${dynamicURL }/front/order/orderItems",//请求路径
            type: "POST",//请求类型
            dataType: "JSON",//服务器响应数据类型
            data: {"gids": gids},//参数
            success: function (data) {
                if (data.success) {
                    var str = '';
                    $.each(data.list, function (index, element) {
                        str += '<tr>';
                        str += '    <td width="60">';
                        str += '        <img src="${dynamicURL}/' + element.goodsEntity.titleimage + '" />';
                        str += '    </td>';
                        str += '    <td>';
                        str += '        <a target="_blank" href="${dynamicURL }/front/goods/detail?goodsId=' + element.gid + '" >' + element.goodsEntity.name + '</a>';
                        str += '    </td>';
                        str += '    <td id="estoreprice' + element.gid + '">￥' + toDecimal(element.goodsEntity.estoreprice) + '</td>';
                        str += '    <td class="quantity" width="60">';
                        str += '        <input type="text" name="count" value="' + element.buynum + '" maxlength="4" onpaste="return false;"/>';
                        str += '    </td>';
                        str += '    <td width="140">';
                        str += '        <span class="subtotal" id="subtotal' + element.gid + '">￥' + toDecimal(element.goodsEntity.estoreprice * element.buynum) + '</span>';
                        str += '    </td>';
                        str += '</tr>';
                    });
                    $("#detailCartList").html(str);
                    sumPrice();
                }
            },//请求成功后回调
            error: function (data) {

            }//请求失败后回调
        });
    }

    //js将数字转换保留2位小数
    function toDecimal(x) {
        var val = Number(x)
        if (!isNaN(parseFloat(val))) {
            //toFixed():将数值保留2位小数，有四舍五入功能
            val = val.toFixed(2);
        }
        return val;
    }

    function sumPrice(flag) {
        $.each($("#detailCartList tr td .subtotal"), function (i, e) {
            var value = $(this).text();
            value = value.substr(1, value.length - 1);
            value = Number(value);
            sum += value;
        });
        //$("#effectivePoint").html(sum);
        $("#effectivePrice").html("￥" + toDecimal(sum) + "元");
    }

</script>