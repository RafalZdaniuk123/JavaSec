<%@ include file="banner.jsp" %>
<div style="border-bottom: 1px solid #bbb;
             border-top: 1px solid #bbb;
             position: -webkit-sticky;
             position: sticky;">

    <ol>
        <li><a href="${pageContext.request.contextPath}">Strona głowna</a></li>

        <li>

            <sec:authorize access="hasRole('ROLE_ADMIN') and isAuthenticated()">
                <a href="${pageContext.request.contextPath}/admin">Katalog</a>
            </sec:authorize>
            <sec:authorize access="hasRole('ROLE_USER') and isAuthenticated()">
                <a href="${pageContext.request.contextPath}/user">Katalog</a>
            </sec:authorize>
            <sec:authorize access="!isAuthenticated()">
                <a href="${pageContext.request.contextPath}/books/list">Katalog</a>
            </sec:authorize>
        </li>
        <li>
            <a href="${pageContext.request.contextPath}/authors/list">Autorzy</a>

        </li>
        <li>

            <sec:authorize access="hasRole('ROLE_USER') and isAuthenticated()">
                <a>Gatunek</a>
            </sec:authorize>
            <sec:authorize access="!isAuthenticated()">
                <a>Gatunek</a>
            </sec:authorize>
            <sec:authorize access="hasRole('ROLE_ADMIN') and isAuthenticated()">
                <a href="${pageContext.request.contextPath}/categories/list">Gatunek</a>
            </sec:authorize>
            <ul>
                <c:forEach var="category" items="${categories}" >
                    <c:url var="show" value="/books/filterList">
                        <c:param name="categoryId" value="${category.id}"/>
                    </c:url>
                    <li> <a href="${show}">${category.nazwa}</a> </li>
                </c:forEach>
            </ul>
        </li>
        <li><a>Kontakt</a>
        </li>
        <li><a>O księgarni</a>
        </li>
        <li> <sec:authorize access="hasRole('ROLE_ADMIN') and isAuthenticated()">
            <a href="${pageContext.request.contextPath}/order/listAdmin">Lista zamówień</a>
        </sec:authorize></li>
    </ol>
</div>
<h3>Logowanie</h3>

<c:if test="${(param.error != null) && (not empty
SPRING_SECURITY_LAST_EXCEPTION)}">
    <p><c:out value="${SPRING_SECURITY_LAST_EXCEPTION.message}"/></p>
</c:if>
<form:form method="post">
    <table class="logowanieTab">

        <tr>
            <td><label for="username">Nazwa:</label></td>
            <td><input type="text" id="username" name="username" class="formcontrol"/></td>
        </tr>
        <tr>
            <td><label for="password">Hasło:</label></td>
            <td><input type="password" id="password" name="password"
                       class="form-control"/></td>
        </tr>
        <tr>
            <td>
                <button type="submit" >Zaloguj</button>
            </td>
        </tr>

    </table>
</form:form>
</body>
</html>
