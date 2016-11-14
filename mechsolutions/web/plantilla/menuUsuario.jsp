<%-- 
    Document   : menu
    Created on : 21/10/2016, 02:02:56 PM
    Author     : derick
--%>
<%
    String context = request.getRequestURI();
%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<div class="header clearfix">                    
    <nav>
        <ul class="nav nav-pills pull-right">
            <li role="presentation" class="btn-default"><a href="index.jsp">Inicio</a></li>
            <li role="presentation" class="btn-default"><a href="logout.action">Salir</a></li>
            <li role="presentation" class="btn-default"><a href="dashboard.action">Trabajos</a></li>
            <li role="presentation" class="btn-default"><a href="contacto.jsp">Contacto</a></li>
        </ul>
    </nav>
    <img style="float: left; height: 50px" src="<%=context%>/../images/logo.jpg" alt="Logo de mechsolutions"><h3 class="text-muted">MechSolutions</h3>
    <h5 class="text-muted">Soluciones en informatica</h5>          
</div>
