<%-- 
    Document   : carrusel
    Created on : 18/10/2016, 01:13:13 PM
    Author     : derick
--%>
<%@page import="modelos.PubBean"%>
<%@page import="java.util.ArrayList"%>
<%@page import="modelos.PubDao"%>
<% 
    String context = request.getContextPath();
    PubDao dao = new PubDao();
    ArrayList<PubBean> lista = dao.Consult();
    String[] tags = {"first-slide","second-slide","third-slide","fourth-slide"};
    int x=0;
%>
<div id="myCarousel" class="carousel slide" data-ride="carousel">
    <ol class="carousel-indicators">
        <% for (int i=0 ; i < 4; i++) { %>
        <li data-target="#myCarousel" data-slide-to="<%=i%>"></li>
        <%}%>
    </ol>
    <div class="carousel-inner" role="listbox">
        <% for (PubBean bean : lista) { %>
        <div class="item <%if (x==0){%> active <%}%>">
            <img class="<%=tags[x]%>" src="<%=context+bean.getImagen()%>" alt="P">
            <div class="container">
                <div class="carousel-caption">
                    <h1><%=bean.getHeader()%></h1>
                    <p><%=bean.getTexto()%></p>
                    <p><a class="btn btn-lg btn-primary" href="<%=bean.getLink()%>" role="button"><%=bean.getBoton()%></a></p>
                </div>
            </div>
        </div>
        <% x++; } %>
    </div>
</div>