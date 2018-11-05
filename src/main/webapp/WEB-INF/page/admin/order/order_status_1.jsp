<%@ page language="java" contentType="text/html; UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN"
"http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="dynamicURL" value="${pageContext.request.contextPath }"></c:set>

<link href="${dynamicURL}/css/paging.css" rel="stylesheet" type="text/css"/>
<script type="text/javascript" src="${dynamicURL}/js/paging.js"></script>
<script type="text/javascript" src="${dynamicURL }/later/js/dynamic-table.js"></script>
<script type="text/javascript" src="${dynamicURL }/later/assets/data-tables/jquery.dataTables.js"></script>
<script type="text/javascript" src="${dynamicURL }/later/assets/data-tables/DT_bootstrap.js"></script>

<!--sidebar start-->
<aside>
    <div id="sidebar" class="nav-collapse ">
        <!-- sidebar menu start-->
        <ul class="sidebar-menu" id="page-menu"></ul>
        <!-- sidebar menu end-->
    </div>
</aside>
<!--sidebar end-->
<!--main content start-->
<section id="main-content">
    <section class="wrapper">
        <!-- page start-->
        <div class="row">
            <div class="col-lg-12">
                <section class="panel">
                    <%--<header class="panel-heading">--%>
                    <%--Dynamic Table--%>
                    <%--</header>--%>
                    <div class="pagger-box pagger" id="box"></div>
                    <div id="result"></div>
                </section>
            </div>
        </div>
        <!-- page end-->
    </section>
</section>
<!--main content end-->

<script type="text/javascript">
    var setTotalCount = 0;
    $('#box').paging({
        initPageNo: 1, // 初始页码
        totalPages: 0, //总页数
        totalCount: '合计' + setTotalCount + '条数据', // 条目总数
        slideSpeed: 600, // 缓动速度。单位毫秒
        jump: true, //是否支持跳转
        callback: function (page) { // 回调函数
            // 此处刷新页面
            loadData(page);
        }
    });

    $(function () {
        // 加载，左侧菜单列表
        loadMenu();
    });

    function loadData(page) {
        $.post("${dynamicURL}/admin/order/list?status=1&page=" + page, function (data) {
            if (data.success) {
                var str = "";
                str += "<table class=\"table table-striped border-top\" id=\"sample_1\">";
                str += "    <thead>";
                str += "    <tr>";
                str += "        <th class=\"hidden-phone\">订单id</th>";
                str += "        <th class=\"hidden-phone\">订单价格</th>";
                str += "        <th class=\"hidden-phone\">订单地址</th>";
                str += "        <th class=\"hidden-phone\">收件人</th>";
                str += "        <th class=\"hidden-phone\">收件人电话</th>";
                str += "        <th class=\"hidden-phone\">操作</th>";
                str += "    </tr>";
                str += "    </thead>";

                $.each(data.list, function (index, element) {
                    str += "    <tbody>";
                    str += "    <tr class=\"odd gradeX\">";
                    str += "        <td>" + element.id + "</td>";
                    str += "        <td class=\"hidden-phone\">" + element.totalprice + "</td>";
                    str += "        <td class=\"hidden-phone\">" + element.address + "</td>";
                    str += "        <td class=\"center hidden-phone\">" + element.receivename + "</td>";
                    str += "        <td class=\"center hidden-phone\">" + element.phone + "</td>";
                    str += "        <td class=\"hidden-phone\">";
                    str += "            <button class=\"btn btn-danger\" type=\"submit\" onclick='fahuo(" + element.id + ")'>发货</button>";
                    str += "        </td>";
                    str += "    </tr>";
                    str += "    </tbody>";
                });
                str += "</table>";
                $("#result").html(str);
                setTotalCount = data.page.total;
                $('#box').paging({
                    initPageNo: data.page.pageNum, // 初始页码
                    totalPages: data.page.end, //总页数
                    totalCount: '合计' + setTotalCount + '条数据', // 条目总数
                    slideSpeed: 600, // 缓动速度。单位毫秒
                    jump: true //是否支持跳转
                });
            }
        });
    }

    function edit(id) {
        layer.confirm("确定要修改吗？", {btn: ['确定', '取消'], title: ""}, function () {
            window.location.href = "${dynamicURL }/admin/goods/toEditGoods?id=" + id;
        });
    }

    function xjia(id) {
        layer.confirm("确定要下架吗？", {btn: ['确定', '取消'], title: ""}, function () {
            var url = "${dynamicURL }/admin/goods/xiajia?id=" + id;
            $.post(url, function (data) {
                if (data.success) {
                    layer.confirm("下架成功！", {btn: ['确定'], title: ""}, function () {
                        window.location.href = "${dynamicURL }/admin/goods";
                    });
                } else {
                    layer.confirm("下架成功！", {btn: ['确定'], title: ""}, function () {
                        window.location.href = "${dynamicURL }/admin/goods";
                    });
                }
            });
        });
    }

    function fahuo(id) {
        $.post("${dynamicURL}/admin/order/fahuo?id=" + id, function (data) {
            var title = data.success ? "发货成功" : "发货失败" + data.errorMsg;
            layer.confirm(title, {btn: ['确定', '取消'], title: ""}, function () {
                location.reload();
            });
        });
    }

</script>


