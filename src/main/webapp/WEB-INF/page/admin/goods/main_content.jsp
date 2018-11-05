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
                    <th>类型</th>
                </tr>
                </thead>
                <!-- BEGIN list -->
                <tbody>
                <tr>
                    <td><input type="radio" name="type" onclick="loadGoods(2)"/></td>
                    <td>最新商品</td>
                </tr>
                <tr>
                    <td><input type="radio" name="type" onclick="loadGoods(1)"/></td>
                    <td>最热商品</td>
                </tr>
                <!-- END list -->
                </tbody>
            </table>
            <div id="Paginator" style="text-align: center">
                <ul id="pageLimit"></ul>
            </div>
        </div>
        <div class="col-md-8">
            <div style="height: 30px;">
                <%--<input type="checkbox" id="checkboxAll">--%>
                <%--<input type="button" value="全选" class="btn btn-primary btn-xs" id="selectAll">--%>
                <%--<input type="button" value="全不选" class="btn btn-primary btn-xs" id="unSelect">--%>
                <%--<input type="button" value="反选" class="btn btn-primary btn-xs" id="reverse">--%>
                <%--<input type="button" value="获得选中的所有值" class="btn" id="getValue">--%>
            </div>
            <table class="table table-hover table-bordered" title="菜单">
                <thead>
                <tr>
                    <th></th>
                    <th>商品名称</th>
                    <th>排序</th>
                    <th>操作</th>
                </tr>
                </thead>
                <!-- BEGIN list -->
                <tbody id="result2">
                <!-- END list -->
                </tbody>
            </table>
            <div id="insert">
                <button type="button" class="btn btn-default" style="background-color: #428bca;" data-toggle="modal"
                        data-target="#addUserModal">
                    新增
                </button>
            </div>
        </div>
    </section>
</section>
<!--main content end-->

<!-- 模态框示例（Modal） -->
<form method="post" action="" class="form-horizontal" role="form"
      id="form_data"
      onsubmit="return check_form()" style="margin: 20px;">
    <div class="modal fade" id="addUserModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel"
         aria-hidden="true">
        <div class="modal-dialog">
            <div class="modal-content">
                <div class="modal-header">
                    <button type="button" class="close" data-dismiss="modal" aria-hidden="true">
                        &times;
                    </button>
                    <h4 class="modal-title" id="myModalLabel">
                        角色信息
                    </h4>
                </div>
                <div class="modal-body">
                    <form class="form-horizontal" role="form" method="post" id="form-entity">
                        <input type="hidden" name="id" id="id"/>
                        <div class="form-group">
                            <label for="lastname" class="col-sm-3 control-label">大分类</label>
                            <div class="col-sm-9">
                                <select class="selectpicker" name="content_type" id="type">
                                    <option value="1">热门</option>
                                    <option value="2">最新</option>
                                </select>
                            </div>
                        </div>
                        <div class="form-group">
                            <label for="lastname" class="col-sm-3 control-label">大分类</label>
                            <div class="col-sm-9">
                                <select class="selectpicker" name="state" id="select1">
                                    <option class="selected" value="0">无</option>
                                </select>
                            </div>
                        </div>
                        <div class="form-group">
                            <label for="lastname" class="col-sm-3 control-label">小分类</label>
                            <div class="col-sm-9">
                                <select class="selectpicker" name="state" id="select2">
                                    <option class="selected" value="0">无</option>
                                </select>
                            </div>
                        </div>
                        <div class="form-group">
                            <label for="lastname" class="col-sm-3 control-label">商品</label>
                            <div class="col-sm-9">
                                <table class="table table-hover table-bordered" title="">
                                    <thead>
                                    <tr>
                                        <th></th>
                                        <th>商品名称</th>
                                    </tr>
                                    </thead>
                                    <!-- BEGIN list -->
                                    <tbody id="result3">
                                    <!-- END list -->
                                    </tbody>
                                </table>
                            </div>
                        </div>
                    </form>
                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-default" data-dismiss="modal">关闭
                    </button>
                    <button type="submit" class="btn btn-primary">
                        提交
                    </button>
                    <span id="tip"> </span>
                </div>
            </div><!-- /.modal-content -->
        </div><!-- /.modal -->
    </div>
</form>


<script type="text/javascript">

    $(function () {
        // 加载，左侧菜单列表
        loadMenu();
        //$("#insert").hide();
        // 加载右侧类型商品
        // loadGoods();
        $('#addUserModal').on('hide.bs.modal', function () {
            location.reload();
        });

        categoryData();

        $("#select1").change(function () {
            var pid = $("#select1 option:selected").val();
            $("#select2").empty();
            var selDom = $("#select2");
            $.post("${dynamicURL}/admin/category/tree?pid=" + pid, function (data) {
                selDom.append("<option class=\"selected\" value=\"0\">无</option>");
                $.each(data, function (i, e) {
                    selDom.append("<option value='" + e.id + "'>" + e.type + "</option>");//添加option
                });
                $('#select2').selectpicker('refresh');
                $('#select2').selectpicker('render');
            });
        });

        $("#select2").change(function () {
            var categoryId = $("#select2 option:selected").val();
            // $("#category_idFromId").val(pid);
            loadGoods2(categoryId, 1);
        });
    });

    function categoryData() {
        var selDom = $("#select1");
        var tree;
        $.post("${dynamicURL}/admin/category/tree", function (data) {
            $.each(data, function (i, e) {
                selDom.append("<option value='" + e.id + "'>" + e.type + "</option>");//添加option
            });
            $('#select1').selectpicker('refresh');
            $('#select1').selectpicker('render');
        });
        $("#select1").change();
    }

    function loadGoods2(categoryId, page) {
        $.post("${dynamicURL }/admin/goods/list?page=" + page + "&categoryId=" + categoryId, function (data) {
            var str = "";
            $.each(data.list, function (index, element) {
                str += "<tr>";
                str += "    <td><input id='input" + element.id + "' name='goods_id' type='radio' value='" + element.id + "'/></td>";
                str += "    <td>" + element.name + "</td>";
                str += "</tr>";
            });
            $("#result3").html(str);
        });
    }

    // 加载右侧类型商品
    function loadGoods(type) {
        $.post("${dynamicURL }/admin/mainPageContent/getListByType?type=" + type, function (data) {
            var str = "";
            $.each(data, function (index, element) {
                str += "<tr>";
                str += "    <td><input id='input" + element.id + "' type='checkbox' value='" + element.id + "'/></td>";
                str += "    <td>" + element.goodsEntity.name + "</td>";
                str += "    <td>" + element.sortnumber + "</td>";
                str += "    <td>";
                str += "        <button type=\"button\" class=\"btn btn-primary btn-xs\" data-toggle=\"tooltip\" data-placement=\"bottom\" title=\"上移\" onclick=\"up(" + element.id + "," + type + ")\">";
                str += "                    ↑";
                str += "        </button>";
                str += "        <button type=\"button\" class=\"btn btn-primary btn-xs\" data-toggle=\"tooltip\" data-placement=\"bottom\" title=\"下移\" onclick=\"down(" + element.id + "," + type + ")\">";
                str += "                    ↓";
                str += "        </button>";
                str += "        <button type=\"button\" class=\"btn btn-primary btn-xs\" data-toggle=\"tooltip\" data-placement=\"bottom\" title=\"删除\" onclick=\"c_delete(" + element.id + "," + type + ")\">";
                str += "                    ✘";
                str += "        </button>";
                str += "    </td>";
                str += "</tr>";
            });
            $("#result2").html(str);
            $("[data-toggle='tooltip']").tooltip();
        });
    }


    // 提交表单
    function check_form() {
        var form_data = $('#form_data').serialize();
        // 异步提交数据到页面
        $.ajax({
            url: "${dynamicURL}/admin/mainPageContent/save",
            data: form_data,
            type: "post",
            dataType: 'json',
            beforeSend: function () {
                return true;
            },
            success: function (data) {
                if (data.success) {
                    layer.confirm("保存成功！", {
                        btn: ['确定', '取消'],
                        title: ""
                    }, function (index, layero) {
                        location.reload();
                    });
                } else {
                    layer.confirm("保存失败！" + data.errorMsg, {
                        btn: ['确定', '取消'],
                        title: ""
                    }, function (index, layero) {
                        location.reload();
                    });
                }
            },
            error: function () {
                layer.alert('请求出错');
            },
            complete: function () {
            }
        });
        return false;
    }

    function up(id, type) {
        layer.msg('正在提交，请稍后', {
            icon: 1,
            time: 3000 //2秒关闭（如果不配置，默认是3秒）
        });
        $.post("${dynamicURL }/admin/mainPageContent/move?type=1&id=" + id, function (data) {
            var title = data.success ? "操作成功！" : "操作失败，" + data.errorMsg;
            layer.confirm(title, {
                btn: ['确定', '取消'],
                title: ""
            }, function (index, layero) {
                loadGoods(type);
                layer.close(index);
            });
        });
    }

    function down(id, type) {
        layer.msg('正在提交，请稍后', {
            icon: 1,
            time: 3000 //2秒关闭（如果不配置，默认是3秒）
        });
        $.post("${dynamicURL }/admin/mainPageContent/move?type=2&id=" + id, function (data) {
            var title = data.success ? "操作成功！" : "操作失败，" + data.errorMsg;
            layer.confirm(title, {
                btn: ['确定', '取消'],
                title: ""
            }, function (index, layero) {
                loadGoods(type);
                layer.close(index);
            });
        });
    }

    function c_delete(id, type) {
        layer.msg('正在删除，请稍后', {
            icon: 1,
            time: 3000 //2秒关闭（如果不配置，默认是3秒）
        });
        $.post("${dynamicURL }/admin/mainPageContent/delete?id=" + id, function (data) {
            var title = data.success ? "操作成功！" : "操作失败，" + data.errorMsg;
            layer.confirm(title, {
                btn: ['确定', '取消'],
                title: ""
            }, function (index, layero) {
                loadGoods(type);
                layer.close(index);
            });
        });
    }

</script>


