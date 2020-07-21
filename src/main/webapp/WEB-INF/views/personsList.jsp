<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--<%@ taglib prefix="sec" uri="http://www.springframework.org/tags" %>--%>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<%--
  Created by IntelliJ IDEA.
  User: SergejK
  Date: 11-Jul-20
  Time: 12:54 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <link href="<c:url value="/resources/css/personsList.css"/>" rel="stylesheet">
    <meta http-equiv="refresh" content="10"/>
    <style>

    </style>
</head>

<body style="background-color: #f4e6e8">
<script>
    function sortTableByLogin() {
        var table, rows, switching, i, x, y, shouldSwitch;
        table = document.getElementById("myTable");
        switching = true;

        while (switching) {

            switching = false;
            rows = table.rows;

            for (i = 1; i < (rows.length - 1); i++) {
                shouldSwitch = false;

                x = rows[i].getElementsByTagName("TD")[1];
                y = rows[i + 1].getElementsByTagName("TD")[1];

                if (x.innerHTML.toLowerCase() > y.innerHTML.toLowerCase()) {

                    shouldSwitch = true;
                    break;
                }
            }
            if (shouldSwitch) {

                rows[i].parentNode.insertBefore(rows[i + 1], rows[i]);
                switching = true;
            }
        }
    }

    function sortTableByLoginByName() {
        var table, rows, switching, i, x, y, shouldSwitch;
        table = document.getElementById("myTable");
        switching = true;

        while (switching) {

            switching = false;
            rows = table.rows;

            for (i = 1; i < (rows.length - 1); i++) {
                shouldSwitch = false;

                x = rows[i].getElementsByTagName("TD")[2];
                y = rows[i + 1].getElementsByTagName("TD")[2];
                if (x.innerHTML.toLowerCase() > y.innerHTML.toLowerCase()) {
                    shouldSwitch = true;
                    break;
                }
            }
            if (shouldSwitch) {

                rows[i].parentNode.insertBefore(rows[i + 1], rows[i]);
                switching = true;
            }
        }
    }

    function sortTableByAge() {
        var table, rows, switching, i, x, y, shouldSwitch;
        table = document.getElementById("myTable");
        switching = true;
        while (switching) {
            switching = false;
            rows = table.rows;

            for (i = 1; i < (rows.length - 1); i++) {
                shouldSwitch = false;

                x = rows[i].getElementsByTagName("TD")[3];
                y = rows[i + 1].getElementsByTagName("TD")[3];
                if (x.innerHTML.toLowerCase() > y.innerHTML.toLowerCase()) {
                    shouldSwitch = true;
                    break;
                }
            }
            if (shouldSwitch) {

                rows[i].parentNode.insertBefore(rows[i + 1], rows[i]);
                switching = true;
            }
        }
    }
</script>
<sec:authorize access="isAuthenticated()">
    <button onclick="sortTableByLogin()">Sort by login</button>
    <button onclick="sortTableByLoginByName()">Sort by name</button>
    <button onclick="sortTableByAge()">Sort by age</button>
    <button onclick="location.href='/palindrom'">Palindrom</button>
    <button onclick="location.href='/numberToStringX'">Number To String</button>
    <table id="myTable">
        <tr>
            <th>ID</th>
            <th>Name</th>
            <th>Log</th>
            <th colspan="2">Action</th>


        </tr>

        <c:forEach var="personsForm" items="${personsList}">

            <tr>
                <td width="75">${personsForm.id}</td>

                <td width="50">${personsForm.login}</td>
                <td width="50">${personsForm.logs}</td>
                <td width="50"><a href="/options/delete${personsForm.id}">Delete</a></td>
                <td width="50"><a class="delete" href="/options/edit${personsForm.id}">Edit</a></td>
            </tr>
        </c:forEach>
    </table>
    <button onclick="location.href='/options/csv'">download CSV</button>
    <button onclick="location.href='/options/uploadCsv'">upload CSV</button>
    <br>

    <body>

    <a href="<c:url value="/logout"/>">Logout</a>

    </body>
</sec:authorize>

<a href="${pageContext.request.contextPath}/">Main Page</a>
<div>
    Current Time :<%= new java.util.Date() %><br>
</div>
</body>


</html>
