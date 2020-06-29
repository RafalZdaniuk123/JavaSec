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
<h2> Lista autorów <h2>
<table class="tableList">

        <tr>
            <th>Imię</th>
            <th>Nazwisko</th>
                <sec:authorize access="hasRole('ROLE_ADMIN') and isAuthenticated()">
                                <th>Edytuj</th>
                                <th>Usuń</th>
                              </sec:authorize>

        </tr>


        <c:forEach var="author" items="${authors}">
            <c:url var="update" value="/authors/updateAuthorForm">
                <c:param name="authorId" value="${author.id}"/>
            </c:url>
            <c:url var="delete" value="/authors/deleteAuthorForm">
                <c:param name="authorId" value="${author.id}"/>
            </c:url>
            <tr>
                <td><c:out value="${author.imie}"/></td>
                <td><c:out value="${author.nazwisko }"/></td>

                <sec:authorize access="hasRole('ROLE_ADMIN') and isAuthenticated()">

                    <td><a class="as" href="${update}">edytuj</a></td>
                     <td><a class="as" href="${delete}">usuń</a></td>
                                </tr>
                                <tr>

                                </tr>

                  </sec:authorize>

        </c:forEach>

    </table>
</div>
<div>
     <sec:authorize access="hasRole('ROLE_ADMIN') and isAuthenticated()">
                      <a class="as" href="${pageContext.request.contextPath}/authors/formadd" >Dodaj autora</a>
     </sec:authorize>


</div>
</body>
</html>