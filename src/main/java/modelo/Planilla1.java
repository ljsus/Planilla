
package modelo;


public class Planilla1 extends Empleado {
    private String co_empl;
    private String fe_mes;
     private String fe_an;
    private String co_tipo_plan;
    
     private String de_cpto;
    private double monto;
    
    private String fe_plan;
     private String fe_pago;
    private String fe_migra;
    private double total;

    public Planilla1(String co_empl, String fe_mes, String fe_an, String co_tipo_plan) {
        this.co_empl = co_empl;
        this.fe_mes = fe_mes;
        this.fe_an = fe_an;
        this.co_tipo_plan = co_tipo_plan;
    }
    public double Total(){
        
        return total;
    }

    public Planilla1() {
      
    }

    public double getMonto() {
        return monto;
    }

    public void setMonto(double monto) {
        this.monto = monto;
    }

    public double getTotal() {
        return total;
    }

    public void setTotal(double total) {
        this.total = total;
    }
    

    public String getCo_empl() {
        return co_empl;
    }

    public void setCo_empl(String co_empl) {
        this.co_empl = co_empl;
    }

    public String getFe_mes() {
        return fe_mes;
    }

    public void setFe_mes(String fe_mes) {
        this.fe_mes = fe_mes;
    }

    public String getFe_an() {
        return fe_an;
    }

    public void setFe_an(String fe_an) {
        this.fe_an = fe_an;
    }
    

    public String getDe_cpto() {
        return de_cpto;
    }

    public void setDe_cpto(String de_cpto) {
        this.de_cpto = de_cpto;
    }

   

    public String getCo_tipo_plan() {
        return co_tipo_plan;
    }

    public void setCo_tipo_plan(String co_tipo_plan) {
        this.co_tipo_plan = co_tipo_plan;
    }

    public String getFe_plan() {
        return fe_plan;
    }

    public void setFe_plan(String fe_plan) {
        this.fe_plan = fe_plan;
    }

    public String getFe_pago() {
        return fe_pago;
    }

    public void setFe_pago(String fe_pago) {
        this.fe_pago = fe_pago;
    }

    public String getFe_migra() {
        return fe_migra;
    }

    public void setFe_migra(String fe_migra) {
        this.fe_migra = fe_migra;
    }
    
}
