<%@ page import="java.util.Map" %>
<!DOCTYPE html>
<html>
    <head>
        <title>View Cart</title>
    </head>
    <body>
        <h2>View Cart</h2>
        <p><a href="<c:url value="/shop" />">Browse Products</a></p>
        <%
            @SuppressWarnings("unchecked")
            Map<Integer, String> products = (Map<Integer, String>)request.getAttribute("products");
            @SuppressWarnings("unchecked")
            Map<Integer, Integer> cart = (Map<Integer, Integer>)session.getAttribute("cart");
            if(cart == null || cart.size() == 0)
                out.println("<p>Your cart is empty.</p>");
            else {
        %>
        <p><a href="<c:url value="/shop?action=emptyCart" />">Empty Cart</a></p>
        <ul>
        <%
                for(int id : cart.keySet()) {
        %>
                    <li><%= products.get(id) %> (qty: <%= cart.get(id) %>) - 
                        <a href="<c:url value="/shop">
                            <c:param name="action" value="removeItem" />
                            <c:param name="productId" value="<%= Integer.toString(id) %>"/>
                        </c:url>">Remove</a>
                    </li>
        <%
                }
        %>
        </ul>
        <%
            }
        %>
    </body>
</html>