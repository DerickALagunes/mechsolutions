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
    <nav class="navbar navbar-default">
        <div class="container-fluid">
            <div class="navbar-header">
                <button type="button" class="navbar-toggle" data-toggle="collapse" data-target="#myNavbar">
                    <span class="icon-bar"></span>
                    <span class="icon-bar"></span>
                    <span class="icon-bar"></span> 
                </button>
                <a class="navbar-brand" href="#">MechSolutions</a>
            </div>
            <div class="collapse navbar-collapse" id="myNavbar">
                <ul class="nav navbar-nav navbar-right">
                    <li role="presentation" class="btn-link"><a href="index.jsp">Inicio</a></li>
                    <li role="presentation" class="btn-link"><a href="login.jsp"><i class="fa fa-user-o" aria-hidden="true"></i>Entrar</a></li>
                    <li role="presentation" class="btn-link"><a href="contacto.jsp">Contacto</a></li>
                </ul>
            </div>
        </div>

    </nav>

</div>
