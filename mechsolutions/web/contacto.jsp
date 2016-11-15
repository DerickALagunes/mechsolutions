<%-- 
    Document   : contacto
    Created on : 18/10/2016, 03:05:02 PM
    Author     : derick
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="s" uri="/struts-tags" %>
<jsp:include page="plantilla/header.jsp" /> 
<body>
    <div class="container">
        <s:if test="%{#session.size==0}">
            <jsp:include page="plantilla/menu.jsp" />
        </s:if>
        <s:else>
            <jsp:include page="plantilla/menuUsuario.jsp" />
        </s:else>

        <div class="jumbotron" style="text-align: justify">

            <h3 class="page-header"><i class="fa fa-info-circle fa-2x" aria-hidden="true"></i>
                <u>Contacto con Mechsolutions:</u>
            </h3>
            </br>
            <table style="border-collapse: collapse;width: 100%;">
                <h5>
                    <tr>
                        <td>
                            <i class="fa fa-phone fa-2x" aria-hidden="true"></i>
                        </td>
                        <td>
                            <b>Telefonos de contacto:</b>  

                        </td>
                        <td>
                            777 190 75 24 <i class="fa fa-whatsapp fa-2x" aria-hidden="true"></i> </br> ó 777 422 39 07
                        </td>
                    </tr>
                </h5>
                <h5>
                    <tr>
                        <td>
                            <i class="fa fa-facebook fa-2x" aria-hidden="true"></i>
                        </td>
                        <td>
                            <b> Facebook: </b>
                        </td>
                        <td>
                            pagina de face
                        </td>
                    </tr>
                </h5>
                <h5>
                    <tr>
                        <td>
                            <i class="fa fa-envelope fa-2x" aria-hidden="true"></i> 
                        </td>
                        <td>
                            <b>Email:</b>
                        </td>
                        <td>
                            <b>mech_solutions@outlook.com</b>
                        </td>
                    </tr>
                </h5>
                <h5>
                    <tr>
                        <td>
                            <i class="fa fa-map-marker fa-2x" aria-hidden="true"></i>
                        </td>
                        <td>
                            <b>Dirección:</b> 
                        </td>
                        <td>
                            <a href="#mapa">Calle nueva Alemania #45 F</a>
                        </td>
                    </tr>
                </h5>
            </table>

            </br></br>

            <div id="mapa" style="width: 99%; height: 400px;"></div>

        </div>

        <footer class="footer">
            <p>&copy; 2016 MechSolutions.</p>
        </footer>
    </div>
    <jsp:include page="plantilla/foot.jsp" /> 
    <script>
        var mymap = L.map('mapa').setView([18.953386, -99.230377], 16);

        L.tileLayer('https://api.tiles.mapbox.com/v4/{id}/{z}/{x}/{y}.png?access_token=pk.eyJ1IjoiYXhlbGluaXllcyIsImEiOiJjaXVwcWpydmcwMXIxMnBtbGtvMDltMjVyIn0.Ii6Cb4e8sI2Aab46QE1RNA', {
            maxZoom: 18,
            attribution: 'Map data &copy; <a href="http://openstreetmap.org">OpenStreetMap</a> contributors, ' +
                    '<a href="http://creativecommons.org/licenses/by-sa/2.0/">CC-BY-SA</a>, ' +
                    'Imagery © <a href="http://mapbox.com">Mapbox</a>',
            id: 'mapbox.streets-basic'
        }).addTo(mymap);

        var marker = L.marker([18.953386, -99.230377]).addTo(mymap);

    </script>
</body>
</html>
