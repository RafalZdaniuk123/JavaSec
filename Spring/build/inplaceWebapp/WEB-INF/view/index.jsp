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
                            <li><a href="${pageContext.request.contextPath}/contact">Kontakt</a>
                            </li>
                            <li><a href="${pageContext.request.contextPath}/about">O księgarni</a>
                            </li>
                             <li>
                            <sec:authorize access="hasRole('ROLE_ADMIN') and isAuthenticated()">

                                        <a href="${pageContext.request.contextPath}/order/listAdmin">Lista zamówień</a>

                                  </sec:authorize>


                                  <sec:authorize access="hasRole('ROLE_USER') and isAuthenticated()">

                                                                          <a href="${pageContext.request.contextPath}/order/list">Lista zamówień</a>

                                  </sec:authorize>

                                  <sec:authorize access="!isAuthenticated()">
                                                                    <a style=" display: none;" href="${pageContext.request.contextPath}/order/list">ista zamówień</a>
                                     </sec:authorize>
                                     </li>

                </ol>
              </div>


                            <div id="slider"></div>
                          <div id="slider1"></div>
                          <div id="slider2"></div>

</body>
</html>