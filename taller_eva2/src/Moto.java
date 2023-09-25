import java.util.ArrayList;

public class Moto extends Vehiculo{
    private String estiloMoto;
    private int largoManillar;

    public String getEstiloMoto() {
        return estiloMoto;
    }

    public void setEstiloMoto(String estiloMoto) {
        this.estiloMoto = estiloMoto;
    }

    public int getLargoManillar() {
        return largoManillar;
    }

    public void setLargoManillar(int largoManillar) {
        this.largoManillar = largoManillar;
    }

    @Override
    public String toString() {
        return "Moto{" + "estiloMoto=" + estiloMoto + ", largoManillar=" + largoManillar + '}';
    }

 @Override
    public void calcularSubtotal() {
        int resultado = 0;
        resultado = getIvapagar()* getCostoNetoServicio();
        setTotalPagar(resultado);
        
    }
}
