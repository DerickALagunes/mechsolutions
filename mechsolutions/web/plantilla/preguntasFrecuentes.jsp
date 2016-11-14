<%-- 
    Document   : preguntasFrecuentes
    Created on : 28/10/2016, 11:51:40 AM
    Author     : derick
--%>

<%@page import="modelos.FAQBean"%>
<%@page import="java.util.ArrayList"%>
<%@page import="modelos.FAQDao"%>
<%
    FAQDao dao = new FAQDao();
    ArrayList<FAQBean> lista = dao.Consult();

    for (FAQBean pregunta : lista) {
%>

<h4 class="page-header"><%=pregunta.getTema()%></h4>
<h5><%=pregunta.getRespuesta()%></h5>
</br>

<% }%>