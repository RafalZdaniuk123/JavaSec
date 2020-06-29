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
            <tH>Usuń</th>
        </tr>

        <c:forEach var="order" items="${products}" >



            <c:url var="delete" value="/cart/deleteProduct">
                <c:param name="prodId" value="${product.id}"/>
            </c:url>
             <c:url var="addToOrder" value="/cart/addToOrder">

                        </c:url>
            <tr>

                <tr>
                                    <td><form:hidden path="id"/></td>
                         </tr>
                <td>${product.nazwa}</td>
                <td>${product.cena}</td>
                <td>${product.kategoria}</td>
                <td>${product.data}</td>
                <td><a href="${delete}">usuń</a></td>
            </tr>
        </c:forEach>
    </table>
</div>
 <td><a href="${addToOrder}">Dodaj do zamowien</a></td>

</body>
</html>