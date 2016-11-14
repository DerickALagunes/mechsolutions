<%-- 
    Document   : FAQ
    Created on : 18/10/2016, 03:06:13 PM
    Author     : derick
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="s" uri="/struts-tags" %>
<!DOCTYPE html>
<html>
    <jsp:include page="plantilla/header.jsp" /> 
    <body>
        <div class="container">
            <s:if test="%{#session.size==0}">
                <jsp:include page="plantilla/menu.jsp" />
            </s:if>
            <s:else>
                <jsp:include page="plantilla/menuUsuario.jsp" />
            </s:else>
            <div class="jumbotron" style="text-align: justify">
                <jsp:include page="plantilla/preguntasFrecuentes.jsp" />
            </div>
            <footer class="footer">
                <p>&copy; 2016 MechSolutions.</p>
            </footer>
        </div>
        <jsp:include page="plantilla/foot.jsp" /> 
    </body>
</html>
