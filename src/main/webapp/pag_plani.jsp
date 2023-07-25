<%@page import="java.sql.*"%>
<%@page import="com.mysql.jdbc.Driver"%>
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
            Negocio obj = new Negocio();
        %>
        <%
            HttpSession sesion = request.getSession();
            if (sesion.getAttribute("logueado") == null || sesion.getAttribute("logueado").equals("0")) {
                response.sendRedirect("login.jsp");

            }
            Connection con = null;
            Statement st = null;
            ResultSet rs = null;

        %>
    <body id="page-top">

        <!-- Page Wrapper -->
        <div id="wrapper">

            <!-- Sidebar -->
            <ul class="navbar-nav bg-gradient-primary sidebar sidebar-dark accordion" id="accordionSidebar">

                <!-- Sidebar - Brand -->
                <a class="sidebar-brand d-flex align-items-center justify-content-center" href="intra.jsp">
                    <div class="sidebar-brand-icon rotate-n-15">
                        <i class="fas fa-laugh-wink"></i>
                    </div>
                    <div class="sidebar-brand-text mx-3">SB Admin <sup>2</sup></div>
                </a>

                <!-- Divider -->
                <hr class="sidebar-divider my-0">

                <!-- Nav Item - Dashboard -->
                <li class="nav-item active">
                    <a class="nav-link" href="intra.jsp">
                        <i class="fas fa-fw fa-tachometer-alt"></i>
                        <span>Dashboard</span></a>
                </li>

                <!-- Divider -->

                <!-- Divider -->
                <hr class="sidebar-divider">

                <!-- Heading -->
                <div class="sidebar-heading">
                    Interface
                </div>

                <!-- Nav Item - Pages Collapse Menu -->
                <li class="nav-item">
                    <a class="nav-link collapsed" href="#" data-toggle="collapse" data-target="#collapseTwo"
                       aria-expanded="true" aria-controls="collapseTwo">
                        <i class="fas fa-fw fa-cog"></i>
                        <span>Components</span>
                    </a>
                    <div id="collapseTwo" class="collapse" aria-labelledby="headingTwo" data-parent="#accordionSidebar">
                        <div class="bg-white py-2 collapse-inner rounded">
                            <h6 class="collapse-header">Custom Components:</h6>
                            <a class="collapse-item" href="regEmpleado.jsp">Registrar Empleado</a>
                            <a class="collapse-item" href="pag_plani.jsp">Planilla</a>
                        </div>
                    </div>
                </li>



                <!-- Divider -->
                <hr class="sidebar-divider">

                <!-- Heading -->
                <div class="sidebar-heading">
                    Addons
                </div>

                <!-- Nav Item - Pages Collapse Menu -->
                <li class="nav-item">
                    <a class="nav-link collapsed" href="#" data-toggle="collapse" data-target="#collapsePages"
                       aria-expanded="true" aria-controls="collapsePages">
                        <i class="fas fa-fw fa-folder"></i>
                        <span>Pages</span>
                    </a>
                    <div id="collapsePages" class="collapse" aria-labelledby="headingPages" data-parent="#accordionSidebar">
                        <div class="bg-white py-2 collapse-inner rounded">
                            <h6 class="collapse-header">PDF:</h6>
                            <a  class="collapse-item" href="reporteItext.jsp" target="target">Reporte de empleados</a>
                        </div>
                    </div>
                </li>

         

                <!-- Divider -->
                <hr class="sidebar-divider d-none d-md-block">



                <!-- Sidebar Toggler (Sidebar) -->
                <div class="text-center d-none d-md-inline">
                    <button class="rounded-circle border-0" id="sidebarToggle"></button>
                </div>



            </ul>
            <!-- End of Sidebar -->

            <!-- Content Wrapper -->
            <div id="content-wrapper" class="d-flex flex-column">

                <!-- Main Content -->
                <div id="content">


                    <!-- End of Topbar -->

                    <!-- Begin Page Content -->
                    <div class="container-fluid">

                        <!-- Page Heading -->
                        <div class="d-sm-flex align-items-center justify-content-between mb-4">
                            <h1 class="h3 mb-0 text-gray-800">Boleta de Pago</h1>                   
                            <form class="navbar-text" action="logout.jsp">
                                <a><i class="fa fa-user-circle-o" aria-hidden="true"></i> </a>
                                <button class="btn btn-outline-danger my-2 my-sm-0 ml-2" type="submit">Log out</button>
                            </form>
                        </div>

                        <!-- Content Row -->
                        <div class="row">

                        </div>

                        <!-- Content Row -->

                        <div class="row">

                            <!-- Area Chart -->
                            <div class="col-xl-14 col-lg-14">
                                <div class="card shadow mb-10">

                                    <!-- Card Body -->
                                    <div class="card-body">

                                        <div class="container">
                                            <div class="jumbotron" style="padding:20px;text-align:center">

                                                <p class="lead">En este módulo podras visualizar la boleta de pago correspondiente al mes.</p>
                                            </div>
                                            <div class="row">
                                                <div class="col-sm-12">
                                                    <div class="card">
                                                        <div class="card-header bg-primary text-white">
                                                            <p>Filtro de búsqueda</p>                     
                                                        </div>
                                                        <div class="card-body form-inline">
                                                            <!--<form action="control" >-->
                                                            <form action="control" target="win" >
                                                                <input type="hidden" name="opc" value="3">
                                                                
                                                                <div class="col-md-10">
                                                                    <div class="form-group">
                                                                        <label class="control-label" for="id_esp">Especialidad</label>
                                                                        <select name="codi" class="form-control" value="1">
                                                                            <%    for (Empleado x : obj.LisTotal()) {
                                                                                    out.print("<option value=" + x.getCo_empl() + ">" + x.getDe_empl());
                                                                                }
                                                                            %>   
                                                                        </select>
                                                                    </div>
                                                                    <select class="form-control" name="tipo" id="cars">
                                                                        <option selected>--Seleccione tipo de planilla--</option>
                                                                        <option value="1">Ingresos</option>
                                                                        <option value="2">Descuentos</option>
                                                                        <option value="3">Aportes</option>
                                                                    </select>
                                                                    <br>
                                                                    <select class="form-control" name="mes" id="txt">
                                                                        <option selected>--Mes--</option>
                                                                        <option value="1">Enero</option>
                                                                        <option value="2">Febrero</option>
                                                                        <option value="3">Marzo</option>
                                                                        <option value="4">Abril</option>
                                                                        <option value="5">Mayo</option>
                                                                        <option value="6">Junio</option>
                                                                        <option value="7">Julio</option>
                                                                        <option value="8">Agosto</option>
                                                                        <option value="9">Setiembre</option>
                                                                        <option value="10">Octubre</option>
                                                                        <option value="11">Noviembre</option>
                                                                        <option value="12">Diciembre</option>
                                                                    </select>
                                                                    <br>
                                                                    <select class="form-control" name="an" id="txt">
                                                                        <option selected>--Año--</option>
                                                                        <option value="2022">2022</option>
                                                                        <option value="2023">2023</option>
                                                                    </select>
                                                                </div>
                                                                <br>
                                                                <div class="col-md-4" id="botonn">

                                                                    <button type="submit" class="btn btn-primary" >Buscar</button>
                                                                    <a class="collapse-item" href="boleta.jsp">Mostrar Boleta</a>
                                                                </div>
                                                            </form>
                                                            <iframe name="win" height="300" width="900"></iframe>


                                                        </div>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>


                        </div>


                    </div>
                    <!-- /.container-fluid -->

                </div>
                <!-- End of Main Content -->


                <!-- End of Footer -->

            </div>
            <!-- End of Content Wrapper -->

        </div>
        <!-- End of Page Wrapper -->




        <!-- Bootstrap core JavaScript-->
        <script src="vendor/jquery/jquery.min.js"></script>
        <script src="vendor/bootstrap/js/bootstrap.bundle.min.js"></script>

        <!-- Core plugin JavaScript-->
        <script src="vendor/jquery-easing/jquery.easing.min.js"></script>

        <!-- Custom scripts for all pages-->
        <script src="js/sb-admin-2.min.js"></script>

        <!-- Page level plugins -->
        <script src="vendor/chart.js/Chart.min.js"></script>

        <!-- Page level custom scripts -->
        <script src="js/demo/chart-area-demo.js"></script>
        <script src="js/demo/chart-pie-demo.js"></script>

    </body>
</body>
</html>
