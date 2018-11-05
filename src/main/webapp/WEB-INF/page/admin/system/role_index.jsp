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
        <div class="">
            <h1>
                角色列表
            </h1>
            <form method="post" class="form">
                <table class="table table-bordered">
                    <tbody>
                    <tr>
                        <td>角色ID：<input type="text" name="search_user_id" value=""></td>
                        <td>合计条件角色： <input type="text" name="search_total" value="" id="search_total"></td>
                        <td>   <!-- 按钮触发模态框 -->
                            <button class="btn btn-primary btn-sm" data-toggle="modal" data-target="#addUserModal">
                                添加角色
                            </button>
                        </td>
                    </tr>
                    <tr>
                        <td colspan="10" style=" text-align: center; padding: 10px; border: none">
                            <input type="submit" class="btn btn-default" value="搜索"/>&nbsp;&nbsp;<a
                                href="">默认</a>
                        </td>
                    </tr>
                    </tbody>
                </table>
            </form>
            总数（<b id="total_count"></b>）
            <table class="table table-hover table-bordered">
                <thead>
                <tr>
                    <th>角色名称</th>
                    <th>角色状态</th>
                    <th>操作</th>
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
                                        <label for="lastname" class="col-sm-3 control-label">角色名</label>
                                        <div class="col-sm-9">
                                            <input type="text" class="form-control" name="name" value=""
                                                   id="name" placeholder="角色名">
                                        </div>
                                    </div>
                                    <div class="form-group">
                                        <label for="lastname" class="col-sm-3 control-label">状态</label>
                                        <div class="col-sm-9">
                                            <select class="selectpicker" name="state" id="state">
                                                <option value="1">正常</option>
                                                <option value="0">禁用</option>
                                            </select>
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
        // 加载角色
        loadRole();
    });

    function loadRole() {
        $.post("${dynamicURL}/admin/role/tree", function (data) {
            $("#rid").empty();
            var dee = $("#rid");
            $.each(data, function (index, element) {
                dee.append("<option value='" + element.id + "'>" + element.name + "</option>");
            });
            $('#rid').selectpicker('refresh');
            $('#rid').selectpicker('render');
        });
    }

    function loadData(page) {
        $.post("${dynamicURL}/admin/role/list?status=0&page=" + page, function (data) {
            if (data.success) {
                var str = "";
                $.each(data.list, function (index, element) {
                    str += "    <tr>";
                    str += "        <td>" + element.name + "</td>";
                    str += "        <td>" + element.stateWapper + "</td>";
                    str += "        <td>";
                    str += "<button type=\"button\" class=\"btn btn-info\" data-toggle=\"modal\" onclick=\"return get_edit_info(" + element.id + ")\" data-target=\"#addUserModal\">编辑</button>";
                    str += "                        &nbsp;&nbsp;";
                    str += "                        <button type=\"button\" class=\"btn btn-danger\" onclick=\"return delete_info(" + element.id + ")\">删除</button>";
                    str += "        </td>";
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

    // 删除
    function delete_info(id) {
        if (!id) {
            layer.alert('Error！');
            return false;
        }
        layer.confirm("确定要删除该信息吗？", {
            btn: ['确定', '取消'],
            title: ""
        }, function (index, layero) {
            $.ajax({
                url: "${dynamicURL}/admin/role/delete",
                data: {"id": id},
                type: "post",
                beforeSend: function () {
                    return true;
                },
                success: function (data) {
                    if (data.success) {
                        layer.alert('操作成功');
                        loadData(1);
                    } else {
                        layer.alert('操作失败');
                    }
                },
                error: function () {
                    //alert('请求出错');
                },
                complete: function () {
                    // $('#tips').hide();
                }
            });
        });
        return false;
    }

    // 编辑表单
    function get_edit_info(user_id) {
        if (!user_id) {
            layer.confirm("请刷新页面！", {
                btn: ['确定', '取消'],
                title: ""
            }, function (index, layero) {
                location.reload();
            });
            return false;
        }
        $.ajax({
            url: "${dynamicURL}/admin/role/edit",
            data: {"id": user_id},
            type: "post",
            beforeSend: function () {
                return true;
            },
            success: function (data) {
                if (data.success) {
                    // 解析json数据
                    var data_obj = data.entity;
                    // 赋值
                    $("#id").val(data_obj.id);
                    $("#name").val(data_obj.name);
                    $("#state").val(data_obj.state);
                } else {
                    $("#tip").html("<span style='color:red'>失败，请重试</span>");
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

    // 提交表单
    function check_form() {
        var form_data = $('#form_data').serialize();
        // 异步提交数据到页面
        $.ajax({
            url: "${dynamicURL}/admin/role/save",
            data: form_data,
            type: "post",
            dataType: 'json',
            //contentType: false,
            //processData: false,
            beforeSend: function () {
                $("#tip").html("<span style='color:blue'>正在处理...</span>");
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
                $('#acting_tips').hide();
            }
        });
        return false;
    }

    $(function () {
        $('#addUserModal').on('hide.bs.modal', function () {
            location.reload();
        });
    });

</script>


