<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml"
      xmlns:th="http://www.thymeleaf.org"
      xmlns:sec="http://www.thymeleaf.org/thymeleaf-extras-springsecurity3">
    <head>
        <title>意坚商城</title>
        <%--<%@ include file="../common/later/meta.jsp" %>--%>
        <%--<%@ include file="../common/later/style_script.jsp"%>--%>
    </head>

    <body>
    <section id="container" class="">
        <%--<%@include file="../common/later/header.jsp" %>--%>
        <sitemesh:write property='body' />
        <%--<%@include file="../common/later/footer.jsp" %>--%>
    </section>
    </body>
</html>
