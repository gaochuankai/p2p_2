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
<script type="text/javascript"
        src="${dynamicURL }/ckeditor5-build-classic/ckeditor.js"></script>

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
                商品列表
            </h1>
            <form method="post" class="form">
                <table class="table table-bordered">
                    <tbody>
                    <tr>
                        <td>商品名称：<input type="text" name="search_user_id" value=""></td>
                        <td>合计条件商品： <input type="text" name="search_total" value="" id="search_total"></td>
                        <td>   <!-- 按钮触发模态框 -->
                            <button class="btn btn-primary btn-sm" data-toggle="modal" data-target="#addUserModal">
                                添加商品
                            </button>
                        </td>
                    </tr>
                    <tr>
                        <td colspan="10" style=" text-align: center; padding: 10px; border: none">
                            <input type="submit" class="btn btn-default" value="搜索"/>
                            &nbsp;&nbsp;
                            <a href="javascript:void(0)" onclick="location.reload();">默认</a>
                        </td>
                    </tr>
                    </tbody>
                </table>
            </form>
            总数（<b id="total_count"></b>）
            <table class="table table-hover table-bordered">
                <thead>
                <tr>
                    <th>商品名称</th>
                    <th>商品图片</th>
                    <th>商品数量</th>
                    <th>商品价格</th>
                    <th>折扣价格</th>
                    <th>操作</th>
                </tr>
                </thead>
                <!-- BEGIN list -->
                <tbody id="result">
                </tbody>
            </table>
            <div id="Paginator" style="text-align: center">
                <ul id="pageLimit"></ul>
            </div>

            <!-- 模态框示例（Modal） -->
            <form method="post" action="" class="form-horizontal" role="form" enctype="multipart/form-data"
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
                                    用户信息
                                </h4>
                            </div>
                            <div class="modal-body">
                                <form class="form-horizontal" role="form" method="post" id="form-entity"
                                      enctype="multipart/form-data">
                                    <input type="hidden" name="id" id="idFromId"/>
                                    <div class="form-group has-success">
                                        <label class="col-lg-2 control-label">商品名称</label>
                                        <div class="col-lg-10">
                                            <input type="text" placeholder="" id="nameFromId" class="form-control"
                                                   name="name">
                                            <p class="help-block" id="nameFromP"></p>
                                        </div>
                                    </div>
                                    <div class="form-group has-error">
                                        <label class="col-lg-2 control-label">商品价格</label>
                                        <div class="col-lg-10">
                                            <input type="text" placeholder="" id="marketpriceFromId"
                                                   class="form-control"
                                                   name="marketprice">
                                            <p class="help-block" id="marketpriceFromP"></p>
                                        </div>
                                    </div>
                                    <div class="form-group has-warning">
                                        <label class="col-lg-2 control-label">折扣价格</label>
                                        <div class="col-lg-10">
                                            <input type="text" placeholder="" id="estorepriceFromId"
                                                   class="form-control"
                                                   name="estoreprice">
                                            <p class="help-block" id="estorepriceFromP"></p>
                                        </div>
                                    </div>
                                    <div class="form-group ">
                                        <label class="col-lg-2 control-label">商品类型</label>
                                        <div class="col-lg-10">
                                            <select id="select1">
                                                <option class="selected" value="0">无</option>
                                            </select>
                                            <select id="select2">
                                                <option class="selected" value="0">无</option>
                                            </select>
                                            <input type="hidden" name="category_id" id="category_idFromId" value=""/>
                                            <p class="help-block" id="category_idFromP"></p>
                                        </div>
                                    </div>
                                    <div class="form-group has-warning">
                                        <label class="col-lg-2 control-label">商品数量</label>
                                        <div class="col-lg-10">
                                            <input type="text" placeholder="" id="numFromId" class="form-control"
                                                   name="num">
                                            <p class="help-block" id="numFromP"></p>
                                        </div>
                                    </div>
                                    <div class="form-group has-warning">
                                        <label class="col-lg-2 control-label">商品图片</label>
                                        <div class="col-lg-10">
                                            <input type="file" placeholder="" id="titleimageFromId" class="file"
                                                   data-show-preview="false" name="file">
                                            <p class="help-block"></p>
                                        </div>
                                    </div>
                                    <div class="form-group has-warning">
                                        <label class="col-lg-2 control-label">商品状态</label>
                                        <div class="col-lg-10">
                                            <input type="text" placeholder="" id="statusFromId" class="form-control"
                                                   name="status">
                                            <p class="help-block" id="statusFromP"></p>
                                        </div>
                                    </div>
                                    <div class="form-group has-warning">
                                        <label class="col-lg-2 control-label">商品描述</label>
                                        <div class="col-lg-10">
                                            <textarea name="description" id="descriptionFromId"/></textarea>
                                            <p class="help-block" id="descriptionFromP"></p>
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

    var myEditor = null;
    window.onload = function () {
        ClassicEditor.create(document.querySelector("#descriptionFromId"), {
            toolbar: ["undo", "redo", "|", "alignment", "bold", "italic", "blockQuote", "imageTextAlternative", "imageUpload", "heading", "link", "numberedList", "bulletedList"],
            ckfinder: {
                uploadUrl: '${dynamicURL}/admin/goods/uploadImages?command=QuickUpload&type=Files&responseType=json'
                //后端处理上传逻辑返回json数据,包括uploaded(选项true/false)和url两个字段
            }
        }).then(editor => {
            window.editor = editor;
        myEditor = editor.getData();
        console.log(myEditor);
    }).
        catch(error => {
            console.error(error);
    })
        ;
    }

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
            });
        });

        $("#select2").change(function () {
            var pid = $("#select2 option:selected").val();
            $("#category_idFromId").val(pid);
        });
    });

    function categoryData() {
        var selDom = $("#select1");
        var tree;
        $.post("${dynamicURL}/admin/category/tree", function (data) {
            $.each(data, function (i, e) {
                selDom.append("<option value='" + e.id + "'>" + e.type + "</option>");//添加option
            });
        });
        $("#select1").change();
    }

    function loadData(page) {
        $.post("${dynamicURL}/admin/goods/list?page=" + page, function (data) {
            if (data.success) {
                var str = "";
                $.each(data.list, function (index, element) {
                    str += "<tr>";
                    str += "    <td>" + element.name + "</td>";
                    str += "    <td>";
                    str += "        <img src='${dynamicURL}/" + element.titleimage + "' width='90' height='90' />";
                    str += "    </td>";
                    str += "    <td>" + element.num + "</td>";
                    str += "    <td>" + element.marketprice + "</td>";
                    str += "    <td>" + element.estoreprice + "</td>";
                    str += "    <td>";
                    str += "        <button type='button' class='btn btn-info' data-toggle='modal' onclick='return get_edit_info(" + element.id + ")' data-target='#addUserModal'>编辑</button>";
                    str += "        &nbsp;&nbsp;";
                    str += "        <button type='button' class='btn btn-danger' onclick='return delete_info(" + element.id + ")'>删除</button>";
                    str += "    </td>";
                    str += "</tr>";
                });
                str += "</table>";
                $("#result").html(str);
                $("#search_total").val(data.page.total);
                $("#total_count").html(data.page.total);
                totalPagesCurrent = data.page.end;
                if (page == 1) {
                    loadPage();
                }
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
                url: "${dynamicURL}/admin/goods/delete",
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
                        layer.alert('操作失败' + data.errorMsg);
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
            url: "${dynamicURL}/admin/goods/edit",
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
                    $("#idFromId").val(data_obj.id);
                    $("#nameFromId").val(data_obj.name);
                    $("#marketpriceFromId").val(data_obj.marketprice);
                    $("#estorepriceFromId").val(data_obj.estoreprice);
                    $("#category_idFromId").val(data_obj.category_id);
                    $("#numFromId").val(data_obj.num);
                    $("#statusFromId").val(data_obj.status);
                    myEditor.setData(data_obj.description);
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
        var formData = new FormData($("#form_data")[0]);
        // 异步提交数据到页面
        $.ajax({
            url: "${dynamicURL}/admin/goods/save",
            data: formData,
            type: "post",
            dataType: 'json',
            async: false,
            contentType: false,
            processData: false,
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
                    layer.confirm("保存失败！", {
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


