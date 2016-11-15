<%-- 
    Document   : servers
    Created on : 26/10/2016, 08:59:25 AM
    Author     : derick
--%>
<%@page import="java.util.List"%>
<%@page import="java.util.ArrayList"%>
<%@page import="utils.ServerCheck"%>
<%@page import="java.net.InetAddress"%>
<%
    String context = request.getContextPath();

    ServerCheck checar = new ServerCheck();
    ArrayList<String> puertos = new ArrayList();
    puertos.add("9998");
    puertos.add("32400");
    puertos.add("25565");
    puertos.add("9997");
    Object[] activos = checar.checkServers(puertos);


%>

<div class="row placeholders well">
    <!--draw.io-->
    <div class="col-xs-6 col-sm-3 placeholder">
        <img src="<%=context%>/images/draw.png" width="200px" height="200px" 
             class="img-responsive" alt="Generic placeholder thumbnail">
        <h4>
            Draw.io 
            <% if (activos[0].toString().equals("true")) {%>
            <i class="fa fa-thumbs-o-up" aria-hidden="true"></i>
            <% } else { %>
            <i class="fa fa-thumbs-o-down" aria-hidden="true"></i>
            <%}%>
        </h4>
        <span class="text-muted">Hacer diagramas</span>
    </div>
    <!--plex-->
    <div class="col-xs-6 col-sm-3 placeholder">
        <img src="<%=context%>/images/plex.jpg" width="200px" height="200px" 
             class="img-responsive" alt="Generic placeholder thumbnail">
        <h4>
            Plex 
            <% if (activos[1].toString().equals("true")) {%>
            <i class="fa fa-thumbs-o-up" aria-hidden="true"></i>
            <% } else { %>
            <i class="fa fa-thumbs-o-down" aria-hidden="true"></i>
                <%}%>
        </h4>
        <span class="text-muted">Servidor de series y peliculas</span>
    </div>
    <!--minecraft-->    
    <div class="col-xs-6 col-sm-3 placeholder">
        <img src="<%=context%>/images/maincra.jpg" width="200px" height="200px" 
             class="img-responsive" alt="Generic placeholder thumbnail" 
             style="width: 200px;height: 179px">
        <h4>
            Maincraft 
            <% if (activos[2].toString().equals("true")) {%>
            <i class="fa fa-thumbs-o-up" aria-hidden="true"></i>
            <% } else { %>
            <i class="fa fa-thumbs-o-down" aria-hidden="true"></i>
                <%}%>
        </h4>
        <span class="text-muted">Proximamente</span>
    </div>
    <!--Cod4-->
    <div class="col-xs-6 col-sm-3 placeholder">
        <img src="<%=context%>/images/cod4.jpeg" width="200px" height="200px" 
             class="img-responsive" alt="Generic placeholder thumbnail" 
             style="width: 200px;height: 179px">
        <h4>
            Call of Duty 4 
            <% if (activos[3].toString().equals("true")) {%>
            <i class="fa fa-thumbs-o-up" aria-hidden="true"></i>
            <% } else { %>
            <i class="fa fa-thumbs-o-down" aria-hidden="true"></i>
            <%}%>
        </h4>
        <span class="text-muted">Proximamente</span>
    </div>

    <div class="col-md-12 col-lg-12 col-xs-12 col-sm-12" style="text-align: justify">
        <h5><i class="fa fa-thumbs-o-up" aria-hidden="true"></i> Servidor activo</h5>
        <h5><i class="fa fa-thumbs-o-down" aria-hidden="true"></i> Servidor caido/mantenimiento</h5>
    </div>

</div>
