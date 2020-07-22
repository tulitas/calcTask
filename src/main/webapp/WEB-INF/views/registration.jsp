<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--
  Created by IntelliJ IDEA.
  User: SergejK
  Date: 09-Jul-20
  Time: 07:22 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>

    <title>Sign Up</title>
</head>
<body>
Registration form
<script type="text/javascript">

    function zero_first_format(value) {
        if (value < 10) {
            value = '0' + value;
        }
        return value;
    }

    function date_time() {
        var current_datetime = new Date();
        var day = zero_first_format(current_datetime.getDate());
        var month = zero_first_format(current_datetime.getMonth() + 1);
        var year = current_datetime.getFullYear();
        var hours = zero_first_format(current_datetime.getHours());
        var minutes = zero_first_format(current_datetime.getMinutes());
        var seconds = zero_first_format(current_datetime.getSeconds());


        document.getElementById('current_date_time_block').innerHTML =
            day + "." + month + "." + year + " " + hours + ":" + minutes + ":" + seconds;
    }

    setInterval(date_time, 0);
</script>
<div>
    <form action="${pageContext.request.contextPath}options/create" method="post">

        <label for="login">Login</label>
        <input type="text" name="login" id="login"><br>

        <label for="password">Password</label>
        <input type="password" name="password" id="password"><br>


        <textarea  name="regDate" id="current_date_time_block"></textarea>
        <p>
            <button class="add_button">Add</button>
        </p>

    </form>

<c:if test="${not empty errorMesage}">${errorMesage}</c:if>
</div>
</body>
<a href="${pageContext.request.contextPath}/">Main Page</a>

</html>
