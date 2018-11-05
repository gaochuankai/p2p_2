<%@ page language="java" contentType="text/html; UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN"
"http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="dynamicURL" value="${pageContext.request.contextPath }"></c:set>

<link rel="stylesheet" type="text/css" href="${dynamicURL}/css/paging.css"/>
<link rel="stylesheet" type="text/css"
      href="${dynamicURL}/later/assets/bootstrap-select-1.13.0-dev/dist/css/bootstrap-select.css">
<script type="text/javascript"
        src="${dynamicURL }/later/assets/bootstrap-paginator-master/src/bootstrap-paginator.js"></script>
<script type="text/javascript"
        src="${dynamicURL }/later/assets/bootstrap-select-1.13.0-dev/dist/js/bootstrap-select.js"></script>
<script type="text/javascript"
        src="${dynamicURL }/js/jquery.form.js"></script>

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
        <div class="col-md-12">
            <h1>
                菜单权限列表
            </h1>
        </div>
        <div class="col-md-4">
            <div style="height: 30px;">
                总数（<b id="total_count"></b>）
            </div>
            <table class="table table-hover table-bordered" title="角色">
                <thead>
                <tr>
                    <th></th>
                    <th>角色名称</th>
                </tr>
                </thead>
                <!-- BEGIN list -->
                <tbody id="result">
                <!-- END list -->
                </tbody>
            </table>
            <div id="Paginator" style="text-align: center">
                <ul id="pageLimit"></ul>
            </div>
        </div>
        <div class="col-md-8">
            <div style="height: 30px;">
                <input type="checkbox" id="checkboxAll">
                <input type="button" value="全选" class="btn btn-primary btn-xs" id="selectAll">
                <input type="button" value="全不选" class="btn btn-primary btn-xs" id="unSelect">
                <input type="button" value="反选" class="btn btn-primary btn-xs" id="reverse">
                <%--<input type="button" value="获得选中的所有值" class="btn" id="getValue">--%>
            </div>
            <table class="table table-hover table-bordered" title="菜单">
                <thead>
                <tr>
                    <th></th>
                    <th>菜单名称</th>
                    <th>父节点</th>
                </tr>
                </thead>
                <!-- BEGIN list -->
                <tbody id="result2">
                <!-- END list -->
                </tbody>
            </table>
            <div>
                <button type="button" class="btn btn-default" style="background-color: #428bca;" onclick="save()">
                    保存
                </button>
            </div>
        </div>
    </section>
</section>
<!--main content end-->


<script type="text/javascript">
    var totalPagesCurrent = 1;

    function loadPage() {
        $('#pageLimit').bootstrapPaginator({
            currentPage: 1,
            totalPages: totalPagesCurrent,// 总页数
            size: "normal",
            bootstrapMajorVersion: 3,
            alignment: "right",
            numberOfPages: 5,// 一行显示几页数
            itemTexts: function (type, page, current) {
                switch (type) {
                    case "first":
                        return "首页";
                    case "prev":
                        return "上一页";
                    case "next":
                        return "下一页";
                    case "last":
                        return "末页";
                    case "page":
                        return page;
                }
                //loadData(page);
            }, onPageClicked: function (event, originalEvent, type, page) {//给每个页眉绑定一个事件，其实就是ajax请求，其中page变量为当前点击的页上的数字。
                loadData(page);
            }
        });
    }

    $(function () {
        // 加载，左侧菜单列表
        loadMenu();
        // 加载第一页的数据
        loadData(1);
        // 加载分页
        loadPage();
        //加载菜单
        loadPowerData();
    });


    //加载菜单
    function loadPowerData() {
        $.post("${dynamicURL}/admin/power/powerList", function (data) {
            var str = "";
            $.each(data, function (index, element) {
                str += "    <tr>";
                str += "        <td><input id='input" + element.id + "' type='checkbox' value='" + element.id + "'/></td>";
                str += "        <td>" + element.menu + "</td>";
                str += "        <td>" + element.powerEntity.menu + "</td>";
                str += "    </tr>";
            });
            $("#result2").html(str);
        });
    }

    //依据左侧列表的选中项加载菜单
    function loadPowerData2(rid) {
        $("#result2 :checkbox,#checkboxAll").removeProp("checked", false);
        $.post("${dynamicURL}/admin/rolepower/getPowerListByRid?rid=" + rid, function (data) {
            $.each(data, function (index, element) {
                $("#input" + element.pid).prop("checked", true);
            });
        });
    }

    function loadData(page) {
        $.post("${dynamicURL}/admin/role/list?status=0&page=" + page, function (data) {
            if (data.success) {
                var str = "";
                $.each(data.list, function (index, element) {
                    str += "    <tr>";
                    str += "        <td><input type='radio' name='role' value='" + element.id + "' onclick='loadPowerData2(" + element.id + ")'/></td>";
                    str += "        <td>" + element.name + "</td>";
                    str += "    </tr>";
                });
                str += "</table>";
                $("#result").html(str);
                $("#search_total").val(data.page.total);
                $("#total_count").html(data.page.total);
                totalPagesCurrent = data.page.end;
            }
        });
    }

    function save() {
        var pids = new Array();
        $.each($("#result2 :checkbox"), function (i, e) {
            if ($(this).prop("checked") == true) {
                pids.push($(this).val());
            }
        });
        var rid = $('input[name="role"]:checked').val();
        $.post("${dynamicURL}/admin/rolepower/save?rid=" + rid + "&pids=" + pids, function (data) {
            var title = data.success ? "保存成功！" : "保存失败！";
            layer.confirm(title, {
                btn: ['确定'], title: "", cancel: function (index, layero) {
                    location.reload();
                }
            }, function () {
                location.reload();
            });
        });
    }

    // -----------------------------------------
    // 点击全选、再点击全不选
    $("#checkboxAll").click(function () {
        if (this.checked) {
            $("#result2 :checkbox").prop("checked", true);
        } else {
            $("#result2 :checkbox").prop("checked", false);
        }
    });

    // 点击全选
    $("#selectAll").click(function () {
        $("#result2 :checkbox,#checkboxAll").prop("checked", true);
    });

    // 点击全不选
    $("#unSelect").click(function () {
        $("#result2 :checkbox,#checkboxAll").removeProp("checked", false);
    });

    // 反选
    $("#reverse").click(function () {
        $("#result2 :checkbox").each(function () {
            $(this).prop("checked", !$(this).prop("checked"));
        });
        allchk();
    });

    // 检车选中、还是未选中
    function allchk() {
        var chknum = $("#result2 :checkbox").size();//选项总个数
        var chk = 0;
        $("#result2 :checkbox").each(function () {
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
        $("#result2 :checkbox").each(function () {
            if ($(this).prop("checked") == true) {
                valArr += $(this).val() + ",";//转换为逗号隔开的字符串
            }
        });
        alert(valArr);
    });

    // 当全部选中时，全选按钮自动选中
    $("#result2 :checkbox").click(function () {
        allchk();
    });

</script>


