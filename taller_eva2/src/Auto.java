
import java.util.ArrayList;

public  class Auto extends Vehiculo{
    private int cantidadPuertas;
    private double capacidadMaletero;

    public int getCantidadPuertas() {
        return cantidadPuertas;
    }

    public void setCantidadPuertas(int cantidadPuertas) {
        this.cantidadPuertas = cantidadPuertas;
    }

    public double getCapacidadMaletero() {
        return capacidadMaletero;
    }

    public void setCapacidadMaletero(double capacidadMaletero) {
        this.capacidadMaletero = capacidadMaletero;
    }

    @Override
    public String toString() {
        return "Automovil " + "Cantidad Puertas=" + cantidadPuertas + ","
                + " Capacidad Maletero=" + capacidadMaletero ;
    }

        @Override
    public void calcularSubtotal() {
        int resultado = 0;
        resultado = (int) (0.19 * getCostoNetoServicio());
        setTotalPagar(resultado + getCostoNetoServicio());
    }



 

    
}
