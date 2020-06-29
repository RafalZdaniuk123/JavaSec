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
                </ol>
              </div>

<h2>Katalog:</h2>
<div>
    <table class="tableList">
        <tr>

            <th>Nazwa</th>
            <th>Wydawnictwo</th>
            <th>Cena</th>
            <th>Kategoria</th>
        </tr>

        <c:forEach var="book" items="${books}" >

            <tr>


                <td>${book.nazwa}</td>
                <td>${book.wydawnictwo}</td>
                <td>${book.cena}</td>
                <td>${book.kategoria.nazwa}</td>

            </tr>

        </c:forEach>
        <tr><th colspan="4">Musisz być zalogowany by dodawać ksiązki do koszyka</th></tr>
    </table>
</div>

</body>
</html>