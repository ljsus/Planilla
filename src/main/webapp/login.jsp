<%@page import="java.sql.*"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.1/dist/css/bootstrap.min.css" rel="stylesheet">
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.1/dist/js/bootstrap.bundle.min.js"></script>
        <link href="css/main.css" rel="stylesheet" type="text/css"/>
        <link href="css/form.css" rel="stylesheet" type="text/css"/>
        <link
            href="https://fonts.googleapis.com/css?family=Nunito:200,200i,300,300i,400,400i,600,600i,700,700i,800,800i,900,900i"
            rel="stylesheet">
        <link href="css/sb-admin-2.min.css" rel="stylesheet">

        <title>JSP Page</title>
    </head>
    <body>

        <br>


        <br>  


        <div class="container">

            <!-- Outer Row -->
            <div class="row justify-content-center">

                <div class="col-xl-10 col-lg-12 col-md-9">

                    <div class="card o-hidden border-0 shadow-lg my-5">
                        <div class="card-body p-0">
                            <!-- Nested Row within Card Body -->
                            <div class="row">
                                <div class="col-lg-6 d-none d-lg-block bg-login-image"></div>
                                <div class="col-lg-6">
                                    <div class="p-5">
                                        <div class="text-center">
                                            <h1 class="h4 text-gray-900 mb-4">Welcome Back!</h1>
                                        </div>
                                        <form class="user">
                                            <div class="form-group">
                                                <input type="text" class="form-control form-control-user"
                                                       id="exampleInputEmail" name="dni" aria-describedby="DniHelp"
                                                       placeholder="Enter DNI...">
                                            </div>
                                            <div class="form-group">
                                                <input type="password" class="form-control form-control-user"
                                                       id="exampleInputPassword" name="password" placeholder="Password">
                                            </div>
                                            <div class="form-group">
                                            <select name="rol" id="cars" class="form-control-range">
                                                <option value="01">ADMIN</option>
                                                <option value="02">USER</option>  
                                            </select>
                                                </div>
                                            <div class="form-group">
                                                <div class="custom-control custom-checkbox small">
                                                    <input type="checkbox" class="custom-control-input" id="customCheck">
                                                    <label class="custom-control-label" for="customCheck">Remember
                                                        Me</label>
                                                </div>
                                            </div>

                                            <button type="submit" class="btn btn-primary btn-user btn-block" name="login">Login</button> 
                                            <hr>

                                        </form>
                                        <hr>
                                        <div class="text-center">
                                            <a class="small" href="forgot-password.html">Forgot Password?</a>
                                        </div>
                                        <div class="text-center">
                                            <a class="small" href="register.html">Create an Account!</a>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>

                </div>

            </div>
            <%
                Connection con = null;
                Statement st = null;
                ResultSet rs = null;
                if (request.getParameter("login") != null) {
                    String dni = request.getParameter("dni");
                    String password = request.getParameter("password");
                    HttpSession sesion = request.getSession();
                    String rol = request.getParameter("rol");

                    try {
                        Class.forName("com.mysql.jdbc.Driver");
                        con = DriverManager.getConnection("jdbc:mysql://localhost/gestion?user=root&password=");
                        st = con.createStatement();
                        rs = st.executeQuery("SELECT * FROM `usuario` where co_usua='" + dni + "' and password='" + password + "'and co_role='" + rol + "'; ");
                        while (rs.next()) {
                            if (rol.equals("01")) {
                                sesion.setAttribute("logueado", "1");
                                sesion.setAttribute("dni", rs.getString("co_usua"));
                                response.sendRedirect("intra.jsp");
                            } else {
                                sesion.setAttribute("logueado", "1");
                                sesion.setAttribute("dni", rs.getString("co_usua"));
                                response.sendRedirect("vistapla.jsp");
                            }

                        }
                        out.print(" <div class=\"alert alert-danger\" role=\"alert\"> Usuario o contraseña no valido </div>");
                    } catch (Exception e) {
                    }

                }
            %>

        </div>

        <!-- Bootstrap core JavaScript-->
        <script src="vendor/jquery/jquery.min.js"></script>
        <script src="vendor/bootstrap/js/bootstrap.bundle.min.js"></script>

        <!-- Core plugin JavaScript-->
        <script src="vendor/jquery-easing/jquery.easing.min.js"></script>

        <!-- Custom scripts for all pages-->
        <script src="js/sb-admin-2.min.js"></script>

    </body>



</html>
