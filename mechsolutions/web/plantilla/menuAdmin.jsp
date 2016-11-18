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
<div class="header clearfix menu">                    
    <nav class="navbar navbar-default">
        <div class="container-fluid" style="padding-bottom: 15px">
            <div class="navbar-header" style="padding-bottom: 15px">
                <button type="button" class="navbar-toggle" data-toggle="collapse" data-target="#myNavbar" style="padding-bottom: 17px">
                    <span class="icon-bar"></span>
                    <span class="icon-bar"></span>
                    <span class="icon-bar"></span> 
                </button>
                <a class="navbar-brand" href="#"><img src="images/logoMS.png" style="width: 95px"  alt="logo"></a>
            </div>
            <div class="collapse navbar-collapse" id="myNavbar">
                <ul class="nav navbar-nav navbar-right" style="padding-top: 12px">
                    <li role="presentation" class="btn-link"><a href="index.jsp"><i class="fa fa-home" aria-hidden="true"></i>Inicio</a></li>
                    <li role="presentation" class="btn-link"><a href="logout.action"><i class="fa fa-sign-out" aria-hidden="true"></i>Salir</a></li>
                    <li role="presentation" class="btn-link"><a href="admin.action"><i class="fa fa-user" aria-hidden="true"></i>Admin</a></li>
                    <li role="presentation" class="btn-link"><a href="contacto.jsp"><i class="fa fa-phone" aria-hidden="true"></i>Contacto</a></li>
                </ul>
            </div>
        </div>
    </nav>
</div>