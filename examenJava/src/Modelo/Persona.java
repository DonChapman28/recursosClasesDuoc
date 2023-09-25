
package Modelo;

/**
 *
 * @author erojas
 */
public abstract class Persona {
    private int rut;
    private String dv;
    private String nombre;
    private String correo;
    private String direccion;

    public Persona(int rut, String dv, String nombre, String correo, String direccion) {
        this.rut = rut;
        this.dv = dv;
        this.nombre = nombre;
        this.correo = correo;
        this.direccion = direccion;
    }

    public Persona() {
        this.rut = 0;
        this.dv = "";
        this.nombre = "";
        this.correo = "";
        this.direccion = "";    
    }

    public int getRut() {
        return rut;
    }

    public void setRut(int rut) {
        this.rut = rut;
    }

    public String getDv() {
        return dv;
    }

    public void setDv(String dv) {
        this.dv = dv;
    }

    public String getNombre() {
        return nombre;
    }

    public void setNombre(String nombre) {
        this.nombre = nombre;
    }


    public String getCorreo() {
        return correo;
    }

    public void setCorreo(String correo) {
        this.correo = correo;
    }

    public String getDireccion() {
        return direccion;
    }

    public void setDireccion(String direccion) {
        this.direccion = direccion;
    }

    
    
    

   
    
    
}
