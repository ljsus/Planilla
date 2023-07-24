package controlador;

import Ipla.InterPlanilla;
import java.sql.CallableStatement;
import modelo.*;
import util.MySQLConexion;
import java.sql.*;
import java.util.*;

public class Negocio implements InterPlanilla {

    public List<Planilla> listIngresos(Integer co_empl, String mes, String anio, Integer co_tipo_plan) {
        List<Planilla> list = new ArrayList();
        Connection cn = MySQLConexion.getConexion();
        try {
            String sql = "select (select de_cpto from concepto_planilla where co_cpto = pe.co_cpto) de_cpto,\n"
                    + "pe.monto,\n"
                    + "pe.co_tipo_plan\n"
                    + "from planilla_empleado pe\n"
                    + "where pe.co_empl = " + co_empl + "\n"
                    + "and month(pe.fe_plan)=" + mes + "\n"
                    + "and year(pe.fe_plan)=" + anio + "\n"
                    + "and pe.co_tipo_plan =" + co_tipo_plan + "";

            PreparedStatement st = cn.prepareStatement(sql);
            ResultSet rs = st.executeQuery();

            while (rs.next()) {
                Planilla plan = new Planilla();
                plan.setDe_cpto(rs.getString(1));
                plan.setMonto(rs.getString(2));
                list.add(plan);
            }

        } catch (Exception e) {
        }

        return list;

    }

    public List<Empleado> LisTotal() {
        List<Empleado> lis = new ArrayList();
        Connection cn = MySQLConexion.getConexion();
        try {
            String sql = "Select co_empl, concat(ap_pate,\" \",ap_mate,\",\",nombre), nu_docu_iden,telefono from empleado";
            PreparedStatement st = cn.prepareStatement(sql);
            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                Empleado p = new Empleado();
                p.setCo_empl(rs.getString(1));
                p.setDe_empl(rs.getString(2));
                p.setNro_dni(rs.getString(3));
                p.setTelefono(rs.getString(4));

                lis.add(p);
            }
        } catch (Exception ex) {
            ex.printStackTrace();
        }
        return lis;
    }

    public List<Seguro> LisSeguro() {
        List<Seguro> lis = new ArrayList();
        Connection cn = MySQLConexion.getConexion();
        try {
            String sql = "SELECT co_segu, de_segu FROM `seguro`";
            PreparedStatement st = cn.prepareStatement(sql);
            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                Seguro p = new Seguro();
                p.setCo_segu(rs.getString(1));
                p.setDe_segu(rs.getString(2));
                lis.add(p);
            }
        } catch (Exception ex) {
            ex.printStackTrace();
        }
        return lis;
    }

    public List<grutraba> LisGrup() {
        List<grutraba> lis = new ArrayList();
        Connection cn = MySQLConexion.getConexion();
        try {
            String sql = "SELECT co_grup, de_grupo de_segu FROM `grupo_trabajo`";
            PreparedStatement st = cn.prepareStatement(sql);
            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                grutraba p = new grutraba();
                p.setCo_grup(rs.getString(1));
                p.setDe_grupo(rs.getString(2));
                lis.add(p);
            }
        } catch (Exception ex) {
            ex.printStackTrace();
        }
        return lis;
    }

    public List<Empleado> LisEmple(String id) {
        List<Empleado> lis = new ArrayList();
        Connection cn = MySQLConexion.getConexion();
        try {
            String sql = "{call ObtenerInformacionEmpleado(?)}";

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
    public List<Planilla> LisPla(String codi, String mes, String an, String tipo) {
        List<Planilla> lis = new ArrayList();
        Connection cn = MySQLConexion.getConexion();
        try {
            String sql = "{call ObtenerInformacionPlanilla(?,?,?,?)}";
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

    @Override
    public List<Planilla1> LisPla1(String codi, String mes, String an, String tipo) {
        List<Planilla1> lis = new ArrayList();
        Connection cn = MySQLConexion.getConexion();

        try {
            String sql = "{call ObtenerInformacionPlanilla(?,?,?,?)}";
            //llamando a procedure
            CallableStatement st = cn.prepareCall(sql);
            st.setString(1, codi); //pasarelparametroid
            st.setString(2, mes);  // Plan month
            st.setString(3, an);  // Plan year
            st.setString(4, tipo);//pasarelparametroid
            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                Planilla1 p = new Planilla1();
                p.setDe_cpto(rs.getString(1));
                p.setMonto(rs.getDouble(2));
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

    @Override
    public List<Planilla2> LisPla2(String codi, String mes, String an, String tipo) {
        List<Planilla2> lis = new ArrayList();
        Connection cn = MySQLConexion.getConexion();
        try {
            String sql = "{call ObtenerInformacionPlanilla(?,?,?,?)}";
            //llamando a procedure
            CallableStatement st = cn.prepareCall(sql);
            st.setString(1, codi); //pasarelparametroid
            st.setString(2, mes);  // Plan month
            st.setString(3, an);  // Plan year
            st.setString(4, tipo);//pasarelparametroid
            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                Planilla2 p = new Planilla2();
                p.setDe_cpto(rs.getString(1));
                p.setMonto(rs.getDouble(2));
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

    @Override
    public List<Planilla3> LisPla3(String codi, String mes, String an, String tipo) {
        List<Planilla3> lis = new ArrayList();
        Connection cn = MySQLConexion.getConexion();
        try {
            String sql = "{call ObtenerInformacionPlanilla(?,?,?,?)}";
            //llamando a procedure
            CallableStatement st = cn.prepareCall(sql);
            st.setString(1, codi); //pasarelparametroid
            st.setString(2, mes);  // Plan month
            st.setString(3, an);  // Plan year
            st.setString(4, tipo);//pasarelparametroid
            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                Planilla3 p = new Planilla3();
                p.setDe_cpto(rs.getString(1));
                p.setMonto(rs.getDouble(2));
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

    public void adicionemple(Empleado a) {
        Connection cn = MySQLConexion.getConexion();
        String sql = "{CALL InsertEmpleado(?,?,?,?,?,?,?,?,?,?,?,?,?,?)}";
        try {
            CallableStatement st = cn.prepareCall(sql);
            st.setString(1, a.getCo_grup());
            st.setString(2, a.getAp_pate());
            st.setString(3, a.getAp_mate());
            st.setString(4, a.getNom());
            st.setString(5, a.getFe_naci());
            st.setString(6, a.getFe_ingreso());
            st.setString(7, a.getIn_estd());
            st.setString(8, a.getTipo_dni());
            st.setString(9, a.getNro_dni());
            st.setString(10, a.getDireccion());
            st.setString(11, a.getTelefono());
            st.setString(12, a.getIn_gene());
            st.setString(13, a.getNro_cta());
            st.setString(14, a.getDe_segu());
            st.executeUpdate();
        } catch (Exception ex) {
            ex.printStackTrace();
        }
    }
    //modificar

    public void editar(Empleado p) {
        Connection cn = MySQLConexion.getConexion();
        try {
            //String sql = "UPDATE empleado SET co_grup = ?, ap_pate = ?, ap_mate = ?, nombre = ?, fe_naci = ?, in_estd = ?, ti_docu_iden = ?, nu_docu_iden = ?, direccion = ?, telefono = ?, in_gene = ?, cta_bco = ?, co_segu = ? WHERE co_empl = ?";
            String sql = "{CALL update_employee(?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)}";
            //prepara una instruccion sql que sera ejecutada mediante la conexion
            //PreparedStatement st = cn.prepareStatement(sql);
            CallableStatement st = cn.prepareCall(sql);
            st.setString(1, p.getCo_empl());
            st.setString(2, p.getCo_grup());
            st.setString(3, p.getAp_pate());
            st.setString(4, p.getAp_mate());
            st.setString(5, p.getNom());
            st.setString(6, p.getFe_naci());
            st.setString(7, p.getIn_estd());
            st.setString(8, p.getTipo_dni());
            st.setString(9, p.getNro_dni());
            st.setString(10, p.getDireccion());
            st.setString(11, p.getTelefono());
            st.setString(12, p.getIn_gene());
            st.setString(13, p.getNro_cta());
            st.setString(14, p.getDe_segu());
            st.executeUpdate();
        } catch (Exception ex) {
            ex.printStackTrace();
        }
    }

    public Empleado consulta(int nro) {
        Empleado p = null;
        Connection cn = MySQLConexion.getConexion();
        try {
            String slq = "select co_empl,Co_grup,Ap_pate, Ap_mate,nombre ,Fe_naci,In_estd, ti_docu_iden,nu_docu_iden, Direccion,Telefono, In_gene,cta_bco, co_segu from empleado  where co_empl=?";
            PreparedStatement st = cn.prepareStatement(slq);
            st.setInt(1, nro);
            ResultSet rs = st.executeQuery();
            if (rs.next()) {//leer cada fila de la tabla
                p = new Empleado();
                p.setCo_empl(rs.getString(1));
                p.setCo_grup(rs.getString(2));
                p.setAp_pate(rs.getString(3));
                p.setAp_mate(rs.getString(4));
                p.setNom(rs.getString(5));
                p.setFe_naci(rs.getString(6));
                p.setIn_estd(rs.getString(7));
                p.setTipo_dni(rs.getString(8));
                p.setNro_dni(rs.getString(9));
                p.setDireccion(rs.getString(10));
                p.setTelefono(rs.getString(11));
                p.setIn_gene(rs.getString(12));
                p.setNro_cta(rs.getString(13));
                p.setDe_segu(rs.getString(14));

            }
        } catch (Exception ex) {
            ex.printStackTrace();
        }
        return p;

    }

}
