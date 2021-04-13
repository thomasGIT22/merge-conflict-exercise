<%@ page import="java.util.Map" %>
<%
    @SuppressWarnings("unchecked")
    Map<Integer, String> products = (Map<Integer, String>) request.getAttribute("products");
%>
<!DOCTYPE html>
<html>
    <head>
        <title>Product List</title>
    </head>
    <body>
        <h2>Product List</h2>
        <p><a href="<c:url value="/shop?action=viewCart" />">View Cart</a></p>

        <p>Select an item to add it to your cart</p>
        <ul>
            <%
                for (int id : products.keySet()) {
            %>
            <li><a href="<c:url value="/shop">
                       <c:param name="action" value="addToCart" />
                       <c:param name="productId" value="<%= Integer.toString(id)%>"/>
                   </c:url>"><%= products.get(id)%></a></li>
                <%
                    }
                %>
        </ul>
    </body>
</html>