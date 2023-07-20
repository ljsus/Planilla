
<%@page import="java.sql.*"%>
<%@page import="com.mysql.jdbc.Driver"%>
<%@page import="modelo.*,java.util.*" %>
<%@page import="modelo.*,controlador.Negocio" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
         <link href="vendor/fontawesome-free/css/all.min.css" rel="stylesheet" type="text/css">
        <link
            href="https://fonts.googleapis.com/css?family=Nunito:200,200i,300,300i,400,400i,600,600i,700,700i,800,800i,900,900i"
            rel="stylesheet">

        <!-- Custom styles for this template-->
        <link href="css/sb-admin-2.min.css" rel="stylesheet">
    </head>
    <body>

        <%
            HttpSession ses = request.getSession();
            List<Planilla> lis = (ArrayList<Planilla>) ses.getAttribute("cli");
        %>   

        <table class="table table-hover">
            <thead>
                <tr class="text-black-50">
                    <th>AREA<th>MONTO<th>CODIGO TIPO PLAN<th>FECHA PLAN<th>FECHA PAGO<th>FECHA MIGRA
            </thead>


            <%
                for (Planilla x : lis) {
                    out.print("<tr><td>" + x.getDe_cpto() + "<td>" + x.getMonto() + "<td>" + x.getCo_tipo_plan() + "<td>" + x.getFe_plan()
                            + "<td>" + x.getFe_pago() + "<td>" + x.getFe_migra());

                }

            %> 

        </table>
    </body>
</html>
