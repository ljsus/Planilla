
package modelo;
import lombok.Data;

@Data

public class Planilla extends Empleado {
    private String co_empl;
    private String fe_mes;
     private String fe_an;
    private String co_tipo_plan;
    
     private String de_cpto;
    private String monto;
    
    private String fe_plan;
     private String fe_pago;
    private String fe_migra;

    public Planilla(String co_empl, String fe_mes, String fe_an, String co_tipo_plan) {
        this.co_empl = co_empl;
        this.fe_mes = fe_mes;
        this.fe_an = fe_an;
        this.co_tipo_plan = co_tipo_plan;
    }

    public Planilla() {
      
    }
    

    
}
