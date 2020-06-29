
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


    <nav>
     <div>
     <a href="${pageContext.request.contextPath}">Strona główna</a>
     </div>
    </nav>

  <div>
    <h3>Rejestracja</h3>
    <c:if test="${not empty validator}"><p><c:out value="${validator}"/></p></c:if>
    <form:form method="post" modelAttribute="user">
     <table class="logowanieTab">

     <tr>
     <td><label for="username">Nazwa:</label></td>
     <td><form:input path="username" id="username" /></td>
     </tr>
     <tr>
     <td><label for="password">Hasło:</label></td>
     <td><form:password path="password" id="password" /></td>
     </tr>
     <tr>
     <td>
     <button type="submit">Zarejestruj</button>
     </td>
     </tr>

     </table>
    </form:form>
   </div>
</body>
</html>