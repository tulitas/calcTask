<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--
  Created by IntelliJ IDEA.
  User: SergejK
  Date: 21-Jul-20
  Time: 11:18 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>hi</title>
</head>

<sec:authorize access="isAuthenticated()">
<body>
your log is saved<br>
${savedLog.name}
${savedLog.log}


<a href="<c:url value="/logout"/>">Logout</a>
<button onclick="location.href='/'">Main page</button>

</body>
</sec:authorize>
</html>
