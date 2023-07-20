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
     String sql="Select co_empl, concat(ap_pate,\" \",ap_mate,\",\",nombre), nu_docu_iden,telefono from empleado";   
     PreparedStatement st=cn.prepareStatement(sql);
     ResultSet rs=st.executeQuery();
     while(rs.next()){
       Empleado p=new Empleado();
       p.setCo_empl(rs.getString(1));
       p.setDe_empl(rs.getString(2));
       p.setNro_dni(rs.getString(3));
       p.setTelefono(rs.getString(4));
       
       lis.add(p);
     }
    }catch(Exception ex){
      ex.printStackTrace();
    }
    return lis;   
   }
     public List<Seguro> LisSeguro(){
    List<Seguro> lis=new ArrayList();
    Connection cn=MySQLConexion.getConexion();
    try{
     String sql="SELECT co_segu, de_segu FROM `seguro`";   
     PreparedStatement st=cn.prepareStatement(sql);
     ResultSet rs=st.executeQuery();
     while(rs.next()){
       Seguro p=new Seguro();
       p.setCo_segu(rs.getString(1));
       p.setDe_segu(rs.getString(2));
       lis.add(p);
     }
    }catch(Exception ex){
      ex.printStackTrace();
    }
    return lis;   
   }
     public List<grutraba> LisGrup(){
    List<grutraba> lis=new ArrayList();
    Connection cn=MySQLConexion.getConexion();
    try{
     String sql="SELECT co_grup, de_grupo de_segu FROM `grupo_trabajo`";   
     PreparedStatement st=cn.prepareStatement(sql);
     ResultSet rs=st.executeQuery();
     while(rs.next()){
       grutraba p=new grutraba();
       p.setCo_grup(rs.getString(1));
       p.setDe_grupo(rs.getString(2));
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
     public void adicionemple(Empleado a){
      Connection cn=MySQLConexion.getConexion();
      String sql="{CALL InsertEmpleado(?,?,?,?,?,?,?,?,?,?,?,?,?,?)}";
      try{
       CallableStatement st=cn.prepareCall(sql);
       st.setString(1, a.getCo_grup() );
       st.setString(2, a.getAp_pate());
       st.setString(3, a.getAp_mate());
       st.setString(4, a.getNom());
       st.setString(5, a.getFe_naci() );
       st.setString(6, a.getFe_ingreso());
       st.setString(7, a.getIn_estd());
       st.setString(8, a.getTipo_dni());
       st.setString(9, a.getNro_dni() );
       st.setString(10, a.getDireccion());
       st.setString(11, a.getTelefono());
       st.setString(12, a.getIn_gene());
       st.setString(13, a.getNro_cta());
       st.setString(14, a.getDe_segu());
       st.executeUpdate();
      }catch(Exception ex){
          ex.printStackTrace();
      }
   }


  
}
