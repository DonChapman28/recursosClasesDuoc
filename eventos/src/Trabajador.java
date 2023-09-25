
public class Trabajador {
    // 1.- atributos
    private String nombre;
    private int rut;
    private char dv;
    private int edad;
    private String antiguedad;
    
     // 2.- constructores
    public Trabajador(String nombre, int rut, char dv, int edad, String antiguedad) {
        this.nombre = nombre;
        this.rut = rut;
        this.dv = dv;
        this.edad = edad;
        this.antiguedad = antiguedad;
    }

    // 3.- getter and setter
    public String getNombre() {
        return nombre;
    }

    public void setNombre(String nombre) {
        this.nombre = nombre;
    }

    public int getRut() {
        return rut;
    }

    public void setRut(int rut) {
        this.rut = rut;
    }

    public char getDv() {
        return dv;
    }

    public void setDv(char dv) {
        this.dv = dv;
    }

    public int getEdad() {
        return edad;
    }

    public void setEdad(int edad) {
        this.edad = edad;
    }

    public String getAntiguedad() {
        return antiguedad;
    }

    public void setAntiguedad(String antiguedad) {
        this.antiguedad = antiguedad;
    }
      
    
}
