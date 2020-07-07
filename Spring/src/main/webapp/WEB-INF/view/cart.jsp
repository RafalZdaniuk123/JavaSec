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
                            <li><a>Gatunek</a>

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
<h2>Koszyk:</h2>
<div>
    <table class="tableList">
        <tr>

            <th>Nazwa</th>
            <th>Cena</th>
            <th>Kategoria</th>
            <th>Data</th>
            <th>Usuń</th>

        </tr>

        <c:forEach var="product" items="${products}" >



            <c:url var="delete" value="/cart/deleteProduct">
                <c:param name="prodId" value="${product.id}"/>
            </c:url>
             <c:url var="addToOrder" value="/order/addToOrder">

                        </c:url>

            <tr>

                <tr>

                         </tr>
                <td>${product.nazwa}</td>
                <td>${product.cena}</td>
                <td>${product.kategoria}</td>
                <td>${product.data}</td>
                <td><a class="as" href="${delete}">usuń</a></td>

            </tr>

        </c:forEach>
        <tr> <td></td> <td>
        <c:set var="total" value="${0}"/>
        <c:forEach var="product" items="${products}">
            <c:set var="total" value="${total + product.cena}" />
        </c:forEach>
        <b>RAZEM: ${total} zł</b>

    </table>
</div>
 <td><a class="as" href="${addToOrder}">Dodaj do zamowien</a></td




</body>
</html>