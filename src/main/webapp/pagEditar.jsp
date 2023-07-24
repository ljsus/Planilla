<%@page import="modelo.Seguro"%>
<%@page import="controlador.Negocio"%>
<%@page import="modelo.grutraba"%>
<%@page import="modelo.Empleado" %>
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
            Negocio obj = new Negocio();
        %>
        <%
            Empleado pe = (Empleado) request.getAttribute("dato");
        %>

          

        <div class="col-xl-14 col-lg-14">
            <div class="card shadow mb-10">

                <!-- Card Body -->
                <div class="card-body">

                    <div class="container">
                        <div class="row">
                            <div class="col-sm-12">
                                  <h2>Modificar datos de Empleado</h2>  
                                <div class="card"> 
                                    
                                    <form action="control" id="form">
                                        <input type="hidden" name="opc" value="5">
                                        <div class="form-group row">
                                            <div class="col-sm-4">
                                                Codigo de Empleado
                                                <input type="text" class="form-control form-control-user" name="codigo" value="<%=pe.getCo_empl()%>" readonly>
                                            </div>
                                            <div class="col-sm-6 mb-3 mb-sm-0"> 
                                                Tipo de empleado

                                                <select name="grupo" class="btn btn-secondary dropdown-toggle">

                                                    <%    for (grutraba x : obj.LisGrup()) {
                                                            out.print("<option value=" + pe.getCo_grup() + ">" + x.getDe_grupo());
                                                        }
                                                    %>   
                                                </select>
                                            </div>
                                        </div>
                                        <div class="form-group row">
                                            <div class="col-sm-4">
                                                Apellido Paterno
                                                <input type="text" class="form-control form-control-user" name="paterno"
                                                       value="<%=pe.getAp_pate()%>">
                                            </div>
                                            <div class="col-sm-4">
                                                Apellido Materno
                                                <input type="text" class="form-control form-control-user" name="materno"
                                                       value="<%=pe.getAp_mate()%>">
                                            </div>
                                            <div class="col-sm-4">
                                                Nombres
                                                <input type="text" class="form-control form-control-user" name="nombres"
                                                       value="<%=pe.getNom()%>">
                                            </div>
                                        </div>
                                        <div class="form-group row">
                                            <div class="col-sm-6 mb-3 mb-sm-0">
                                                FECHA DE NACIMIENTO
                                                <input type="date" class="form-control form-control-user"
                                                       name="fenaci" value="<%=pe.getFe_naci()%>">
                                            </div>

                                        </div>
                                        <div class="form-group row">
                                            <div class="col-sm-4">
                                                Estado del empleado
                                                <select class="btn btn-secondary dropdown-toggle" value="<%=pe.getIn_estd()%>" name="estado" id="cars">

                                                    <option value="A">ACTIVO</option>
                                                    <option value="I">INACTIVO</option>
                                                </select>
                                            </div>
                                            <div class="col-sm-4">
                                                <select class="btn btn-secondary dropdown-toggle"  name="tdocu" value="<%=pe.getTipo_dni()%>" id="cars">

                                                    <option value="01">DNI</option>
                                                    <option value="02">CEDULA</option>
                                                </select>
                                            </div>
                                            <div class="col-sm-4">
                                                <input type="text" class="form-control form-control-user" name="ndocu"
                                                       value="<%=pe.getNro_dni()%>" >
                                            </div>
                                        </div>
                                        <div class="form-group row">
                                            <div class="col-sm-6 mb-3 mb-sm-0">
                                                Direccion
                                                <input type="text" class="form-control form-control-user" name="direccion"
                                                       value="<%=pe.getDireccion()%>">
                                            </div>

                                        </div>
                                        <div class="form-group row">
                                            <div class="col-sm-6 mb-3 mb-sm-0">
                                                Telefono
                                                <input type="text" class="form-control form-control-user"
                                                       name="telef" value="<%=pe.getTelefono()%>">
                                            </div>
                                            <div class="col-sm-6">
                                                Masculino(M)/Femenino(F)
                                                <input class="form-control form-control-user" name="genero" id="cars" value="<%=pe.getIn_gene()%>">

                                            </div>
                                        </div>
                                        <div class="form-group row">
                                            <div class="col-sm-6 mb-3 mb-sm-0">
                                                Cuenta Bancaria
                                                <input type="text" class="form-control form-control-user" name="cuenta"
                                                       value="<%=pe.getNro_cta()%>">
                                            </div>
                                        </div>
                                        <div class="form-group row">
                                            <div class="col-sm-6 mb-3 mb-sm-0">  

                                                <select name="seguro" class="btn btn-secondary dropdown-toggle">

                                                    <%    for (Seguro x : obj.LisSeguro()) {
                                                            out.print("<option value=" + pe.getDe_segu() + ">" + x.getDe_segu());
                                                        }
                                                    %>   
                                                </select>
                                            </div>
                                        </div>
                                        <div class="form-group">
                                            <button type="submit" class="btn btn-google btn-user btn-block" >Editar Empleado</button>
                                        </div>



                                    </form>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>

    </body>
</html>
