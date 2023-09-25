import java.util.Date;

        
public class eventos {

    private String  nombre_entrada;
    private int     numero_entrada;
    private int              monto;
    private int               edad;
    private date      fecha_evento;

    public eventos(String nombre_entrada, int numero_entrada, int monto, int edad, date fecha_evento) {
        this.nombre_entrada = nombre_entrada;
        this.numero_entrada = numero_entrada;
        this.monto = monto;
        this.edad = edad;
        this.fecha_evento = fecha_evento;
    }
    
    

    public String getNombre_entrada() {
        return nombre_entrada;
    }

    public int getNumero_entrada() {
        return numero_entrada;
    }

    public int getMonto() {
        return monto;
    }

    public int getEdad() {
        return edad;
    }

    public date getFecha_evento() {
        return fecha_evento;
    }

    public void setNombre_entrada(String nombre_entrada) {
        this.nombre_entrada = nombre_entrada;
    }

    public void setNumero_entrada(int numero_entrada) {
        this.numero_entrada = numero_entrada;
    }

    public void setMonto(int monto) {
        this.monto = monto;
    }

    public void setEdad(int edad) {
        this.edad = edad;
    }

    public void setFecha_evento(date fecha_evento) {
        this.fecha_evento = fecha_evento;
    }

    private static class date {

        public date() {
        }
    }
        
        
      
    
              
              
              
    
    

        
    
    
}
