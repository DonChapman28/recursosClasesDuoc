
package Modelo;

/**
 *
 * @author erojas
 */
public class Medico extends Persona {
    private String especialidad;

    
    
    public Medico(String especialidad) {
        this.especialidad = especialidad;
    }
    
    public Medico(){
        this.especialidad = "";
    }
    
    public String getEspecialidad() {
        return especialidad;
    }

    public void setEspecialidad(String especialidad) {
        this.especialidad = especialidad;
    }

   
    
}
