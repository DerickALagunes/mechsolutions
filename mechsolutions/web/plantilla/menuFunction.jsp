<%-- 
    Document   : menuFunction
    Created on : 17/11/2016, 11:02:32 AM
    Author     : derick
--%>
<%@taglib prefix="s" uri="/struts-tags" %>
<s:if test="%{#session.size==0}">
    <jsp:include page="menu.jsp" />
</s:if>
<s:elseif test="%{#session.user.mail=='axel_lagunes@outlook.com'}">
    <jsp:include page="menuAdmin.jsp" />
</s:elseif>
<s:else>
    <jsp:include page="menuUsuario.jsp" />
</s:else>
