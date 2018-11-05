<%@ page language="java" contentType="text/html; UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN"
"http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="dynamicURL" value="${pageContext.request.contextPath }"></c:set>

<link href="${dynamicURL}/css/cart.css" rel="stylesheet" type="text/css">

<div class="container cart">
    <div class="span24">
        <div class="step step1"></div>
        <div class="step step1">
            <input type="checkbox" id="checkboxAll">
            <input type="button" value="全选" class="btn" id="selectAll">
            <input type="button" value="全不选" class="btn" id="unSelect">
            <input type="button" value="反选" class="btn" id="reverse">
            <%--<input type="button" value="获得选中的所有值" class="btn" id="getValue">--%>
        </div>
        <table id="choose">
            <tbody>
            <tr>
                <th></th>
                <th>图片</th>
                <th>商品</th>
                <th>价格</th>
                <th>数量</th>
                <th>小计</th>
                <th>操作</th>
            </tr>
            </tbody>
            <tbody id="detailCartList"></tbody>
        </table>
        <dl id="giftItems" class="hidden" style="display: none;">
        </dl>
        <div class="total">
            <em id="promotion"></em>
            <%--<em>--%>
            <%--登录后确认是否享有优惠--%>
            <%--</em>--%>
            赠送积分: <em id="effectivePoint"></em>
            商品金额: <strong id="effectivePrice"></strong>
        </div>
        <div class="bottom">
            <a href="javascript:;" id="clear" class="clear" onclick="cleanCart()">清空购物车</a>
            <a href="javascript:;" id="submit" class="submit" onclick="submitOrder()">提交订单</a>
        </div>
    </div>
</div>

<script type="text/javascript">
    $(function () {
        findCart();
    });

    function quantity(gid) {
        $("#quantity" + gid).on("keyup", function () {
            var value = $("#quantity" + gid).val();
            value = value.replace(/[^\d]/g, '');
            $("#quantity" + gid).val(value);
            updateCartItem(gid, value);
            updateSubtotal(gid);
        });
    }

    function increase(gid) {
        var num = Number($("#quantity" + gid).val());
        if (num != NaN && num < 99) {
            $("#quantity" + gid).val(num + 1);
            updateCartItem(gid, num + 1);
            updateSubtotal(gid);
        }
    }

    function decrease(gid) {
        var num = Number($("#quantity" + gid).val());
        if (num != NaN && num > 1) {
            $("#quantity" + gid).val(num - 1);
            updateCartItem(gid, num - 1);
            updateSubtotal(gid);
        }
    }

    function findCart() {
        $.ajax({
            url: "${dynamicURL }/front/cart/findCart",//请求路径
            type: "POST",//请求类型
            dataType: "JSON",//服务器响应数据类型
            //data: [{"code": value}],//参数
            success: function (data) {
                if (data.success) {
                    var str = '';
                    $.each(data.list, function (index, element) {
                        str += '<tr>';
                        str += '<td>';
                        str += '    <input type="checkbox" name="id" value="' + element.gid + '" />';
                        str += '</td>';
                        str += '<td width="60">';
                        str += '    <img src="${dynamicURL}/' + element.goodsEntity.titleimage + '" />';
                        str += '</td>';
                        str += '<td>';
                        str += '    <a target="_blank" href="${dynamicURL }/front/goods/detail?goodsId=' + element.gid + '">' + element.goodsEntity.name + '</a>';
                        str += '</td>';
                        str += '<td id="estoreprice' + element.gid + '">￥' + toDecimal(element.goodsEntity.estoreprice) + '</td>';
                        str += '<td class="quantity" width="100">';
                        str += '    <div>';
                        str += '        <span id="increase' + element.gid + '" style="text-align: center;width: 30px;float: left;cursor: pointer;" onclick="increase(' + element.gid + ')">+</span>';
                        str += '        <input id="quantity' + element.gid + '" type="text" value="' + element.buynum + '" onclick="quantity(' + element.gid + ')" maxlength="2" />';
                        str += '        <span id="decrease' + element.gid + '" style="text-align: center;width: 30px;float: right;cursor: pointer;" onclick="decrease(' + element.gid + ')">-</span>';
                        str += '    </div>';
                        str += '</td>';
                        str += '<td width="140">';
                        str += '    <span class="subtotal" id="subtotal' + element.gid + '">￥' + toDecimal(element.goodsEntity.estoreprice * element.buynum) + '</span>';
                        str += '</td>';
                        str += '<td>';
                        str += '    <a href="javascript:;" class="delete" onclick="deleteCartItem(' + element.gid + ')">删除</a>';
                        str += '</td>';
                        str += '</tr>';
                    });
                    $("#detailCartList").html(str);
                    $('input[name="id"]').click(function () {
                        sumPrice();
                    });
                    sumPrice(0);
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

    function deleteCartItem(gid) {
        $.ajax({
            url: "${dynamicURL }/front/cart/deleteCartItem?gid=" + gid,//请求路径
            type: "POST",//请求类型
            dataType: "JSON",//服务器响应数据类型
            //data: [{"code": value}],//参数
            success: function (data) {
                if (data.success) {
                    layer.confirm("删除成功！", {
                        btn: ['确定'], title: "", cancel: function (index, layero) {
                            window.location.href = "${dynamicURL }/front/cart";
                        }
                    }, function () {
                        window.location.href = "${dynamicURL }/front/cart";
                    });
                } else {
                    layer.confirm("删除失败！", {
                        btn: ['确定'], title: "", cancel: function (index, layero) {
                            window.location.href = "${dynamicURL }/front/cart";
                        }
                    }, function () {
                        window.location.href = "${dynamicURL }/front/cart";
                    });
                }
            },//请求成功后回调
            error: function (data) {

            }//请求失败后回调
        });
    }

    function updateCartItem(gid, buynum) {
        $.ajax({
            url: "${dynamicURL }/front/cart/updateCartItem?gid=" + gid + "&buynum=" + buynum,
            type: "POST",
            datetype: "JSON"
        });
    }

    function sumPrice(flag) {
        var sum = 0;
        var ids = new Array();
        if (flag == 0) {

        } else {
            $.each($("#choose :checkbox:checked"), function (i, e) {
                ids.push($(this).val());
            });
            $.each(ids, function (i, e) {
                var value = $("#subtotal" + e).text();
                value = value.substr(1, value.length - 1);
                value = Number(value);
                sum += value;
            });
        }
        $("#effectivePoint").html(sum);
        $("#effectivePrice").html("￥" + toDecimal(sum) + "元");
    }

    function cleanCart() {
        layer.confirm("确定要清空购物车吗？", {
            btn: ['确定', '取消'], title: ""
        }, function () {
            // 点击确定走此方法
            $.post("${dynamicURL }/front/cart/cleanCart", function (data) {
                if (data.success) {
                    window.location.href = "${dynamicURL }/front/cart";
                }
            });
        });
    }

    function updateSubtotal(gid) {
        var value = $("#estoreprice" + gid).html();
        value = value.substr(1, value.length - 1);
        value = Number(value);
        var num = $("#quantity" + gid).val();
        num = Number(num);
        $("#subtotal" + gid).html("￥" + toDecimal(value * num));
        sumPrice();
    }

    function submitOrder() {
        layer.confirm("确定要提交订单吗？", {
            btn: ['确定', '取消'], title: ""
        }, function () {
            var ids = new Array();
            $.each($("#choose :checkbox:checked"), function (i, e) {
                ids.push($(this).val());
            });
            window.location.href = "${dynamicURL }/front/order?ids=" + ids;
        });
    }

    // -----------------------------------------
    // 点击全选、再点击全不选
    $("#checkboxAll").click(function () {
        if (this.checked) {
            $("#choose :checkbox").prop("checked", true);
        } else {
            $("#choose :checkbox").prop("checked", false);
        }
        sumPrice();
    });

    // 点击全选
    $("#selectAll").click(function () {
        $("#choose :checkbox,#checkboxAll").prop("checked", true);
        sumPrice();
    });

    // 点击全不选
    $("#unSelect").click(function () {
        $("#choose :checkbox,#checkboxAll").removeProp("checked", false);
        sumPrice();
    });

    // 反选
    $("#reverse").click(function () {
        console.log($("#detailCartList :checkbox"));
        $("#choose :checkbox").each(function () {
            $(this).prop("checked", !$(this).prop("checked"));
        });
        allchk();
        sumPrice();
    });

    // 检车选中、还是未选中
    function allchk() {
        var chknum = $("#choose :checkbox").size();//选项总个数
        var chk = 0;
        $("#choose :checkbox").each(function () {
            if ($(this).prop("checked") == true) {
                chk++;
            }
        });
        if (chknum == chk) {//全选
            $("#checkboxAll").prop("checked", true);
        } else {//不全选
            $("#checkboxAll").prop("checked", false);
        }
    }

    // 获取所有选中值
    $("#getValue").click(function () {
        var valArr = "";
        $("#choose :checkbox").each(function () {
            if ($(this).prop("checked") == true) {
                valArr += $(this).val() + ",";//转换为逗号隔开的字符串
            }
        });
        alert(valArr);
    });

    // 当全部选中时，全选按钮自动选中
    $("#choose :checkbox").click(function () {
        allchk();
        sumPrice();
    });

</script>

