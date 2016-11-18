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
                    <h1 class="page-header"><font color="white">Admin Dashboard</font></h1>


                    <div class="col-lg-6">
                        <div class="well well-sm">
                            <h3  onclick="cambiar('flechita');" data-toggle="collapse" data-target="#job">Agregar Trabajo <i id="flechita" class="fa fa-sort-desc" aria-hidden="true"></i></h3>
                        </div>
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
                                        <s:select key="Lista de usuarios" list="lista" listKey="id" listValue="nombre" name="cliente" cssclass="form-control"></s:select>
                                        </div>
                                        <div class="form-group">
                                            <button class="btn btn-sm btn-primary" type="submit">Confirmar</button>
                                        </div>
                                </s:form>
                            </div>
                        </div>
                    </div>

                    <div class="col-lg-6">
                        <div class="well well-sm">
                            <h3 onclick="cambiar('flechita2');" data-toggle="collapse" data-target="#user">Agregar Usuario<i id="flechita2" class="fa fa-sort-desc" aria-hidden="true"></i></h3>
                        </div>
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



                    <div class="col-lg-12">
                        <div class="well well-sm">
                            <h3 onclick="cambiar('flechita3');" data-toggle="collapse" data-target="#datosuser">Datos Trabajo<i id="flechita3" class="fa fa-sort-desc" aria-hidden="true"></i></h3>
                        </div>
                        <div id="datosuser" class="collapse ">
                            <div class="well">
                                <table class="table table-striped">
                                    <thead>
                                        <tr>
                                            <th>#</th>
                                            <th>Fecha de Recibido</th>
                                            <th>Entrega</th>
                                            <th>Descripción</th>
                                            <th>Pieza</th>
                                            <th>Modificar</th>
                                            <th>Elminar</th>
                                        </tr>
                                    </thead>
                                    <tbody>
                                        <s:iterator value="listaTra" var="trabajo">
                                            <s:if test="#trabajo.estado">
                                                <tr>
                                                    <td id="tbIdTrabajo<s:property value="#trabajo.id" />"><s:property value="#trabajo.id" /></td>
                                                    <td id="tbFecha<s:property value="#trabajo.id" />"><s:property value="#trabajo.fecha" /></td>
                                                    <td id="tbFechaEntrega<s:property value="#trabajo.id" />"><s:property value="#trabajo.fechaEntrega" /></td>
                                                    <td id="tbDescripcion<s:property value="#trabajo.id" />"><s:property value="#trabajo.descripcion" /></td>
                                                    <td id="tbPieza<s:property value="#trabajo.id" />"><s:property value="#trabajo.pieza" /></td>
                                                    <input class="hidden" id="tbIdUsuario<s:property value="#trabajo.id" />" value="<s:property value="#trabajo.cliente" />">
                                                    <td><button class="btn btn-primary" id="ModficarT" onclick="mostrarModal(<s:property value="#trabajo.id" />)">Modificar</button></td>
                                                    <td><button class="btn btn-danger">Eliminar</button></td>
                                                </tr>
                                            </s:if>
                                        </s:iterator>
                                    </tbody>
                                </table>
                            </div>                            
                        </div>
                    </div>


                </div>


            </div>

            <!-- Modal -->
            <div class="modal fade" id="myModal" role="dialog">
                <div class="modal-dialog">

                    <!-- Modal content-->
                    <div class="modal-content">
                        <div class="modal-header">
                            <button type="button" class="close" data-dismiss="modal">&times;</button>
                            <h4 class="modal-title">Modificar Trabajo</h4>
                        </div>
                        <div class="modal-body">
                            <s:form name="modjob" action="modJob" id="modjob" method="POST">
                                <div class="form-group">
                                    <label for="fechaEntrega" class="col-lg-3">Fecha de Entrega:</label>
                                    <div class="col-lg-9">
                                        <input type="date" class="form-control" id="fechaEntregaM" name="fechaEntrega">
                                        <br/>
                                    </div>
                                </div>
                                <div class="form-group">
                                    <label for="descripcion" class="col-lg-3">Descripción:</label>
                                    <div class="col-lg-9">
                                        <input type="text" class="form-control" id="descripcionM" name="descripcion">
                                        <br/>
                                    </div>
                                </div>
                                <div class="form-group">
                                    <label for="pieza" class="col-lg-3">Pieza:</label>
                                    <div class="col-lg-9">
                                        <input type="text" class="form-control" id="piezaM" name="pieza">
                                        <br/>
                                    </div>
                                </div>                           
                                <div class="form-group">
                                    <label for="ListaUsuarios" class="col-lg-3">Lista de usuarios:</label>
                                    <div class="col-lg-9">
                                        <select class="form-control" id="seleccionUsuarioId" onclick="cambioUsuario(1)">
                                            <s:iterator value="lista" var="listaPersona">
                                                <option id="A<s:property value="#listaPersona.id" />" onclick="cambioUsuario(1)" value="<s:property value="#listaPersona.id" />"><s:property value="#listaPersona.nombre" /></option>
                                            </s:iterator>
                                        </select>  
                                        <input class="hidden" id="idUsuarioMod" name="clienteString">
                                        <input class="hidden" id="idTrabajoMod" name="idString">
                                        <br/>
                                    </div>
                                </div>
                                <div class="modal-footer">
                                    <button class="btn btn-sm btn-warning" type="submit">Confirmar</button>
                                </div>
                            </s:form>
                        </div>
                        <div class="modal-footer">
                            <button type="button" class="btn btn-default" data-dismiss="modal">Cancelar</button>
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
        function mostrarModal(a) {
            alert($("#tbIdTrabajo"+a)[0].innerHTML);
            $("#idTrabajoMod").val($("#tbIdTrabajo"+a)[0].innerHTML);
            $("#fechaEntregaM").val($("#tbFechaEntrega" + a)[0].innerHTML);
            $("#descripcionM").val($("#tbDescripcion" + a)[0].innerHTML);
            $("#piezaM").val($("#tbPieza" + a)[0].innerHTML);
            var idusuario = $("#tbIdUsuario"+ a).val();
            $('#A'+idusuario).attr("selected","selected");
            $("#idUsuarioMod").val(idusuario);
            $("#myModal").modal();
        }
        function cambioUsuario(id){
            
            $('select[id=seleccionUsuarioId]').change(function(){
                console.log("hola "+$('select[id=seleccionUsuarioId]').val());
               $("#idUsuarioMod").val($('select[id=seleccionUsuarioId]').val()); 
            });
            
        }
        
        
        function cambiar(s) {
            console.log("select: " + $("#selectUsuarios").get("data"));
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
