
package miServlet;


import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import modelo.*;
import controlador.Negocio;
import javax.servlet.http.HttpSession;

public class control extends HttpServlet {
 Negocio  obj=new Negocio();

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
     int op=Integer.parseInt(request.getParameter("opc"));
     if(op==1)lisemple(request, response);
     if(op==3)lispla(request, response);
    
    }
    protected void lisemple(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
         String cod=request.getParameter("cod");
           String nom=request.getParameter("nom");
       request.setAttribute("dato", obj.LisEmple(cod));
       request.setAttribute("dato2", nom);
        request.getRequestDispatcher("/vistapla.jsp").forward(request, response); 
    }
    protected void lisplani1(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
         String cod=request.getParameter("cod");
           String nom=request.getParameter("nom");
       request.setAttribute("dato", obj.LisEmple(cod));
       request.setAttribute("dato2", nom);
        request.getRequestDispatcher("/filtro.jsp").forward(request, response);
 
        
    }
    protected void lispla(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        HttpSession ses=request.getSession();
        String codi=request.getParameter("codi").trim();
        String mes=request.getParameter("mes").trim();
        String an=request.getParameter("an").trim();
        String tipo=request.getParameter("tipo").trim();
        
         //cli =obj.LisPla(codi,mes,an,tipo);
       
         ses.setAttribute("cli", obj.LisPla(codi,mes,an,tipo));
           // request.setAttribute("cli", cli);
            
        request.getRequestDispatcher("/filtro.jsp").forward(request, response);
      
     }

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /**
     * Handles the HTTP <code>GET</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Handles the HTTP <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
