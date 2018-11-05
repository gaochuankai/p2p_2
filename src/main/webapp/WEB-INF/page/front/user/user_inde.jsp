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
    </div>
</div>


<script type="text/javascript">

    $(function () {
        findOrder();
    });

    function findOrder() {
        $.ajax({
            url: "${dynamicURL }/front/order/findList",//请求路径
            type: "POST",//请求类型
            dataType: "JSON",//服务器响应数据类型
            data: {"oid": '${oid}'},//参数
            success: function (data) {
                if (data.success) {
                    //var t = data.entity;
                    var str = '';
                    $.each(data.list, function (index, t) {
                        str += '<table>';
                        str += '    <tbody>';
                        str += '        <tr>';
                        str += '            <td colspan="2"><span>' + t.createtime.substring(0, 10) + '</span></td>';
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
                            str += '            <span>' + e.buynum + '</span>';
                            str += '        </td>';
                            str += '    </tr>';
                        });
                        str += '<tr>';
                        str += '    <td colspan="2">';
                        str += '        <textarea rows="5" cols="100" style="text-align: center;readonly:readonly;">收件地址：' + t.address + '\n收件人姓名：' + t.receivename + '\n订单状态：' + t.statusWapped + '</textarea>';
                        str += '    </td>';
                        str += '    <td colspan="2">';
                        if (t.status == 0) {
                            str += '    <button type="button" onclick="toPay(' + t.id + ')">去付款</button>';
                        }
                        if (t.status == 3) {
                            str += '    <button type="button" onclick="toShouhuo(' + t.id + ')">确认收货</button>';
                        }
                        str += '    </td>';
                        str += '</tr>';
                        str += '</table>';
                    });
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

    // 去支付
    function toPay(id) {
        window.location.href = "${dynamicURL }/front/pay?oid=" + id;
    }

    function toShouhuo(id) {
        layer.confirm("确定收货？", {
            btn: ['确定', '取消'],
            title: ""
        }, function (index, layero) {
            $.ajax({
                url: "${dynamicURL }/front/order/shouhuo",//请求路径
                type: "POST",//请求类型
                dataType: "JSON",//服务器响应数据类型
                data: {"id": id},//参数
                success: function (data) {
                    var title = data.success ? "收货成功！" : "收货失败";
                    layer.alert(title);
                }
            });
        });

    }

</script>
