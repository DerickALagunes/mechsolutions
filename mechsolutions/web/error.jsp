<%-- 
    Document   : error
    Created on : 18/10/2016, 03:05:26 PM
    Author     : derick
--%>
<% String context = request.getContextPath();%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <jsp:include page="plantilla/header.jsp" /> 
    <body>
        <div class="container well">
            <div class="row" style="text-align: center">
                <h1 class="header"><i class="icon-warning-sign"></i> Error <i class="icon-warning-sign"></i></h1>
                <p ><img class="img-circle" src="<%=context%>/images/wow.jpg" alt=""/></p>
                    <h4>Ha ocurridó un error, la pagina que buscabas no se encuentra</h4>
                    <br/>
                    <h4><a href="index.jsp">Regresar al inicio.</a></h4>
            </div>
        </div>
        <jsp:include page="plantilla/foot.jsp" /> 
    </body>
</html>