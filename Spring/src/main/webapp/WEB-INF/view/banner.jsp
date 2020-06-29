<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>



<html lang="pl">
<head>
<meta charset="utf-8">
 <title>Ksiegarnia-Euforia</title>
     <meta name="author" content="Rafal Zdaniuk">
     <meta http-equiv="X-Ua-Compatible" content="IE=edge,chrome=1">
     <link href="<c:url value="/resources/style.css" />" rel="stylesheet">

    <title>Ksiegarnia</title>

</head>




<body>
<sec:authentication var="user" property="principal" />


<div id="login">
<c:choose>
  <c:when test="${pageContext.request.userPrincipal.authenticated}">
    <p>
        <form  action="<%=request.getContextPath()%>/logout" method="post" >
                <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}" />
                <input type="submit" value="logout" />
        </form>
    </p>
  </c:when>
  <c:otherwise>
  <a class="as" href="${pageContext.request.contextPath}/login">Zaloguj</a>
  <a class="as" href="${pageContext.request.contextPath}/register">Rejestracja</a>
  </c:otherwise>
</c:choose>
</div>

            <div id="baner">

                <span id="tytuł">EUFORIA </span>
                <span><b> - Twoja księgarnia internetowa</b></span>

                <div id="obrazek1">



                </div>

            </div>

