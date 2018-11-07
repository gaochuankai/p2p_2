<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml"
      xmlns:th="http://www.thymeleaf.org"
      xmlns:sec="http://www.thymeleaf.org/thymeleaf-extras-springsecurity3">
    <head>
        <title>十七金融</title>
        <%@ include file="../common/front/meta.jsp" %>
        <%@ include file="../common/front/style_script.jsp"%>
    </head>

    <body>
        <%@include file="../common/front/head.jsp" %>
        <div id="content">
            <sitemesh:write property='body' />
        </div>
        <%@include file="../common/front/foot.jsp" %>
    </body>
</html>
