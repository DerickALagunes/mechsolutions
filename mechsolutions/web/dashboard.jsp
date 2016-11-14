<%-- 
    Document   : dashboard
    Created on : 18/10/2016, 03:05:38 PM
    Author     : derick
--%>
<%
    String context = request.getContextPath();
%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="s" uri="/struts-tags" %>
<!DOCTYPE html>
<html>
    <jsp:include page="plantilla/header.jsp" /> 
    <body>

        <div class="container-fluid">
            <s:if test="%{#session.size==0}">
                <%response.sendRedirect(context + "/login.jsp");%>
            </s:if>
            <s:else>
                <jsp:include page="plantilla/menuUsuario.jsp" />
            </s:else>
            <div class="row">

                <div class="col-sm-9 col-sm-offset-1 col-md-10 col-md-offset-1 main">
                    <h1 class="page-header">Dashboard</h1>
                    <jsp:include page="plantilla/servers.jsp" />

                    <h2 class="sub-header">Section title</h2>
                    <div class="table-responsive">
                        <table class="table table-striped">
                            <thead>
                                <tr>
                                    <th>#</th>
                                    <th>Fecha</th>
                                    <th>Entrega</th>
                                    <th>Descripción</th>
                                    <th>Pieza</th>
                                </tr>
                            </thead>
                            <tbody>
                                <s:iterator value="trabajos" var="trabajo">
                                    <s:if test="#trabajo.estado">
                                        <tr>
                                            <td><s:property value="#trabajo.id" /></td>
                                            <td><s:property value="#trabajo.fecha" /></td>
                                            <td><s:property value="#trabajo.fechaEntrega" /></td>
                                            <td><s:property value="#trabajo.descripcion" /></td>
                                            <td><s:property value="#trabajo.pieza" /></td>
                                        </tr>
                                    </s:if>
                                </s:iterator>
                            </tbody>
                        </table>
                    </div>
                </div>
            </div>
            <footer class="footer">
                <p>&copy; 2016 MechSolutions.</p>
            </footer>
        </div>

        <jsp:include page="plantilla/foot.jsp" /> 
    </body>
</html>
