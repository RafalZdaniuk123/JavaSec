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
<h2>Kategorie: </h2>
<table class="tableList">

        <tr>
            <th>Nazwa</th>
            <th>Edytuj</th>
            <th>Usuń</th>
        </tr>


        <c:forEach var="category" items="${categories}">
            <c:url var="update" value="/categories/updateCategoryForm">
                <c:param name="categoryId" value="${category.id}"/>
            </c:url>
            <c:url var="delete" value="/categories/deleteCategoryForm">
                <c:param name="categoryId" value="${category.id}"/>
            </c:url>
            <tr>
                <td><c:out value="${category.nazwa}"/></td>
                <td><a class="as" href="${update}">edytuj</a></td>
                <td><a class="as" href="${delete}">usuń</a></td>
            </tr>
            <tr>

                     </tr>
        </c:forEach>

    </table>
</div>
<div>
    <a class="as" href="${pageContext.request.contextPath}/categories/formadd" >Dodaj kategorię</a>
</div>
</body>
</html>