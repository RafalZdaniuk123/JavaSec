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
Dodaj/edytuj ksiazke
<form:form action="saveBook" modelAttribute="book" method="POST">
    <table class="logowanieTab">
        <tr>
            <td><label>nazwa:</label></td>
            <td><form:input path="nazwa"/></td>
        </tr>
        <tr>
            <td><label>wydawnictwo:</label></td>
            <td><form:input  path="wydawnictwo"/></td>
        </tr>
        <tr>
            <td><label>cena:</label></td>
            <td><form:input path="cena"/></td>
        </tr>
        <tr>
                    <td><label>ilosc:</label></td>
                    <td><form:input path="ilosc"/></td>
        </tr>
        <tr>
            <td>
            Kategoria
                    <form:select path="kategoria"> // tu mieli kategoria a u mnie to wtedy calkiem niedziala
                        <form:options items="${categories}" itemValue="id" itemLabel="nazwa"/>
                    </form:select>
            </td>
        </tr>
        <tr>

                    Autor
    <td>
                       <c:forEach items="${authors}" var="map">
                                   <input type="checkbox" name="ids"  value=${map.id}></input>
                                   <label for="customCheck1">${map.imie} ${map.nazwisko}</label>



                       </c:forEach>
      </td>






                </tr>
         <tr>
                    <td><form:hidden path="id"/></td>
         </tr>
        <tr>
            <td><label></label></td>
            <td><input type="submit" value="Save" class="save"/></td>
        </tr>
    </table>
</form:form>
<!-- -wracamy do listy bez zapisu-->
<p>
    <a href="${pageContext.request.contextPath}/books/list "> return </a>
</p>
</body>
</html>