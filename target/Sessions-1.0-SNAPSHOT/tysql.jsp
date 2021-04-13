<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <link href="styles/main.css" rel="stylesheet">
    </head>
    <body>
        <h2>SELECT * FROM vendors;</h2>
        <sql:query dataSource="${db}" var="result">
            SELECT * FROM vendors;
        </sql:query>
        <table>
            <tr>
                <th>vend_id</th>
                <th>vend_name</th>
                <th>vend_address</th>
                <th>vend_city</th>
                <th>vend_state</th>
                <th>vend_zip</th>
                <th>vend_country</th>
            </tr>
            <c:forEach var="row" items="${result.rows}">
                <tr>
                    <td> <c:out value="${row.vend_id}"/></td>
                    <td> <c:out value="${row.vend_name}"/></td>
                    <td> <c:out value="${row.vend_address}"/></td>
                    <td> <c:out value="${row.vend_city}"/></td>
                    <td> <c:out value="${row.vend_state}"/></td>
                    <td> <c:out value="${row.vend_zip}"/></td>
                    <td> <c:out value="${row.vend_country}"/></td>
                </tr>
            </c:forEach>
        </table>
        <h2>SELECT * FROM customers;</h2>
        <sql:query dataSource="${db}" var="result">
            SELECT * FROM customers;
        </sql:query>
        <table>
            <tr>
                <th>cust_id</th>
                <th>cust_name</th>
                <th>cust_address</th>
                <th>cust_city</th>
                <th>cust_state</th>
                <th>cust_zip</th>
                <th>cust_country</th>
                <th>cust_contact</th>
                <th>cust_email</th>
            </tr>
            <c:forEach var="row" items="${result.rows}">
                <tr>
                    <td> <c:out value="${row.cust_id}"/></td>
                    <td> <c:out value="${row.cust_name}"/></td>
                    <td> <c:out value="${row.cust_address}"/></td>
                    <td> <c:out value="${row.cust_city}"/></td>
                    <td> <c:out value="${row.cust_state}"/></td>
                    <td> <c:out value="${row.cust_zip}"/></td>
                    <td> <c:out value="${row.cust_country}"/></td>
                    <td> <c:out value="${row.cust_contact}"/></td>
                    <td> <c:out value="${row.cust_email}"/></td>
                </tr>
            </c:forEach>
        </table>
    </body>
</html>
