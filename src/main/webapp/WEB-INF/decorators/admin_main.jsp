<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml"
      xmlns:th="http://www.thymeleaf.org"
      xmlns:sec="http://www.thymeleaf.org/thymeleaf-extras-springsecurity3">
<head>
    <title>十七金融</title>
    <%@ include file="../common/admin/meta.jsp" %>
    <%@ include file="../common/admin/style_script.jsp" %>
</head>

<body>
<div id="container" class="cbp-spmenu-push">
    <%@include file="../common/admin/header.jsp" %>
    <div class="main-content">
        <sitemesh:write property='body'/>
        <%@include file="../common/admin/footer.jsp" %>
    </div>
</div>
</body>
</html>
