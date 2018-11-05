<%@ page language="java" contentType="text/html; UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN"
"http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="dynamicURL" value="${pageContext.request.contextPath }"></c:set>

<link rel="stylesheet" type="text/css" href="${dynamicURL}/css/cart.css"/>

<div class="container cart">
    <div class="span24">
        <div class="step step1">
            <ul>
                <li class="current"></li>
                <li>订单支付</li>
            </ul>
        </div>
        <div id="detailCartList"></div>

        <div class="">
            <form id="orderForm" action="${dynamicURL}/order_payOrder.action" method="post">
                <input type="hidden" name="order.oid" value=""/>
                <div class="span24">
                    <p>
                        选择支付方式：<br/>
                        <input type="radio" name="pd_FrpId" value="ICBC-NET-B2C" checked="checked"/>支付宝
                        <img src="${dynamicURL}/bank_img/alipay.png" align="middle"/>
                        <br/>
                        <input type="radio" name="pd_FrpId" value="ICBC-NET-B2C"/>工商银行
                        <img src="${dynamicURL}/bank_img/icbc.bmp" align="middle"/>&nbsp;&nbsp;&nbsp;&nbsp;
                        <input type="radio" name="pd_FrpId" value="BOC-NET-B2C"/>中国银行
                        <img src="${dynamicURL}/bank_img/bc.bmp" align="middle"/>&nbsp;&nbsp;&nbsp;&nbsp;
                        <input type="radio" name="pd_FrpId" value="ABC-NET-B2C"/>农业银行
                        <img src="${dynamicURL}/bank_img/abc.bmp" align="middle"/>
                        <br/>
                        <input type="radio" name="pd_FrpId" value="BOCO-NET-B2C"/>交通银行
                        <img src="${dynamicURL}/bank_img/bcc.bmp" align="middle"/>&nbsp;&nbsp;&nbsp;&nbsp;
                        <input type="radio" name="pd_FrpId" value="PINGANBANK-NET"/>平安银行
                        <img src="${dynamicURL}/bank_img/pingan.bmp" align="middle"/>&nbsp;&nbsp;&nbsp;&nbsp;
                        <input type="radio" name="pd_FrpId" value="CCB-NET-B2C"/>建设银行
                        <img src="${dynamicURL}/bank_img/ccb.bmp" align="middle"/>
                        <br/>
                        <input type="radio" name="pd_FrpId" value="CEB-NET-B2C"/>光大银行
                        <img src="${dynamicURL}/bank_img/guangda.bmp" align="middle"/>&nbsp;&nbsp;&nbsp;&nbsp;
                        <input type="radio" name="pd_FrpId" value="CMBCHINA-NET-B2C"/>招商银行
                        <img src="${dynamicURL}/bank_img/cmb.bmp" align="middle"/>
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
</div>

<script type="text/javascript">

    $(function () {
        findOrder();
    });

    function findOrder() {
        $.ajax({
            url: "${dynamicURL }/front/order/findOrder",//请求路径
            type: "POST",//请求类型
            dataType: "JSON",//服务器响应数据类型
            data: {"oid": '${oid}'},//参数
            success: function (data) {
                if (data.success) {
                    var t = data.entity;
                    var str = '';
                    //$.each(data.list, function (index, element) {
                    str += '<table>';
                    str += '    <tbody>';
                    str += '        <tr>';
                    str += '            <td colspan="2"><span>' + t.createtime.substring(0,10) + '</span></td>';
                    str += '            <td colspan="2"><span>' + t.statusWapped + '</span></td>';
                    str += '        </tr>';
                    str += '    </tbody>';
                    str += '    <tbody>';
                    str += '        <tr>';
                    str += '            <th>图片</th>';
                    str += '            <th>商品</th>';
                    str += '            <th>价格</th>';
                    str += '            <th>数量</th>';
                    str += '        </tr>';
                    str += '    </tbody>';
                    $.each(t.orderItems, function (i, e) {
                        str += '    <tr>';
                        str += '        <td>';
                        str += '            <img src="${dynamicURL}/' + e.goods.titleimage + '" >';
                        str += '        </td>';
                        str += '        <td>';
                        str += '            <span>' + e.goods.name + '</span>';
                        str += '        </td>';
                        str += '        <td>';
                        str += '            <span>￥' + toDecimal(e.goods.estoreprice) + '</span>';
                        str += '        </td>';
                        str += '        <td>';
                        str += '            <span>'+e.buynum+'</span>';
                        str += '        </td>';
                        str += '    </tr>';
                    });
                    str += '<tr>';
                    str += '    <td colspan="4">';
                    str += '        <textarea rows="3" cols="100" style="text-align: center;">收件地址：'+t.address+'\n收件人姓名：'+t.receivename+'</textarea>';
                    str += '    </td>';
                    str += '</tr>';
                    str += '</table>';
                    //});
                    $("#detailCartList").html(str);
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

    // 确认订单
    function affirmOrder() {
        window.location.href = "${dynamicURL }/front/pay/alipay?oid=${oid}";
        <%--$.ajax({--%>
            <%--url: "${dynamicURL }/front/pay/alipay",//请求路径--%>
            <%--type: "POST",//请求类型--%>
            <%--dataType: "JSON",//服务器响应数据类型--%>
            <%--data: {"oid": '${oid}'},//参数--%>
            <%--success: function (data) {--%>

            <%--},//请求成功后回调--%>
            <%--error: function (data) {--%>

            <%--}//请求失败后回调--%>
        <%--});--%>
    }

</script>

