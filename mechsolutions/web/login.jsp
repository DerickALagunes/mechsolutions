<%-- 
    Document   : login
    Created on : 18/10/2016, 03:05:18 PM
    Author     : derick
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="s" uri="/struts-tags" %>
<!DOCTYPE html>
<html>
    <jsp:include page="plantilla/header.jsp" /> 
    <body>
        <div class="container">
            <jsp:include page="plantilla/menu.jsp" />

            <div class="jumbotron">
                <s:form action="login" class="form-signin" method="POST" role="form">
                    <h2 class="form-signin-heading">Iniciar sesión</h2>
                    <label for="inputUsuario" class="sr-only">Usuario</label>
                    <input type="email" id="usuario" name="usuario" class="form-control" placeholder="Jhon_Smith@7.julio" required autofocus>
                    <label for="inputPassword" class="sr-only">Contraseña</label>
                    <input type="password" name="password" id="password" class="form-control" placeholder="Contraseña" required>
                    </br>
                    <button class="btn btn-lg btn-primary btn-block" type="submit">Ingresar</button>
                    </br>
                </s:form>

                <input value="<s:property value="mensaje" />" id="mensajediv" class="hidden"/>


                <div class="alert" id="mensajeValidacion">                        
                </div>


            </div>

            <footer class="footer">
                <p>&copy; 2016 MechSolutions.</p>
            </footer>
        </div> <!-- /container -->

        <jsp:include page="plantilla/foot.jsp" /> 
        <script>
            $(document).ready(function () {
                setInterval(verificar, 800);

            });
            function verificar() {
                if ($("#mensajediv").attr('value') === "error") {
                    $("#mensajeValidacion").addClass('alert-danger');
                    $("#mensajeValidacion").show().html("<strong>Error</strong> No se encontro usuario.");
                    setTimeout(function () {
                        $(".alert").fadeOut(1500);
                        $('#mensajeValidacion').hide('slow');
                    }, 5000);
                    $("#mensajediv").val("")
                    $("#mensajediv").attr('value','');
                }
                ;
            }



        </script>
    </body>
</html>
