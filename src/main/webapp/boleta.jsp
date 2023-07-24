
<%@page import="modelo.Planilla"%>
<%@page import="controlador.Negocio"%>
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
        <link rel="stylesheet" href="css/normalize.css">
        <link rel="stylesheet" href="css/main.css">
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet"
              integrity="sha384-9ndCyUaIbzAi2FUVXJi0CjmCapSmO7SnpJef0486qhLnuZ2cdeRhO02iuK6FUUVM" crossorigin="anonymous">
        <style type="text/css">
            #txt{
                width: 1200px;
            }
            #botonn{
                margin: 0 auto;
                margin-right: 260px;
            }
        </style>
    </head>
    <body>
        <%
            Negocio obj = new Negocio();
        %>
        <%
            HttpSession ses = request.getSession();
            List<Planilla> lis = (ArrayList<Planilla>) ses.getAttribute("cli");
            List<Planilla1> lis1 = (ArrayList<Planilla1>) ses.getAttribute("cli1");
            List<Planilla2> lis2 = (ArrayList<Planilla2>) ses.getAttribute("cli2");
            List<Planilla3> lis3 = (ArrayList<Planilla3>) ses.getAttribute("cli3");
           double sm=0;
           double sm1=0;
           double sm2=0;
           double res=0;
        %>  
        <div class="container">
            <div class="jumbotron" style="padding:20px;text-align:center">
                <h1>Mi Boleta de Pago</h1>
                <p class="lead">En este módulo podras visualizar la boleta de pago correspondiente al mes.</p>

        <div class="sunarp" id="plantilla">       
            <table class="tg">
                <tr>
                    <th class="tg-xldj" rowspan="9"><img src="img/logo.jpg" alt="150" height="300"></th>
                    <th class="tg-fymr" colspan="2">ACIS PROCESS SAC</th>
                    <th class="tg-fymr" colspan="2" width="180">BOLETA DE PAGO</th>
                    <th class="tg-fymr" colspan="2">MES DE PAGO ENERO DEL 2023</th>
                </tr>
                <tr>
                    <td class="tg-fymr" colspan="2">RUC No. : 20260998898</td>
                    <td class="tg-fymr" colspan="2">
                        Planilla de Empleados
                    </td>
                    <td class="tg-0pky" colspan="2"></td>
                </tr>
                <tr>
                    <td class="tg-0pky">Dependencia:</td>
                    <td class="tg-0pky">
                        UNIDAD DE TECNOLOGÍAS DE LA INFORMACIÓN
                    </td>
                    <td class="tg-0pky" colspan="2">Fecha de Ingreso:</td>
                    <td class="tg-0pky" colspan="2">
                        14/06/2020
                    </td>
                </tr>
                <tr>
                    <td class="tg-0pky">Código:</td>
                    <td class="tg-0pky">
                        12345
                    </td>
                    <td class="tg-0pky" colspan="2">Nivel Remunerativo:</td>
                    <td class="tg-0pky" colspan="2">
                        SNR
                    </td>
                </tr>
                <tr>
                    <td class="tg-0pky">Nombres:</td>
                    <td class="tg-0pky">
                        Ricardo Saldaña León
                    </td>
                    <td class="tg-0pky" colspan="2">Número de cuenta:</td>
                    <td class="tg-0pky" colspan="2">
                        S/N
                    </td>
                </tr>
                <tr>
                    <td class="tg-0pky">Lib. Elect. / DNI:</td>
                    <td class="tg-0pky">
                        47384709
                    </td>
                    <td class="tg-0pky" colspan="2">Cargo Estructural:</td>
                    <td class="tg-0pky" colspan="2">
                        Especialista de Base de Datos
                    </td>
                </tr>
                <tr>
                    <td class="tg-0pky">Carnet ESSALUD:</td>
                    <td class="tg-0pky">
                        S/N
                    </td>
                    <td class="tg-0pky" colspan="2">Condic. Laboral:</td>
                    <td class="tg-0pky" colspan="2">
                        Trabajador permanente
                    </td>
                </tr>
                <tr>
                    <td class="tg-0pky">AFP: INTEGRA</td>
                    <td class="tg-0pky">
                        CUSP: S/N
                    </td>
                    <td class="tg-0pky" colspan="2">Tiempo Servicio:</td>
                    <td class="tg-0pky" colspan="2"></td>
                </tr> 
                <tr>
                    <td class="tg-0pky">Días laborados</td>
                    <td class="tg-0pky">30 &nbsp;&nbsp;&nbsp;&nbspHoras laboradas &nbsp;&nbsp;&nbsp;&nbsp30</td>
                    <td class="tg-0pky" colspan="2">Vacaciones Efectivas:</td>
                    <td class="tg-0pky" colspan="2">15</td>
                </tr>                     
                <table class="tg" >
                    <tr class="borde">
                        <th class="tg-7btt" colspan="3">INGRESOS</th>
                        <th class="tg-7btt" colspan="2">
                            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;DESCUENTOS&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                        </th>
                        <th class="tg-7btt" colspan="2">APORTES</th>
                    </tr>
                    <tr class="">
                        <td class="tg-0pky primera" colspan="2" >
                            <%
                                for (Planilla1 x : lis1) {
                                    out.print("<h6>" + x.getDe_cpto() + "</h6>" );

                                }  
                            %> 
                          
                          
                            
                           
                        </td>
                        <td class="tg-dvpl segunda">
                            <%
                                for (Planilla1 x : lis1){
                                    out.print("<h6>" + x.getMonto() + "</h6>");
                                }
                            %>  
                        </td>
                        <td class="tg-0pky tercera">
                            <%
                                for (Planilla2 x : lis2) {
                                    out.print("<h6>" + x.getDe_cpto() + "</h6>" );

                                }  
                            %>            
                        </td>
                        <td class="tg-dvpl cuarta">
                            <%
                                for (Planilla2 x : lis2){
                                    out.print("<h6>" + x.getMonto() + "</h6>");
                                }
                            %> 
                            <div id="lbl_monto_descto">

                            </div>
                        </td>
                        <td class="tg-0pky quinta">
                            <%
                                for (Planilla3 x : lis3) {
                                    out.print("<h6>" + x.getDe_cpto() + "</h6>" );

                                }  
                            %>    
                        </td>
                        <td class="tg-0pky sexta">
                            <%
                                for (Planilla3 x : lis3){
                                    out.print("<h6>" + x.getMonto() + "</h6>");
                                }
                            %> 
                        </td>
                    </tr>
                    <tr class="">
                        <td class="tg-0pky" colspan="2">

                        </td>
                        <td class="tg-dvpl">

                        </td>
                        <td class="tg-0pky">

                        </td>
                        <td class="tg-0pky">

                            <br />&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                        </td>
                        <td class="tg-0pky">

                        </td>
                        <td class="tg-0pky">

                        </td>
                    </tr>
                    <tr>
                        <td class="tg-0pky" colspan="2">

                        </td>
                        <td class="tg-dvpl">

                        </td>
                        <td class="tg-0pky">

                        </td>
                        <td class="tg-0pky">

                            <br />&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                        </td>
                        <td class="tg-0pky">

                        </td>
                        <td class="tg-0pky">

                        </td>
                    </tr>
                    <tr>
                        <td class="tg-0pky" colspan="2">

                        </td>
                        <td class="tg-dvpl">

                        </td>
                        <td class="tg-0pky">

                        </td>
                        <td class="tg-0pky">

                            <br />&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                        </td>
                        <td class="tg-0pky">

                        </td>
                        <td class="tg-0pky">

                        </td>
                    </tr>
                    <tr>
                        <td class="tg-0pky" colspan="2">

                        </td>
                        <td class="tg-dvpl">

                        </td>
                        <td class="tg-0pky">

                        </td>
                        <td class="tg-0pky">

                            <br />&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                        </td>
                        <td class="tg-0pky">

                        </td>
                        <td class="tg-0pky">

                        </td>
                    </tr>
                    <tr>
                        <td class="tg-0pky" colspan="2">

                        </td>
                        <td class="tg-dvpl">

                        </td>
                        <td class="tg-0pky">

                        </td>
                        <td class="tg-0pky">

                            <br />&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                        </td>
                        <td class="tg-0pky">

                        </td>
                        <td class="tg-0pky">

                        </td>
                    </tr>
                    <tr>
                        <td class="tg-0pky" colspan="2">

                        </td>
                        <td class="tg-dvpl">

                        </td>
                        <td class="tg-0pky">

                        </td>
                        <td class="tg-0pky">

                            <br />&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                        </td>
                        <td class="tg-0pky">

                        </td>
                        <td class="tg-0pky">

                        </td>
                    </tr>
                    <tr class="borde">
                        
                        <% for (Planilla1 x : lis1) {sm=sm+x.getMonto();}%> 
                        <% for (Planilla2 x : lis2) {sm1=sm1+x.getMonto();}%> 
                        <% for (Planilla3 x : lis3) {sm2=sm2+x.getMonto();}%>
                              <% res=sm-sm1; %>
                              
                        <td class="tg-dvpl" colspan="2">Total Ingreso:<%out.print("<h6>" + sm + "</h6>" );%> 
                            
                            <br>Total Líquido:<%out.print("<h6>" + res + "</h6>" );%> </td>
                        <td class="tg-dvpl">

                        </td>
                        <td class="tg-6ic8">Total Descuento:<%out.print("<h6>" + sm1 + "</h6>" );%> </td>
                        <td class="tg-dvpl">

                        </td>
                        <td class="tg-6ic8">Total Aporte:<%out.print("<h6>" + sm2 + "</h6>" );%></td>
                        <td class="tg-0pky">

                        </td>
                    </tr>
                </table>
            </table>
        </div>                                     
        <div id="mensaje_planilla" class="text-center">
            <b><font color="#DF0101">ABONADO EN CUENTA: </font></b><b>09/07/2023</b>
            <br /><br />       
        </div>

        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"
                integrity="sha384-geWF76RCwLtnZ8qwWowPQNguL3RmwHVBC9FhGdlKrxdiJJigb/j/68SIy3Te4Bkz"
        crossorigin="anonymous"></script>
        <a class="collapse-item" href="pag_plani.jsp">Retornar....</a>
    </body>
</html>
