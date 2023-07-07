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
        <title>JSP Page</title>
    </head>
    <body>

        <br>

        <div class="container">
            <h1 style="text-align: center">Acceso al sistema</h1>
            <form style="max-width: 400px; margin: 0 auto;" method="post" action="login.jsp" >
                <div class="form-floating mb-3 mt-3">
                    <input type="text" class="form-control" placeholder="Dni" name="dni">
                    <label for="dni">Dni</label>
                </div>
                <div class="form-floating mt-3 mb-3">
                    <input type="password" class="form-control" placeholder="Colocar contraseña" name="password">
                    <label for="password">Contraseña</label>
                </div>
                <p style="text-align: center">
                    <button type="submit" class="btn btn-success" name="login">Ingresar</button> 
                    <a class="nav-link active" href="registro.jsp">Registrarse</a> 

                </p>  
            </form> 
            <%
                Connection con = null;
                Statement st = null;
                ResultSet rs = null;
                if (request.getParameter("login") != null) {
                    String dni = request.getParameter("dni");
                    String password = request.getParameter("password");
                    HttpSession sesion = request.getSession();
                    
                    try {
                        Class.forName("com.mysql.jdbc.Driver");
                        con = DriverManager.getConnection("jdbc:mysql://localhost/gestion?user=root&password=");
                        st = con.createStatement();
                        rs = st.executeQuery(" SELECT * FROM `usuario` where co_usua='" + dni + "' and password='" + password + "'; ");
                        while (rs.next()) {
                                if (dni.equals("admin"))  {             
                            sesion.setAttribute("logueado", "1");
                            sesion.setAttribute("dni", rs.getString("co_usua"));
                            response.sendRedirect("intra.jsp");}
                                else{sesion.setAttribute("logueado", "1");
                            sesion.setAttribute("dni", rs.getString("co_usua"));
                            response.sendRedirect("vistapla.jsp");}
                            
                            

                        }
                        out.print(" <div class=\"alert alert-danger\" role=\"alert\"> Usuario no valido </div>");
                    } catch (Exception e) {
                    }
                    
                    
                }
            %>
        </div>
        <br>  

    </body>



</html>
