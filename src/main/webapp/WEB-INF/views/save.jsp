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
    <title>save</title>
</head>
<body>
<div>
    <section>
        <form action="" th:action="logs/save" method="get">
            <div>
                <label for="login">enter name</label>
                <input type="text" name="login" id="login" value="">
                <label for="logs"></label>
                <input type="text" name="logs" id="logs" value="${personToEdit.get().logs}"/>
                <br/>
                <button class="add_button"> Add</button>
            </div>

        </form>
    </section>
</div>
<a href="${pageContext.request.contextPath}/">Main Page</a>

</body>
</html>
