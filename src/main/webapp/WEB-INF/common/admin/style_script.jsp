<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="dynamicURL" value="${pageContext.request.contextPath }"></c:set>

<!-- js-->
<script src="${dynamicURL}/later/js/jquery-1.11.1.min.js"></script>
<%--<script type="text/javascript" src="${dynamicURL}/js/jquery-1.8.3.js"></script>--%>
<script type="text/javascript" src="${dynamicURL}/js/jquery.form.js"></script>
<script type="text/javascript" src="${dynamicURL}/js/js.cookie.js"></script>

<!-- layui -->
<script src="${dynamicURL}/js/layer-v3.1.1/layer/layer.js" type="text/javascript"></script>

<!-- meta -->
<meta http-equiv="Content-Type" content="text/html;charset=UTF-8"/>
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width"/>

<script type="application/x-javascript">
    addEventListener("load", function () {
        setTimeout(hideURLbar, 0);
    }, false);

    function hideURLbar() {
        window.scrollTo(0, 1);
    }
</script>
<!-- Bootstrap Core CSS -->
<link href="${dynamicURL}/later/css/bootstrap.css" rel='stylesheet' type='text/css'/>
<!-- Custom CSS -->
<link href="${dynamicURL}/later/css/style.css" rel='stylesheet' type='text/css'/>
<!-- font CSS -->
<!-- font-awesome icons -->
<link href="${dynamicURL}/later/css/font-awesome.css" rel="stylesheet">
<!-- //font-awesome icons -->

<script src="${dynamicURL}/later/js/modernizr.custom.js"></script>
<!--webfonts-->
<%--<link href='http://fonts.useso.com/css?family=Roboto+Condensed:400,300,300italic,400italic,700,700italic'--%>
      <%--rel='stylesheet' type='text/css'>--%>
<!--//webfonts-->
<!--animate-->
<link href="${dynamicURL}/later/css/animate.css" rel="stylesheet" type="text/css" media="all">
<script src="${dynamicURL}/later/js/wow.min.js"></script>
<script>
    new WOW().init();
</script>
<!--//end-animate-->
<!-- chart -->
<script src="${dynamicURL}/later/js/Chart.js"></script>
<!-- //chart -->
<!--Calender-->
<link rel="stylesheet" href="${dynamicURL}/later/css/clndr.css" type="text/css"/>
<script src="${dynamicURL}/later/js/underscore-min.js" type="text/javascript"></script>
<script src="${dynamicURL}/later/js/moment-2.2.1.js" type="text/javascript"></script>
<!--End Calender-->
<!-- Metis Menu -->
<script src="${dynamicURL}/later/js/metisMenu.min.js"></script>
<script src="${dynamicURL}/later/js/custom.js"></script>
<link href="${dynamicURL}/later/css/custom.css" rel="stylesheet">
<!--//Metis Menu -->

<!-- Classie -->
<script src="${dynamicURL}/later/js/classie.js"></script>
<!--scrolling js-->
<script src="${dynamicURL}/later/js/jquery.nicescroll.js"></script>
<script src="${dynamicURL}/later/js/scripts.js"></script>
<!--//scrolling js-->
<!-- Bootstrap Core JavaScript -->
<script src="${dynamicURL}/later/js/bootstrap.js"> </script>

