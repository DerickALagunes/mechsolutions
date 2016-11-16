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
    <style type="text/css">
        a:link {
            color: black;
        }
        /* visited link */
        a:visited {
            color: black;
        }

        /* mouse over link */
        a:hover {
            color: black;
        }

        /* selected link */
        a:active {
            color: black;
        }
    </style>
    <body>
        <div class="container">
            <s:if test="%{#session.size==0}">
                <%response.sendRedirect(context + "/login.jsp");%>
            </s:if>
            <s:else>
                <jsp:include page="plantilla/menuUsuario.jsp" />
            </s:else>

            <div class="container-fluid">
                <h1 class="page-header well" onclick="cambiar('flechita');" data-toggle="collapse" data-target="#servicios">Servicios disponibles <i class="fa fa-server" aria-hidden="true"></i> <i id="flechita" class="fa fa-sort-desc" aria-hidden="true"></i></h1>
                <!--link a servers-->
                <div class="row well collapse" id="servicios">
                    <h5 class="col-sm-12 col-xs-12"><i class="fa fa-info-circle" aria-hidden="true"></i>Da click en algun servicio para saber si esta activo y las instrucciones de como utilizarlo.</h5>
                    <br/><br/><br/>
                    <s:url var="plex" action="statusServer">
                        <s:param name="serverName">plex</s:param>
                    </s:url>
                    <a href="${plex}">
                        <div class="row">
                            <img src="<%=context%>/images/plex.png" width="100px" height="100px" 
                                 class="img-circle col-sm-2 col-xs-2" alt="">
                            <br/><br/>
                            <h4 class="col-sm-2 col-xs-2">Plex </h4><h5 class="col-sm-8 col-xs-8">Servidor de peliculas y series de alta calidad (HD), se actualiza cada semana con series y se suben peliculas a pedido.</h5>
                        </div>
                    </a>
                    <br/>
                    <s:url var="minecraft" action="statusServer">
                        <s:param name="serverName">minecraft</s:param>
                    </s:url>
                    <a href="${minecraft}">
                        <div class="row">
                            <img src="<%=context%>/images/minecraft.png" width="100px" height="100px" 
                                 class="img-circle col-sm-2 col-xs-2" alt="">
                            <br/><br/>
                            <h4 class="col-sm-2 col-xs-2">Minecraft </h4><h5 class="col-sm-8 col-xs-8">Servidor de minecraft en linea, versión 1.7.4, conectate para jugar con tus amigos.</h5>
                        </div>
                    </a>
                    <br/>
                    <s:url var="cod" action="statusServer">
                        <s:param name="serverName">cod</s:param>
                    </s:url>
                    <a href="${cod}">
                        <div class="row">
                            <img src="<%=context%>/images/cod.png" width="100px" height="100px" 
                                 class="img-circle col-sm-2 col-xs-2" alt="">
                            <br/><br/>
                            <h4 class="col-sm-2 col-xs-2">Call of Duty 4 </h4><h5 class="col-sm-8 col-xs-8">Servidor de call of duty en linea, varios modos de juego para jugar contra tus amigos.</h5>
                        </div>
                    </a>
                    <br/><s:url var="lufi" action="statusServer">
                        <s:param name="serverName">lufi</s:param>
                    </s:url>
                    <a href="${lufi}">
                        <div class="row">
                            <img src="<%=context%>/images/lufi.png" width="100px" height="100px" 
                                 class="img-circle col-sm-2 col-xs-2" alt="">
                            <br/><br/>
                            <h4 class="col-sm-2 col-xs-2">Lufi </h4><h5 class="col-sm-8 col-xs-8">Let's upload that file, servidor donde podras subir tus archivos para descargalos en otro momento, los archivos son encriptados por el navegador.</h5>
                        </div>
                    </a>
                    <br/>
                    <s:url var="draw" action="statusServer">
                        <s:param name="serverName">draw</s:param>
                    </s:url>
                    <a href="${draw}">
                        <div class="row">
                            <img src="<%=context%>/images/draw.png" width="100px" height="100px" 
                                 class="img-circle col-sm-2 col-xs-2" alt="">
                            <br/><br/>
                            <h4 class="col-sm-2 col-xs-2">Draw.io </h4><h5 class="col-sm-8 col-xs-8">Aplicación para hacer diagramas de todo tipo.</h5>
                        </div>
                    </a>
                    <br/>
                    <s:url var="git" action="statusServer">
                        <s:param name="serverName">git</s:param>
                    </s:url>
                    <a href="${git}">
                        <div class="row">
                            <img src="<%=context%>/images/git.png" width="100px" height="100px" 
                                 class="img-circle col-sm-2 col-xs-2" alt="">
                            <br/><br/>
                            <h4 class="col-sm-2 col-xs-2">Gitlab </h4><h5 class="col-sm-8 col-xs-8">Herramienta de colaboracion de proyectos, se usa para administrar repositorios git de una manera mas intuitiva y eficaz.</h5>
                        </div>
                    </a>
                    <br/>
                </div>



                <h1 class="sub-header well" onclick="cambiar('flechita2');" data-toggle="collapse" data-target="#trabajos">Trabajos <i class="fa fa-info-circle" aria-hidden="true"></i> <i id="flechita2" class="fa fa-sort-desc" aria-hidden="true"></i></h1>
                <div id="trabajos" class="table-responsive well collapse">
                    <table class="table table-hover">
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
            <footer class="footer">
                <p>&copy; 2016 MechSolutions.</p>
            </footer>
        </div>

        <jsp:include page="plantilla/foot.jsp" /> 
        <script>
            function cambiar(s) {
                if ($('#' + s).attr('class') === 'fa fa-sort-desc') {
                    $('#' + s).removeClass('fa-sort-desc');
                    $('#' + s).addClass('fa-sort-asc');
                } else {
                    $('#' + s).removeClass('fa-sort-asc');
                    $('#' + s).addClass('fa-sort-desc');
                }
            }
        </script>
    </body>
</html>
