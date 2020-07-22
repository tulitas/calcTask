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

${savedLog.name}
${savedLog.log}
${savedLog.toString()}


<a href="<c:url value="/logout"/>">Logout</a>

</body>
</sec:authorize>
</html>
