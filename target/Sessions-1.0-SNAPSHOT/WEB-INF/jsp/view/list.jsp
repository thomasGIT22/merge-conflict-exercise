<%--@elvariable id="contacts" type="java.util.Set<com.stout.Contact>"--%>
<!DOCTYPE html>
<html>
    <head>
        <title><fmt:message key="title.browser" /></title>
    </head>
    <body>
        <h2><fmt:message key="title.page" /></h2>
        <c:choose>
            <c:when test="${fn:length(contacts) == 1}">
                <p style="font-style:italic;"><fmt:message key="message.oneContact" /></p>
            </c:when>
            <c:otherwise>
                <p style="font-style:italic;"><fmt:message key="message.contactCount"><fmt:param value="${fn:length(contacts)}" /></fmt:message></p>
            </c:otherwise>
        </c:choose>
        <c:if test="${fn:length(contacts) > 0}">
            <c:forEach items="${contacts}" var="contact">
                <p><span style="font-weight: bold;"><c:out value="${contact.lastName}, ${contact.firstName}" /></span><br>
                    <c:out value="${contact.address}" /><br>
                    <c:out value="${contact.phoneNumber}" /><br>
                    <c:if test="${contact.birthday != null}">
                        <fmt:message key="label.birthday" /> <fmt:formatDate value="${contact.newBirthday}" type="date" dateStyle="medium" /><br>
                    </c:if>
                    <fmt:formatDate var="createdDate" value="${contact.newDateCreated}" type="both" dateStyle="full" timeStyle="long" />
                    <fmt:message key="label.creationDate" /> <c:out value="${createdDate}" /><br>
                    <fmt:message key="label.venmo" /> <fmt:formatNumber value="${contact.amtVenmo}" type="currency" currencyCode="USD" /></p>
                </c:forEach>
            </c:if>

        <ol>
            <c:forTokens var="month" items="${monthAbbrev}" delims="," >
                <li>${month}</li>
                </c:forTokens>
        </ol>
    </body>
</html>