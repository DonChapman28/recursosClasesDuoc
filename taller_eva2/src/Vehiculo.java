
public abstract class Vehiculo  {
    private String patente;
    private String marca;
    private String color;
    private int costoNetoServicio;
    private int ivapagar;
    private int totalPagar;
           

    public String getPatente() {
        return patente;
    }

    public void setPatente(String patente) {
        this.patente = patente;
    }

    public String getMarca() {
        return marca;
    }

    public void setMarca(String marca) {
        this.marca = marca;
    }

    public String getColor() {
        return color;
    }

    public void setColor(String color) {
        this.color = color;
    }

    public int getCostoNetoServicio() {
        return costoNetoServicio;
    }

    public void setCostoNetoServicio(int costoNetoServicio) {
        this.costoNetoServicio = costoNetoServicio;
    }

    public int getIvapagar() {
        return (int) ivapagar;
    }

    public void setIvapagar(int ivapagar) {
        this.ivapagar = ivapagar;
    }

    public int getTotalPagar() {
        return totalPagar;
    }

    public void setTotalPagar(int totalPagar) {
        this.totalPagar = totalPagar;
    }

            
   public String imprimir() {
         return"Marca             : " + marca + "            \n" +
               "Patente           : " + patente + "          \n" +
               "Color             : " + color + "            \n" +
               "Costo del Servicio: " + costoNetoServicio + "\n" +
               "IVA               : " + ivapagar + "         \n" +
               "Total Pagar       : " + totalPagar + "       \n" +
               "--------------------------------------------" ;
    }

    public abstract void calcularSubtotal();


}
