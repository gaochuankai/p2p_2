<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml"
      xmlns:th="http://www.thymeleaf.org"
      xmlns:sec="http://www.thymeleaf.org/thymeleaf-extras-springsecurity3">
    <head>
        <title>意坚商城</title>
        <%--<%@ include file="../common/meta.jsp" %>--%>
        <%--<%@ include file="../common/style_script.jsp"%>--%>
    </head>

    <body>
        <%--<%@include file="../common/header.jsp" %>--%>
        <div id="content">
            <sitemesh:write property='body' />
        </div>
        <%--<%@include file="../common/footer.jsp" %>--%>
    </body>
</html>
