<%@ page language="java" contentType="text/html; UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN"
"http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="dynamicURL" value="${pageContext.request.contextPath }"></c:set>

<script type="text/javascript"
        src="${dynamicURL}/css/bootstrap/bootstrap-4.0.0-dist/js/bootstrap.js"></script>
<script type="text/javascript"
        src="${dynamicURL}/css/bootstrap/bootstrap-4.0.0-dist/js/bootstrap.bundle.js"></script>
<script type="text/javascript"
        src="${dynamicURL }/later/assets/bootstrap-paginator-master/src/bootstrap-paginator.js"></script>

<link rel="stylesheet" href="${dynamicURL}/css/bootstrap/bootstrap-4.0.0-dist/css/bootstrap.css" />
<link rel="stylesheet" href="${dynamicURL}/css/bootstrap/bootstrap-4.0.0-dist/css/bootstrap-grid.css" />
<link rel="stylesheet" href="${dynamicURL}/css/bootstrap/bootstrap-4.0.0-dist/css/bootstrap-reboot.css" />

<div class="container" id="">
    <div class="row">
        <div class="col-sm">
            <label>
                <span>用户名</span>
                <input name="username" type="text" id="usernameFromId" />
            </label>
        </div>
        <div class="col-sm">
            <label>
                <span>邮箱</span>
                <input name="email" type="text" id="emailFromId" />
            </label>
        </div>
        <div class="col-sm">
            <label>
                <span>电话</span>
                <input name="telephone" type="text" id="telephoneFromId" />
            </label>
        </div>
        <div class="col-sm">
            <button type="button" onclick="loadUserData(1);">查询</button>
            <button type="button" onclick="export2()">导出</button>
        </div>
    </div>
    <!-- <div class="row">
        <div class="col-sm">
            One of three columns
        </div>
        <div class="col-sm">
            One of three columns
        </div>
        <div class="col-sm">
            One of three columns
        </div>
    </div> -->
</div>

<div class="container" id="detailList">
    <div class="row">
        <div class="col-sm">
            One of three columns
        </div>
        <div class="col-sm">
            One of three columns
        </div>
        <div class="col-sm">
            One of three columns
        </div>
    </div>
</div>
<div id="Paginator" style="text-align: center">
    <ul id="pageLimit"></ul>
</div>


<script>
    var totalPagesCurrent = 1;

    $(function(){
        // 加载用户列表
        loadUserData(1);
        // 加载分页
        loadPage();
    });

    function export2(){
        var username = $('#usernameFromId').val();
        var email = $('#emailFromId').val();
        var telephone = $('#telephoneFromId').val();
        var url = "${dynamicURL}/front/user/export";
        url += "?username=" + username + "&email=" + email + "&telephone=" + telephone;
        window.location.href = url;
    }

    function loadUserData(page){
        $.ajax({
            url: "${dynamicURL }/front/user/list",//请求路径
            type: "POST",//请求类型
            dataType: "JSON",//服务器响应数据类型
            data: {
                "page": page,
                "username": $('#usernameFromId').val(),
                "email": $('#emailFromId').val(),
                "telephone": $('#telephoneFromId').val()
            },//参数
            success: function (data) {
                var str = '';
                str += '<div class="row">';
                str += '    <div class="col-sm">用户名</div>';
                str += '    <div class="col-sm">邮箱</div>';
                str += '    <div class="col-sm">电话</div>';
                str += '    <div class="col-sm">状态</div>';
                str += '    <div class="col-sm">注册时间</div>';
                str += '</div>';
                $.each(data.list, function (index, t) {
                    str += '<div class="row">';
                    str += '    <div class="col-sm">' + t.username + '</div>';
                    str += '    <div class="col-sm">' + t.email + '</div>';
                    str += '    <div class="col-sm">' + t.telephone + '</div>';
                    str += '    <div class="col-sm">' + t.enableWapper + '</div>';
                    str += '    <div class="col-sm">' + t.createtime + '</div>';
                    str += '</div>';
                });
                $("#detailList").html(str);
                totalPagesCurrent = data.page.end;
                if (page == 1) {
                    loadPage();
                }
            },//请求成功后回调
            error: function (data) {

            }//请求失败后回调
        });
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
                loadUserData(page);
            }
        });
}

</script>
