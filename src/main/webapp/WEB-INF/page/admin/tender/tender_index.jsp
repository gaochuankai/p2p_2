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
                    <td>标题</td>
                    <td>
                        <input type="text" name="title" id="titleFormId"/>
                    </td>
                    <td>
                        <select style="width: 100px;" id="statusFormId">
                            <option value="-1">全部</option>
                            <option value="0">未发标</option>
                            <option value="1">投标中</option>
                            <option value="2">流标</option>
                            <option value="3">还款中</option>
                            <option value="4">完成</option>
                        </select>
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
                    <td>描述</td>
                    <td>
                        <input type="text" name="description" id="descriptionFormId"/>
                    </td>
                    <td>
                        <button type="button" class="btn btn-primary" onclick="loadTenderData(1)">查询</button>
                        <button type="button" class="btn btn-primary" onclick="clean()">重置</button>
                        <button type="button" class="btn btn-primary" onclick="exportExcel()">导出</button>
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
                    <th>标题</th>
                    <th>总金额</th>
                    <th>状态</th>
                    <th>创建时间</th>
                </tr>
                </thead>
                <tbody id="detailList">
                </tbody>
            </table>
        </div>
        <nav style="text-align: center" id="Paginator">
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
            url: "${dynamicURL }/admin/tender/list",//请求路径
            type: "POST",//请求类型
            dataType: "JSON",//服务器响应数据类型
            data: {
                "page": page,
                "starttime": $('#starttimeFormId').val(),
                "endtime": $('#endtimeFormId').val(),
                "title": $('#titleFormId').val(),
                "startmoney": $('#startmoneyFormId').val(),
                "endmoney": $('#endmoneyFormId').val(),
                "description": $('#descriptionFormId').val(),
                "status": $('#statusFormId').val()
            },//参数
            success: function (data) {
                var str = '';
                $.each(data.list, function (index, t) {
                    str += '<tr>';
                    str += '<th scope="row">' + (index + 1) + '</th>';
                    str += '    <td>' + t.title + '</td>';
                    str += '    <td>' + t.allmoney + '</td>';
                    str += '    <td>' + t.statusWapper + '</td>';
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

    function clean() {
        $('#starttimeFormId').val("");
        $('#endtimeFormId').val("");
        $('#titleFormId').val("");
        $('#startmoneyFormId').val("");
        $('#endmoneyFormId').val("");
        $('#descriptionFormId').val("");
        $('#statusFormId').val(-1);
        loadTenderData(1);
    }

    function exportExcel() {
        var starttime = $('#starttimeFormId').val();
        var endtime = $('#endtimeFormId').val();
        var title = $('#titleFormId').val();
        var startmoney = $('#startmoneyFormId').val();
        var endmoney = $('#endmoneyFormId').val();
        var description = $('#descriptionFormId').val();
        var status = $('#statusFormId').val();
        var url = "${dynamicURL}/admin/tender/export";
        url += "?starttime=" + starttime + "&endtime=" + endtime + "&title=" + title;
        url += "&startmoney=" + startmoney + "&endmoney=" + endmoney;
        url += "&description=" + description + "&status=" + status;
        window.location.href = url;
    }

</script>

