package controlador;
import Ipla.InterPlanilla;
import modelo.*;
import util.MySQLConexion;
import java.sql.*;
import java.util.*;

public class Negocio implements InterPlanilla{
    public List<Empleado> LisTotal(){
    List<Empleado> lis=new ArrayList();
    Connection cn=MySQLConexion.getConexion();
    try{
     String sql="Select co_empl, concat(ap_pate,\" \",ap_mate,\" ,\",nombre) from empleado";   
     PreparedStatement st=cn.prepareStatement(sql);
     ResultSet rs=st.executeQuery();
     while(rs.next()){
       Empleado p=new Empleado();
       p.setCo_empl(rs.getString(1));
       p.setDe_empl(rs.getString(2));
       lis.add(p);
     }
    }catch(Exception ex){
      ex.printStackTrace();
    }
    return lis;   
   } 
    
    public List<Empleado> LisEmple(String id) {
        List<Empleado> lis = new ArrayList();
        Connection cn = MySQLConexion.getConexion();
        try {     
          String sql="{call ObtenerInformacionEmpleado(?)}";
          
          //llamando a procedure
            CallableStatement st = cn.prepareCall(sql);
            st.setString(1, id); //pasarelparametroid
            ResultSet rs = st.executeQuery();

            while (rs.next()) {
                Empleado p = new Empleado();
                p.setDe_area(rs.getString(1));
                p.setCo_empl(rs.getString(2));
                 p.setDe_empl(rs.getString(3));
                p.setNro_dni(rs.getString(4));
                 p.setDe_segu(rs.getString(5));
                p.setFe_ingreso(rs.getString(6));
                 p.setNro_cta(rs.getString(7));
                p.setDe_carg(rs.getString(8));
                 p.setDe_laboral(rs.getString(9));
              
                lis.add(p);
            }
            st.executeUpdate();
        } catch (Exception ex) {
            ex.printStackTrace();
        }
        return lis;
    }
     @Override
     public List<Planilla> LisPla(String codi,String mes,String an,String tipo) {
        List<Planilla> lis = new ArrayList();
        Connection cn = MySQLConexion.getConexion();
        try {     
          String sql="{call ObtenerInformacionPlanilla(?,?,?,?)}";
          //llamando a procedure
            CallableStatement st = cn.prepareCall(sql);
             st.setString(1, codi); //pasarelparametroid
            st.setString(2, mes);  // Plan month
            st.setString(3, an);  // Plan year
            st.setString(4, tipo);//pasarelparametroid
            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                Planilla p = new Planilla();
                p.setDe_cpto(rs.getString(1));
                p.setMonto(rs.getString(2));
                 p.setCo_tipo_plan(rs.getString(3));
                p.setFe_plan(rs.getString(4));
                 p.setFe_pago(rs.getString(5));
                p.setFe_migra(rs.getString(6));
              
                lis.add(p);
            }
            st.executeUpdate();
        } catch (Exception ex) {
            ex.printStackTrace();
        }
        return lis;
    }


  
}
