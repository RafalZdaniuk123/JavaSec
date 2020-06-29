<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<html>
<head>
    <title>categories</title>
</head>
<body>
ADD CATEGORY
<form:form action="saveCategory" modelAttribute="category" method="POST">
    <table>
        <tbody>
        <tr>
            <td><label for="nazwa">nazwa:</label></td>
            <td><form:input path="nazwa" id="nazwa"/></td>
        </tr>
        <tr>
            <td><form:hidden path="id"/></td>
        </tr>
        <tr>
            <td>
                <button type="submit">Zapisz</button>
            </td>
        </tr>
        </tbody>
    </table>
</form:form>
</body>
</html>

