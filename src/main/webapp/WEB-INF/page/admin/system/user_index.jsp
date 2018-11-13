<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="dynamicURL" value="${pageContext.request.contextPath}"></c:set>


<script type="text/javascript"
        src="${dynamicURL }/later/assets/bootstrap-paginator-master/src/bootstrap-paginator.js"></script>

<div id="page-wrapper">
	<div class="main-page">
        <div class="panel-body widget-shadow">
            <h4>用户列表:</h4>
            <table class="table">
                <thead>
                    <tr>
                      <th>#</th>
                      <th>用户名</th>
                      <th>邮箱</th>
                      <th>电话</th>
                      <th>状态</th>
                      <th>注册时间</th>
                    </tr>
                </thead>
                <tbody id="detailList">
                </tbody>
            </table>
        </div>
        <nav  style="text-align: center" id="Paginator">
            <ul class="pagination" id="pageLimit">
                <!-- <li><a href="#" aria-label="Previous"><span aria-hidden="true">«</span></a></li>
                <li><a href="#">1</a></li>
                <li><a href="#">2</a></li>
                <li><a href="#">3</a></li>
                <li><a href="#">4</a></li>
                <li><a href="#">5</a></li>
                <li><a href="#" aria-label="Next"><span aria-hidden="true">»</span></a></li> -->
            </ul>
        </nav>
    </div>
</div>


<script type="text/javascript">
    var totalPagesCurrent = 1;

    $(function () {
        // 加载第一页的数据
        loadUserData(1);
        // 加载分页
        loadPage();
        // 加载角色
        //loadRole();
    });

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
                $.each(data.list, function (index, t) {
                    str += '<tr>';
                    str += '<th scope="row">' + (index + 1) + '</th>';
                    str += '    <td>' + t.username + '</td>';
                    str += '    <td>' + t.email + '</td>';
                    str += '    <td>' + t.telephone + '</td>';
                    str += '    <td>' + t.enableWapper + '</td>';
                    str += '    <td>' + t.createtime + '</td>';
                    str += '</th>';
                    str += '<tr>';
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

</script>
