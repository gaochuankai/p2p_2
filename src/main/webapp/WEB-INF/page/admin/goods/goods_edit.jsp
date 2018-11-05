<%@ page language="java" contentType="text/html; UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN"
"http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="dynamicURL" value="${pageContext.request.contextPath }"></c:set>


<script type="text/javascript" src="${dynamicURL }/later/js/form-validation-script.js"></script>
<script type="text/javascript" src="${dynamicURL }/later/js/jquery.validate.min.js"></script>


<!--sidebar start-->
<aside>
    <div id="sidebar" class="nav-collapse ">
        <!-- sidebar menu start-->
        <ul class="sidebar-menu">
            <li class="">
                <a class="" href="index.html">
                    <i class="icon-dashboard"></i>
                    <span>Dashboard</span>
                </a>
            </li>
            <li class="sub-menu active">
                <a href="javascript:;" class="">
                    <i class="icon-book"></i>
                    <span>商品管理</span>
                    <span class="arrow"></span>
                </a>
                <ul class="sub">
                    <li><a class="" href="${dynamicURL }/admin/goods">商品列表</a></li>
                    <li class="active"><a class="" href="${dynamicURL }/admin/goods/toAddGoods">添加商品</a></li>
                </ul>
            </li>
        </ul>
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
                        <form role="form" class="form-horizontal tasi-form" action="${dynamicURL}/admin/goods/save">
                            <input type="hidden" name="id"/>
                            <div class="form-group has-success">
                                <label class="col-lg-2 control-label">商品名称</label>
                                <div class="col-lg-10">
                                    <input type="text" placeholder="" id="nameFromId" class="form-control" name="name" value="${t.name}">
                                    <p class="help-block" id="nameFromP"></p>
                                </div>
                            </div>
                            <div class="form-group has-error">
                                <label class="col-lg-2 control-label">商品价格</label>
                                <div class="col-lg-10">
                                    <input type="text" placeholder="" id="marketpriceFromId" class="form-control" name="marketprice" value="${t.marketprice}">
                                    <p class="help-block" id="marketpriceFromP"></p>
                                </div>
                            </div>
                            <div class="form-group has-warning">
                                <label class="col-lg-2 control-label">折扣价格</label>
                                <div class="col-lg-10">
                                    <input type="text" placeholder="" id="estorepriceFromId" class="form-control" name="estoreprice" value="${t.estoreprice}">
                                    <p class="help-block" id="estorepriceFromP"></p>
                                </div>
                            </div>
                            <div class="form-group ">
                                <label class="col-lg-2 control-label">商品类型</label>
                                <div class="col-lg-10">
                                    <select></select>
                                    <p class="help-block" id="category_idFromP"></p>
                                </div>
                            </div>
                            <div class="form-group has-warning">
                                <label class="col-lg-2 control-label">商品数量</label>
                                <div class="col-lg-10">
                                    <input type="text" placeholder="" id="numFromId" class="form-control" name="num"  value="${t.num}">
                                    <p class="help-block" id="numFromP"></p>
                                </div>
                            </div>
                            <div class="form-group has-warning">
                                <label class="col-lg-2 control-label">商品图片</label>
                                <div class="col-lg-10">
                                    <input type="text" placeholder="" id="titleimageFromId" class="form-control" name="titleimage"  value="${t.titleimage}">
                                    <p class="help-block"></p>
                                </div>
                            </div>
                            <div class="form-group has-warning">
                                <label class="col-lg-2 control-label">商品状态</label>
                                <div class="col-lg-10">
                                    <input type="text" placeholder="" id="statusFromId" class="form-control" name="status"  value="${t.status}">
                                    <p class="help-block" id="statusFromP"></p>
                                </div>
                            </div>
                            <div class="form-group has-warning">
                                <label class="col-lg-2 control-label">商品描述</label>
                                <div class="col-lg-10">
                                    <input type="text" placeholder="" id="descriptionFromId" class="form-control" name="description"  value="${t.description}">
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

    $(function () {


        <%--$("#save").click(function (e) {--%>
        <%--var count = 0;--%>
        <%--$.each($(".has-error") ,function (i,e) {--%>
        <%--count += count + 1;--%>
        <%--});--%>

        <%--if (count == 0) {--%>
        <%--$("#loginForm").ajaxForm(function () {--%>
        <%--var username = $("#username").val();--%>
        <%--var password = $("#password").val();--%>
        <%--var remenber = $("#isRememberUsername").val();--%>
        <%--var inputcode = $("#captcha").val();--%>
        <%--$.ajax({--%>
        <%--type: 'post',--%>
        <%--url: '${dynamicURL}/admin/goods/save',--%>
        <%--dataType: 'json',--%>
        <%--data: {--%>
        <%--"username": username,--%>
        <%--"password": password,--%>
        <%--"saveUserName": remenber,--%>
        <%--"code": inputcode--%>
        <%--},--%>
        <%--success: function (data) {--%>
        <%--if (data.success) {--%>
        <%--window.location.href = "${dynamicURL }/admin/main";--%>
        <%--} else {--%>
        <%--layer.confirm("登录失败！" + data.errorMsg, {--%>
        <%--btn: ['找回密码', '重新登录'],--%>
        <%--title: ""--%>
        <%--}, function (index, layero) {--%>
        <%--window.location.href = "${dynamicURL }/forget";--%>
        <%--}, function (index) {--%>
        <%--window.location.href = "${dynamicURL }/login/toAdminPage";--%>
        <%--});--%>
        <%--}--%>
        <%--}--%>
        <%--});--%>
        <%--});--%>
        <%--} else {--%>
        <%--return false;--%>
        <%--}--%>
        <%--});--%>
    });

</script>


