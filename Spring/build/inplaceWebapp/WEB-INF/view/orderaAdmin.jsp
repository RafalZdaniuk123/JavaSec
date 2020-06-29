<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html>
<head>
    <title>Twój koszyk</title>
</head>
<body>
<h2>Koszyk:</h2>
<div>
    <table>
        <tr>

            <th>Nazwa</th>
            <th>Cena</th>
            <th>Kategoria</th>
            <th>Data</th>
            <th>Status</th>

        </tr>

        <c:forEach var="order" items="${orders}" >

            <tr>

                <tr>
                                    <td><form:hidden path="id"/></td>
                         </tr>
                   <td>${order.nazwa}</td>
                   <td>${order.cena}</td>
                   <td>${order.kategoria}</td>
                   <td>${order.data}</td>
                   <td>${order.status}</td>

            </tr>
        </c:forEach>
    </table>
</div>
 <a href="${pageContext.request.contextPath}/admin" >Wroc do admina</a>

</body>
</html>