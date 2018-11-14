<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="dynamicURL" value="${pageContext.request.contextPath}"></c:set>


<script type="text/javascript"
        src="${dynamicURL }/later/assets/bootstrap-paginator-master/src/bootstrap-paginator.js"></script>

<div id="page-wrapper">
    <div class="main-page">
        <div class="panel-body widget-shadow">
            <table class="table">
                <tr>
                    <td>时间</td>
                    <td>
                        <input type="date" id="starttimeFormId"/>
                    </td>
                    <td>至</td>
                    <td>
                        <input type="date" id="endtimeFormId"/>
                    </td>
                    <td>投资人</td>
                    <td>
                        <input type="text" name="createUserName" id="createUserNameFormId"/>
                    </td>
                </tr>
                <tr>
                    <td>金额</td>
                    <td>
                        <input type="number" placeholder="最低值" id="startmoneyFormId"/>
                    </td>
                    <td>至</td>
                    <td>
                        <input type="number" placeholder="最高值" id="endmoneyFormId"/>
                    </td>
                    <td></td>
                    <td>
                        <button type="button" class="btn btn-primary" onclick="loadTenderData(1)">查询</button>
                        <button type="button" class="btn btn-primary" onclick="clean()">重置</button>
                    </td>
                </tr>
            </table>
        </div>
        <div class="panel-body widget-shadow">
            <h4>标 列表:</h4>
            <table class="table">
                <thead>
                <tr>
                    <th>#</th>
                    <th>金额</th>
                    <%--<th>状态</th>--%>
                    <th>交易时间</th>
                    <th>投资人</th>
                </tr>
                </thead>
                <tbody id="detailList">
                </tbody>
            </table>
        </div>
        <nav style="text-align: center" id="Paginator">
            <h4 id="pageCount"></h4>
            <ul class="pagination" id="pageLimit"></ul>
        </nav>
    </div>
</div>

<script type="text/javascript">
    var totalPagesCurrent = 1;

    $(function () {
        // 加载第一页的数据
        loadTenderData(1);
        // 加载分页
        loadPage();
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
            }, onPageClicked: function (event, originalEvent, type, page) {//给每个页眉绑定一个事件，其实就是ajax请求，其中page变量为当前点击的页上的数字。
                loadTenderData(page);
            }
        });
    }

    function loadTenderData(page) {
        $.ajax({
            url: "${dynamicURL }/admin/tender/details/list",//请求路径
            type: "POST",//请求类型
            dataType: "JSON",//服务器响应数据类型
            data: {
                "page": page,
                "starttime": $('#starttimeFormId').val(),
                "endtime": $('#endtimeFormId').val(),
                "createUserName": $('#createUserNameFormId').val(),
                "startmoney": $('#startmoneyFormId').val(),
                "endmoney": $('#endmoneyFormId').val(),
                "tenderid": '${tenderid}'
            },//参数
            success: function (data) {
                var str = '';
                $.each(data.list, function (index, t) {
                    str += '<tr>';
                    str += '<th scope="row">' + (index + 1) + '</th>';
                    str += '    <td>' + t.dealmoney + '</td>';
                    // str += '    <td>' + t.statusWapper + '</td>';
                    str += '    <td>' + t.createtime + '</td>';
                    str += '    <td>' + t.createUserName + '</td>';
                    str += '</th>';
                    str += '<tr>';
                });
                $("#detailList").html(str);
                totalPagesCurrent = data.page.end;
                $("#pageCount").html("总共" + data.page.total + "条数据");
                if (page == 1) {
                    loadPage();
                }
            },//请求成功后回调
            error: function (data) {

            }//请求失败后回调
        });
    }

    function clean() {
        $('#starttimeFormId').val("");
        $('#endtimeFormId').val("");
        $('#createUserNameFormId').val("");
        $('#startmoneyFormId').val("");
        $('#endmoneyFormId').val("");
        $('#statusFormId').val(-1);
        loadTenderData(1);
    }


</script>


