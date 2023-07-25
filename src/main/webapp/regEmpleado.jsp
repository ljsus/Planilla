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
                            <h1 class="h3 mb-0 text-gray-800">Registro de Empleados</h1>                   
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
                                            <div class="row">
                                                <div class="col-sm-12">
                                                    <div class="card"> 
                                                        <form class="user" action="control" id="id_form">
                                                            <input type="hidden" name="opc" value="2">
                                                            <div class="form-group row">
                                                                <div class="col-sm-6 mb-3 mb-sm-0"> 

                                                                    <select name="grupo" class="btn btn-secondary dropdown-toggle">
                                                                        <option selected>Tipo de empleado</option>
                                                                        <%    for (grutraba x : obj.LisGrup()) {
                                                                                out.print("<option value=" + x.getCo_grup() + ">" + x.getDe_grupo());
                                                                            }
                                                                        %>   
                                                                    </select>
                                                                </div>
                                                            </div>
                                                            <div class="form-group row">
                                                                <div class="col-sm-4">
                                                                    <input type="text" class="form-control form-control-user" name="paterno"
                                                                           placeholder="APELLIDO PATERNO" required>
                                                                </div>
                                                                <div class="col-sm-4">
                                                                    <input type="text" class="form-control form-control-user" name="materno"
                                                                           placeholder="APELLIDO MATERNO" required>
                                                                </div>
                                                                <div class="col-sm-4">
                                                                    <input type="text" class="form-control form-control-user" name="nombres"
                                                                           placeholder="NOMBRES" required>
                                                                </div>
                                                            </div>
                                                            <div class="form-group row">
                                                                <div class="col-sm-6 mb-3 mb-sm-0">
                                                                    FECHA DE NACIMIENTO
                                                                    <input type="date" class="form-control form-control-user"
                                                                           name="fenaci" placeholder="FECHA DE NACIMIENTO" required>
                                                                </div>
                                                                <div class="col-sm-6">
                                                                    FECHA DE INGRESO
                                                                    <input type="date" class="form-control form-control-user"
                                                                           name="feingreso" placeholder="FECHA DE INGRESO" required>
                                                                </div>
                                                            </div>
                                                            <div class="form-group row">
                                                                <div class="col-sm-4">
                                                                    <select class="btn btn-secondary dropdown-toggle" name="estado" id="cars" >
                                                                        <option selected>ESTADO DEL EMPLEADO</option>
                                                                        <option value="A">ACTIVO</option>
                                                                        <option value="I">INACTIVO</option>
                                                                    </select>
                                                                </div>
                                                                <div class="col-sm-4">
                                                                    <select class="btn btn-secondary dropdown-toggle" name="tdocu" id="cars">
                                                                        <option selected>TIPO DE DOCUMENTO</option>
                                                                        <option value="01">DNI</option>
                                                                        <option value="02">CEDULA</option>
                                                                    </select>
                                                                </div>
                                                                <div class="col-sm-4">
                                                                    <input type="text" class="form-control form-control-user" name="ndocu"
                                                                           placeholder="NUMERO DE DOCUMENTO" required>
                                                                </div>
                                                            </div>
                                                            <div class="form-group row">
                                                                <div class="col-sm-6 mb-3 mb-sm-0">
                                                                    <input type="text" class="form-control form-control-user" name="direccion"
                                                                           placeholder="DIRECCION" required>
                                                                </div>

                                                            </div>
                                                            <div class="form-group row">
                                                                <div class="col-sm-6 mb-3 mb-sm-0">
                                                                    <input type="text" class="form-control form-control-user"
                                                                           name="telef" placeholder="TELEFONO" required>
                                                                </div>
                                                                <div class="col-sm-6">
                                                                    <select class="btn btn-secondary dropdown-toggle" name="genero" id="cars">
                                                                        <option selected>GENERO</option>
                                                                        <option value="M">MASCULINO</option>
                                                                        <option value="F">FEMENINO</option>
                                                                    </select>
                                                                </div>
                                                            </div>
                                                            <div class="form-group row">
                                                                <div class="col-sm-6 mb-3 mb-sm-0">
                                                                    <input type="text" class="form-control form-control-user" name="cuenta"
                                                                           placeholder="CUENTA BANCARIA" required>
                                                                </div>
                                                            </div>
                                                            <div class="form-group row">
                                                                <div class="col-sm-6 mb-3 mb-sm-0">  

                                                                    <select name="seguro" class="btn btn-secondary dropdown-toggle">
                                                                        <option selected>TIPO DE SEGURO</option>
                                                                        <%    for (Seguro x : obj.LisSeguro()) {
                                                                                out.print("<option value=" + x.getCo_segu() + ">" + x.getDe_segu());
                                                                            }
                                                                        %>   
                                                                    </select>
                                                                </div>
                                                            </div>
                                                            <div class="form-group">
                                                                <button type="submit" class="btn btn-google btn-user btn-block" >REGISTRAR EMPLEADO</button>
                                                            </div>



                                                        </form>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>

                        <!-- Content Row -->


                    </div>
                    <!-- /.container-fluid -->

                </div>
                <!-- End of Main Content -->

                <!-- Footer -->
                <footer class="sticky-footer bg-white">
                    <div class="container my-auto">
                        <div class="copyright text-center my-auto">
                            <span>Copyright &copy; Your Website 2021</span>
                        </div>
                    </div>
                </footer>
                <!-- End of Footer -->

            </div>
            <!-- End of Content Wrapper -->

        </div>
        <!-- End of Page Wrapper -->

        <!-- Scroll to Top Button-->
        <a class="scroll-to-top rounded" href="#page-top">
            <i class="fas fa-angle-up"></i>
        </a>

        <!-- Logout Modal-->
        <div class="modal fade" id="logoutModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel"
             aria-hidden="true">
            <div class="modal-dialog" role="document">
                <div class="modal-content">
                    <div class="modal-header">
                        <h5 class="modal-title" id="exampleModalLabel">Ready to Leave?</h5>
                        <button class="close" type="button" data-dismiss="modal" aria-label="Close">
                            <span aria-hidden="true">×</span>
                        </button>
                    </div>
                    <div class="modal-body">Select "Logout" below if you are ready to end your current session.</div>
                    <div class="modal-footer">
                        <button class="btn btn-secondary" type="button" data-dismiss="modal">Cancel</button>
                        <a class="btn btn-primary" href="login.html">Logout</a>
                    </div>
                </div>
            </div>
        </div>

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
