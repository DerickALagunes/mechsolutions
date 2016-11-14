<%-- 
    Document   : index
    Created on : 18/10/2016, 10:42:16 AM
    Author     : derick
--%>
<%@page import="modelos.PersonaBean"%>
<% String context = request.getContextPath();%>
<%@taglib prefix="s" uri="/struts-tags" %>

<jsp:include page="plantilla/header.jsp" /> 
<body>
    <div class="container">
        <s:if test="%{#session.size==0}">
            <jsp:include page="plantilla/menu.jsp" />
        </s:if>
        <s:elseif test="%{#session.user.mail=='axel_lagunes@outlook.com'}">
            <jsp:include page="plantilla/menuAdmin.jsp" />
        </s:elseif>
        <s:else>
            <jsp:include page="plantilla/menuUsuario.jsp" />
        </s:else>

        <div class="jumbotron">
            <jsp:include page="plantilla/carrusel.jsp" /> 
        </div>

        <div class="row marketing">
            <div class="col-lg-12 well" id="servicios">

                <h4 class="page-header ">Soluciones</h4>
                <img class="pull-right" style="float: right; height: 200px" src="<%=context%>/images/bg2.jpg" alt="Primera">
                <p>MechSolutions cuenta con estos servicios:</p> 
                <ul>
                    <li>Mantenimiento preventivo</li>
                    <li>Reparación</li>
                    <li>Actualización de Hardware y Software</li>
                    <li>Redes</li>
                    <li>Venta de accesorios y partes</li>
                    <li>Consultoria</li>
                    <li>Diseño de paginas web</li>
                    <li>Camaras de seguridad</li>
                    <li>Desarrollo de aplicaciones</li>
                    <li>Cualquier tipo de trabajo de informatica</li>
                </ul>
                </br>
                <p><a href="contacto.jsp">Contactar</a></p>
                </br>
            </div>

            <div class="col-lg-12 well" id="beneficios">
                <h4 class="page-header">Beneficios de registrarse con nosotros</h4>
                <img class="pull-right" style="float: right; height: 150px" src="<%=context%>/images/bg2.jpg" alt="Primera">
                <p>Al registrarse con nosotros obtiendras acceso a varias herramientas de MechSolutions:</p>
                <ul>
                    <li>Servidor de series y peliculas Plex</li>
                    <li>Pronto incluiremos mas herramientas!
                        <ul>
                            <li>Servidor de juegos</li>
                            <li>Servidor de carga y descarga de archivos</li>
                        </ul>
                    </li>
                </ul>
                <p>Si quieres disfrutar de estos servicios registrate! es gratis.</p>
                </br>
                <p>*Si quieres que ciertas peliculas o series esten disponibles en el servidor mandanos un correo para mas información contactenos por e-mail, teléfono o en persona en el local.</p>
            </div>
        </div>

        <footer class="footer">
            <p>&copy; 2016 MechSolutions.</p>
        </footer>

    </div> <!-- /container -->

    <jsp:include page="plantilla/foot.jsp" /> 
</body>
</html>