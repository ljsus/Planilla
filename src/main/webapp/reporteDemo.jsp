<%-- 
    Document   : reporteDemo
    Created on : 19 jul. 2023, 17:55:10
    Author     : USER
--%>



<%@page import="java.io.InputStream"%>
<%@page import="net.sf.jasperreports.engine.JasperExportManager"%>
<%@page import="net.sf.jasperreports.engine.JasperFillManager"%>
<%@page import="net.sf.jasperreports.engine.JasperCompileManager"%>
<%@page import="net.sf.jasperreports.engine.util.JRLoader"%>
<%@page import="net.sf.jasperreports.engine.JasperReport"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.util.Map"%>
<%@page import="java.util.HashMap"%>
<%@page import="util.MySQLConexion"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.io.File"%>
<%@page import="net.sf.jasperreports.engine.JasperPrint"%>
<%@page import="net.sf.jasperreports.engine.JasperRunManager"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>        
        <%
           
     try {
             Connection cn = MySQLConexion.getConexion();
             String reportPath = "/reportes/reporteEmpleado.jasper"; // Ruta relativa al classpath
             Map<String, Object> parametros = new HashMap<>();
             parametros.put("co_empl", 2);

             InputStream jasperStream = getClass().getResourceAsStream(reportPath);
             JasperReport jasperReport = JasperCompileManager.compileReport(jasperStream);

             JasperPrint jasperPrint = JasperFillManager.fillReport(jasperReport, parametros, cn);
             byte[] bytes = JasperExportManager.exportReportToPdf(jasperPrint);

             response.setContentType("application/pdf");
             response.setContentLength(bytes.length);

             ServletOutputStream output = response.getOutputStream();
             output.write(bytes, 0, bytes.length);
             output.flush();
             output.close();
         } catch (Exception e) {
             e.printStackTrace();
             request.setAttribute("errorMessage", e.getMessage());
             request.getRequestDispatcher("error.jsp").forward(request, response);
         }

               
        %>
    </body>
</html>
