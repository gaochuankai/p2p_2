<%@ page language="java" contentType="text/html; UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN"
"http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="dynamicURL" value="${pageContext.request.contextPath }"></c:set>

<%--<script type="text/javascript" src="${dynamicURL }/later/js/form-validation-script.js"></script>--%>
<script type="text/javascript" src="${dynamicURL }/later/js/jquery.validate.min.js"></script>
<%--<script type="text/javascript" src="${dynamicURL }/later/js/bootstrap-treeview.js"></script>--%>
<script type="text/javascript" src="${dynamicURL }/layui-v2.4.3/layui/layui.js"></script>
<script type="text/javascript" src="${dynamicURL }/ckeditor5-build-classic/ckeditor.js"></script>


<style>
    body {
        padding-left: 10px;
        font-size: 13px;
    }

    h1 {
        font-size: 20px;
        font-family: Verdana;
    }

    h4 {
        font-size: 16px;
        margin-top: 25px;
        margin-bottom: 10px;
    }

    .description {
        padding-bottom: 30px;
        font-family: Verdana;
    }

    .description h3 {
        color: #CC0000;
        font-size: 16px;
        margin: 0 30px 10px 0px;
        padding: 45px 0 8px;
        /*background:url(titleback.png) no-repeat scroll left bottom transparent*/
        border-bottom: solid 1px #888;
    }
</style>

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
                    <header class="panel-heading">
                        Basic validations
                    </header>
                    <div class="panel-body">
                        <form role="form" class="form-horizontal tasi-form" action="${dynamicURL}/admin/goods/save"
                              method="post"  enctype="multipart/form-data">
                            <input type="hidden" name="id"/>
                            <div class="form-group has-success">
                                <label class="col-lg-2 control-label">商品名称</label>
                                <div class="col-lg-10">
                                    <input type="text" placeholder="" id="nameFromId" class="form-control" name="name">
                                    <p class="help-block" id="nameFromP"></p>
                                </div>
                            </div>
                            <div class="form-group has-error">
                                <label class="col-lg-2 control-label">商品价格</label>
                                <div class="col-lg-10">
                                    <input type="text" placeholder="" id="marketpriceFromId" class="form-control"
                                           name="marketprice">
                                    <p class="help-block" id="marketpriceFromP"></p>
                                </div>
                            </div>
                            <div class="form-group has-warning">
                                <label class="col-lg-2 control-label">折扣价格</label>
                                <div class="col-lg-10">
                                    <input type="text" placeholder="" id="estorepriceFromId" class="form-control"
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
                                    <input type="text" placeholder="" id="numFromId" class="form-control" name="num">
                                    <p class="help-block" id="numFromP"></p>
                                </div>
                            </div>
                            <div class="form-group has-warning">
                                <label class="col-lg-2 control-label">商品图片</label>
                                <div class="col-lg-10">
                                    <input type="file" placeholder="" id="titleimageFromId" class="file" data-show-preview="false" name="file">
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


                            <div class="form-group">
                                <div class="col-lg-offset-2 col-lg-10">
                                    <button class="btn btn-danger" type="submit" id="save">保存</button>
                                </div>
                            </div>
                        </form>
                    </div>
                </section>
            </div>
        </div>
        <!-- page end-->
    </section>
</section>
<!--main content end-->

<script type="text/javascript">

    var myEditor = null;
    window.onload = function(){
        ClassicEditor
            .create(document.querySelector("#descriptionFromId")
                , {
                    toolbar: ["undo", "redo", "|", "alignment", "bold", "italic", "blockQuote", "imageTextAlternative", "imageUpload", "heading", "link", "numberedList", "bulletedList"]
                },
                ckfinder: {
                    uploadUrl : '/admin/Upload/uploadImages?command=QuickUpload&type=Files&responseType=json'
                    //后端处理上传逻辑返回json数据,包括uploaded(选项true/false)和url两个字段
            })
            .then(editor => {
                myEditor = editor;
            })
            .catch(error => {
                console.error(error);
            });
    }


    $(function () {
        // 加载，左侧菜单列表
        loadMenu();

        categoryData();

        $("#select1").change(function () {
            var pid = $("#select1 option:selected").val();
            $("#select2").empty();
            var selDom = $("#select2");
            $.post("${dynamicURL}/admin/category/tree?pid="+pid, function (data) {
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


</script>


