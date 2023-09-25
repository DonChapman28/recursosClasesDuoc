
package Modelo;

/**
 *
 * @author erojas
 */
public class Mascota {
    private String codigoChip;
    private String nombre;
    private String rut;
    private String fechaNacimiento; //fecha nacimiento
    private String especie;
    private String raza;
    private String descripcion; //descripcion mascota

    public Mascota() {
        this.codigoChip = "";
        this.nombre = "";
        this.rut = "";
        this.fechaNacimiento = "";
        this.especie = "";
        this.raza = "";
        this.descripcion = "";
    }

    public Mascota(String codigoChip, String nombre, String rut, String fechaNacimiento, String especie, String raza, String descripcion) {
        this.codigoChip = codigoChip;
        this.nombre = nombre;
        this.rut = rut;
        this.fechaNacimiento = fechaNacimiento;
        this.especie = especie;
        this.raza = raza;
        this.descripcion = descripcion;
    }

    public String getCodigoChip() {
        return codigoChip;
    }

    public void setCodigoChip(String codigoChip) {
        this.codigoChip = codigoChip;
    }

    public String getNombre() {
        return nombre;
    }

    public void setNombre(String nombre) {
        this.nombre = nombre;
    }

    public String getRut() {
        return rut;
    }

    public void setRut(String rut) {
        this.rut = rut;
    }

    public String getFechaNacimiento() {
        return fechaNacimiento;
    }

    public void setFechaNacimiento(String fechaNacimiento) {
        this.fechaNacimiento = fechaNacimiento;
    }

    public String getEspecie() {
        return especie;
    }

    public void setEspecie(String especie) {
        this.especie = especie;
    }

    public String getRaza() {
        return raza;
    }

    public void setRaza(String raza) {
        this.raza = raza;
    }

    public String getDescripcion() {
        return descripcion;
    }

    public void setDescripcion(String descripcion) {
        this.descripcion = descripcion;
    }

    

    
    
    
    
}
