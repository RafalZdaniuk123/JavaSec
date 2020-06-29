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
<h2>Ksiazki:</h2>
<div>
    <table class="tableList">
        <tr>

            <th>Nazwa</th>
            <th>Wydawnictwo</th>
            <th>Cena</th>
            <th>Kategoria</th>
            <th>Ilość</th>
            <th>Autor</th>
            <th>Edytuj</th>
            <th>Usuń</th>
        </tr>

        <c:forEach var="book" items="${books}" >

         <c:url var="update" value="/books/updateBookForm">
         <c:param name="bookId" value="${book.id}"/>
         </c:url>

            <c:url var="delete" value="/books/deleteBookForm">
                <c:param name="bookId" value="${book.id}"/>
            </c:url>
            <tr>


                <td>${book.nazwa}</td>
                <td>${book.wydawnictwo}</td>
                <td>${book.cena}</td>
                <td>${book.kategoria.nazwa}</td>
                 <td>${book.ilosc}</td>
                <td><c:out value="${book.autorzy}"/></td>
                <td><a class="as" href="${update}">edytuj</a></td>
                <td><a class="as" href="${delete}">usuń</a></td>
            </tr>
            <tr>

            </tr>
        </c:forEach>
    </table>
</div>



<div>
    <a class="as" href="${pageContext.request.contextPath}/books/formadd">Dodaj książkę</a>
</div>
</body>
</html>