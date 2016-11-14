<%-- 
    Document   : administracion
    Created on : 14/11/2016, 08:22:10 AM
    Author     : derick
--%>

<% String context = request.getContextPath();%>
<%@taglib prefix="s" uri="/struts-tags" %>

<jsp:include page="plantilla/header.jsp" /> 
<body>
    <div class="container-fluid">
        <s:if test="%{#session.user.mail=='axel_lagunes@outlook.com'}">
            <!-- admin area -->            
            <jsp:include page="plantilla/menuUsuario.jsp" />

            <div class="row">

                <div class="col-sm-9 col-sm-offset-1 col-md-10 col-md-offset-1 main">
                    <h1 class="page-header">Admin Dashboard</h1>


                    <h3  onclick="cambiar('flechita');" class="page-header" data-toggle="collapse" data-target="#job">Agregar Trabajo <i id="flechita" class="fa fa-sort-desc" aria-hidden="true"></i></h3>
                    <div id="job" class="collapse">
                        <s:form name="addJob" action="addJob" id="addJob" method="POST">

                            <s:textfield key="Fecha de entrega estimada" name="fechaEntrega" />
                            <s:textfield key="Descripción" name="descripcion" />
                            <s:textfield key="Pieza" name="pieza" />

                            <s:select key="Lista de usuarios" list="lista" listKey="id" listValue="nombre" name="cliente"></s:select>

                            <s:submit key="Confirmar" />
                        </s:form>
                    </div>

                    <h3 onclick="cambiar('flechita2');" class="page-header" data-toggle="collapse" data-target="#user">Agregar Usuario<i id="flechita2" class="fa fa-sort-desc" aria-hidden="true"></i></h3>
                    <div id="user" class="collapse">
                        <s:form name="addUser" action="addUser" id="addUser" method="POST">

                            <s:textfield key="Nombre" name="nombre" />
                            <s:textfield key="Apellidos" name="apellidos" />
                            <s:textfield key="Mail" name="mail" />                        
                            <s:textfield key="Telefono" name="telefono" />                        
                            <s:textfield key="Dirección" name="direccion" />                                              

                            <s:submit key="Confirmar" />
                        </s:form>
                    </div>
                </div>

            </div>

        </s:if>
        <s:else>
            <%response.sendRedirect(context + "/index.jsp");%>
        </s:else>
    </div>
    <script>
        function cambiar(s) {            
            if ($('#'+s).attr('class') === 'fa fa-sort-desc') {
                $('#'+s).removeClass('fa-sort-desc');
                $('#'+s).addClass('fa-sort-asc');
            } else {
                $('#'+s).removeClass('fa-sort-asc');
                $('#'+s).addClass('fa-sort-desc');
            }
        }
    </script>
    <jsp:include page="plantilla/foot.jsp" />
</body>
</html>
