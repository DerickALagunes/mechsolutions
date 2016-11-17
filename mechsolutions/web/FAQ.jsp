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
        <div class="container well"  style="text-align: justify">
            <jsp:include page="plantilla/menuFunction.jsp" />
            <h1 class="header">Preguntas frecuentes<i class="fa fa-question" aria-hidden="true"></i></h1>
            <br/>
            <h5>Si tienes problemas con tu equipo checa esta sección para intentar resolverlos, recuerda que siempre puedes contactarnos y acudir con nosotros si no encuentras solución.</h5>
            <br/>
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
