<%-- 
    Document   : serverDashboard
    Created on : 16/11/2016, 08:09:06 AM
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
        <div class="container">
            <s:if test="%{#session.size==0}">
                <%response.sendRedirect(context + "/login.jsp");%>
            </s:if>
            <s:else>
                <jsp:include page="plantilla/menuUsuario.jsp" />
            </s:else>
            <div class="container-fluid well" style="text-align: justify">
                <h1 class="page-header"> <i class="fa fa-server" aria-hidden="true"></i> Estado de <s:property value="serverName"/>: </h1>


                <s:if test='estado == "true"' >
                    <div class="alert alert-success col-sm-6" style="text-align: justify">
                        <p style="text-align: center"><i class="fa fa-thumbs-o-up fa-4x" aria-hidden="true"></i><br/></p>
                        <h5><i class="fa fa-thumbs-o-up" aria-hidden="true"></i> Servidor activo</h5>
                        <h5><i class="fa fa-thumbs-o-down" aria-hidden="true"></i> Servidor caido/mantenimiento</h5>                 
                    </div>
                    <!--ir-->
                    <a href="${link}">
                        <div class="alert alert-link col-sm-6" style="text-align: center">
                            <img src="<%=context%>/images/${serverName}.png" width="100px" height="100px" 
                                 class="img-circle col-sm-6 col-xs-6" alt="${serverName}">
                            <br/><br/>
                            <h4 class="col-sm-6 col-xs-6">Plex </h4>
                        </div>
                    </a>
                </s:if>
                <s:else>
                    <div class="alert alert-warning col-sm-6" style="text-align: justify">
                        <p style="text-align: center"><i class="fa fa-thumbs-o-down fa-4x" aria-hidden="true" style="text-align: center"></i><br/></p>
                        <h5><i class="fa fa-thumbs-o-up" aria-hidden="true"></i> Servidor activo</h5>
                        <h5><i class="fa fa-thumbs-o-down" aria-hidden="true"></i> Servidor caido/mantenimiento</h5>                 
                    </div>                   
                </s:else>


                <div class="col-sm-12">
                    <h4><s:property value="desc" escapeHtml="false"/></h4>
                    <br/>
                    <h1 class="page-header" id="instruc"><i class="fa fa-info-circle" aria-hidden="true"></i> Como usar <s:property value="serverName"/>: </h1>
                    <h4><s:property value="instruciones" escapeHtml="false"/></h4>
                </div>
            </div>

            <footer class="footer">
                <p>&copy; 2016 MechSolutions.</p>
            </footer>
        </div>
        <jsp:include page="plantilla/foot.jsp" /> 
    </body>
</html>
