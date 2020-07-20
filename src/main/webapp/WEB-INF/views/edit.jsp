<%@ taglib prefix="th" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--
  Created by IntelliJ IDEA.
  User: SergejK
  Date: 11-Jul-20
  Time: 02:11 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>hi</title>
</head>
<body>
<div>
    <section>
        <form action="" th:action="@{/options/edit(id=${User})}" method="post">
            <div>
                <input type="text" name="login" id="login" value="${personToEdit.get().name}">
                <input hidden type="text" name="password" id="password" value="${personToEdit.get().password}">
                <input type="text" name="fullName" id="full_name" value="${personToEdit.get().logs}"/>
                <br/>
                <button class="add_button"> Add</button>
            </div>

        </form>
    </section>
</div>
<a href="${pageContext.request.contextPath}/">Main Page</a>

</body>
</html>
