
package Ipla;

import modelo.*;
import java.util.*;
public interface InterPlanilla {
   
    List<Planilla> LisPla(String codi,String mes,String an,String tipo);
     List<Planilla1> LisPla1(String codi,String mes,String an,String tipo);
     List<Planilla2> LisPla2(String codi,String mes,String an,String tipo);
     List<Planilla3> LisPla3(String codi,String mes,String an,String tipo);
}
