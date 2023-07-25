<%-- 
    Document   : reporteItext
    Created on : 21 jul. 2023, 17:49:26
    Author     : USER
--%>


<%@page import="com.itextpdf.text.Element"%>
<%@page import="java.time.format.DateTimeFormatter"%>
<%@page import="java.time.LocalDate"%>
<%@page import="java.text.DateFormat"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.sql.Date"%>
<%@page import="java.io.FileOutputStream"%>
<%@page import="java.io.File"%>
<%@page import="java.io.OutputStream"%>
<%@page import="com.itextpdf.text.Paragraph"%>
<%@page import="com.itextpdf.text.pdf.PdfWriter"%>
<%@page import="java.io.ByteArrayOutputStream"%>
<%@page import="com.itextpdf.text.Document"%>
<%@page import="java.util.List"%>
<%@page import="modelo.Empleado"%>
<%@page import="controlador.Negocio"%>
<%@ page contentType="application/pdf" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <%
            try {
                Negocio obj = new Negocio();
                List<Empleado> listaEmpleados = obj.LisTotal();
                
                Document document = new Document();
                PdfWriter.getInstance(document, response.getOutputStream());
                                  
                document.open();
                
                LocalDate fechaActual = LocalDate.now();
                DateTimeFormatter dateFormat = DateTimeFormatter.ofPattern("dd/MM/yyyy");
                String fechaStr = fechaActual.format(dateFormat);
                
  
                //Agregar la fecha al documento como un nuevo párrafo
                Paragraph fechaParagraph = new Paragraph("Fecha del reporte: " + fechaStr);
                fechaParagraph.setAlignment(Element.ALIGN_RIGHT); // Alineación a la derecha
                document.add(fechaParagraph);
                
                //Agregar el título centrado al documento como un nuevo párrafo
                Paragraph tituloParagraph = new Paragraph("Reporte de Trabajadores");
                tituloParagraph.setAlignment(Element.ALIGN_CENTER); // Alineación al centro
                document.add(tituloParagraph);            
                document.add(new Paragraph(" "));
                
                for (Empleado empleado : listaEmpleados) {
                        document.add(new Paragraph("Código: " + empleado.getCo_empl()));
                        document.add(new Paragraph("Nombres: " + empleado.getDe_empl()));
                        document.add(new Paragraph("Nro DNI: " + empleado.getNro_dni()));  
                        document.add(new Paragraph("Nro Telefono: " + empleado.getTelefono()));  
                        document.add(new Paragraph("---------------------------------------------------------------------------------------------------------------------------"));
                        
                    }

                document.close();
            } catch (Exception e) {
                e.printStackTrace();
                response.getWriter().write("Error generating PDF.");
            }
        %>
    </body>
</html>
