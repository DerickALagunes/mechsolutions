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


                    <div class="col-lg-6">
                        <h3  onclick="cambiar('flechita');" class="page-header" data-toggle="collapse" data-target="#job">Agregar Trabajo <i id="flechita" class="fa fa-sort-desc" aria-hidden="true"></i></h3>
                        <div id="job" class="collapse">
                            <div class="well">
                                <s:form name="addJob" action="addJob" id="addJob" method="POST">
                                    <div class="form-group">
                                        <label for="fechaEntrega" class="col-lg-3">Fecha de Entrega:</label>
                                        <div class="col-lg-9">
                                            <input type="date" class="form-control" id="fechaEntrega" name="fechaEntrega">
                                            <br/>
                                        </div>
                                    </div>
                                    <div class="form-group">
                                        <label for="descripcion" class="col-lg-3">Descripción:</label>
                                        <div class="col-lg-9">
                                            <input type="text" class="form-control" id="descripcion" name="descripcion">
                                            <br/>
                                        </div>
                                    </div>
                                    <div class="form-group">
                                        <label for="pieza" class="col-lg-3">Pieza:</label>
                                        <div class="col-lg-9">
                                            <input type="text" class="form-control" id="pieza" name="pieza">
                                            <br/>
                                        </div>
                                    </div>                           
                                    <div class="form-group">
                                        <s:select key="Lista de usuarios" list="lista" listKey="id" listValue="nombre" name="cliente" cssclass="selectpicker"></s:select>
                                        </div>
                                        <div class="form-group">
                                            <button class="btn btn-sm btn-primary" type="submit">Confirmar</button>
                                        </div>
                                </s:form>
                            </div>
                        </div>
                    </div>

                    <div class="col-lg-6">
                        <h3 onclick="cambiar('flechita2');" class="page-header" data-toggle="collapse" data-target="#user">Agregar Usuario<i id="flechita2" class="fa fa-sort-desc" aria-hidden="true"></i></h3>
                        <div id="user" class="collapse ">
                            <div class="well">
                                <s:form name="addUser" action="addUser" id="addUser" method="POST" class="form-horizontal">
                                    <div class="form-group">
                                        <label for="imputnombre" class="col-lg-3">Name:</label>
                                        <div class="col-lg-9">
                                            <input type="text" class="form-control" id="nombre" name="nombre">
                                            <br/>
                                        </div>
                                    </div>                                
                                    <div class="form-group">
                                        <label for="imputapellidos:" class="col-lg-3">Surnames:</label>
                                        <div class="col-lg-9">
                                            <input type="text" class="form-control" id="apellidos" name="apellidos">
                                            <br/>
                                        </div>                                    
                                    </div>
                                    <div class="form-group">                                        
                                        <label for="imputmail" class="col-lg-3" >Mail:</label>                                    
                                        <div class="col-lg-9">
                                            <input type="email" class="form-control" id="mail" name="mail">
                                            <br/>
                                        </div>                                    
                                    </div>
                                    <div class="form-group">
                                        <label for="telefono" class="col-lg-3">Phone:</label>
                                        <div class="col-lg-9">
                                            <input type="text" class="form-control" id="telefono" name="telefono">
                                            <br/>
                                        </div>                                    
                                    </div>
                                    <div class="form-group">
                                        <label for="impiutdireccion" class="col-lg-3">Direccion:</label>
                                        <div class="col-lg-9">
                                            <input type="text" class="form-control" id="direccion" name="direccion">
                                            <br/>
                                        </div>                                    
                                    </div> 
                                    <div class="form-group" >
                                        <button class="btn btn-sm btn-primary" type="submit">Confirmar</button>
                                    </div>
                                </s:form>
                            </div>
                        </div>
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
            if ($('#' + s).attr('class') === 'fa fa-sort-desc') {
                $('#' + s).removeClass('fa-sort-desc');
                $('#' + s).addClass('fa-sort-asc');
            } else {
                $('#' + s).removeClass('fa-sort-asc');
                $('#' + s).addClass('fa-sort-desc');
            }
        }
    </script>
    <jsp:include page="plantilla/foot.jsp" />
</body>
</html>
