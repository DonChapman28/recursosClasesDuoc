
package Modelo;

/**
 *
 * @author erojas
 */
public class Atenciones {
    private String fecha;
    private String rut;
    private String codigoChip;
    private String procesoRealizado;    
    private String observaciones; 
    private int valor;

    public Atenciones() {
        this.fecha = "";
        this.rut = "";
        this.codigoChip = "";
        this.procesoRealizado = "";
        this.observaciones = "";
        this.valor = 0;
    }

    public Atenciones(String fecha, String rut, String codigoChip, String procesoRealizado, String observaciones, int valor) {
        this.fecha = fecha;
        this.rut = rut;
        this.codigoChip = codigoChip;
        this.procesoRealizado = procesoRealizado;
        this.observaciones = observaciones;
        this.valor = valor;
    }

    public String getFecha() {
        return fecha;
    }

    public void setFecha(String fecha) {
        this.fecha = fecha;
    }

    public String getRut() {
        return rut;
    }

    public void setRut(String rut) {
        this.rut = rut;
    }


    public String getCodigoChip() {
        return codigoChip;
    }

    public void setCodigoChip(String codigoChip) {
        this.codigoChip = codigoChip;
    }

    public String getProcesoRealizado() {
        return procesoRealizado;
    }

    public void setProcesoRealizado(String procesoRealizado) {
        this.procesoRealizado = procesoRealizado;
    }

    public String getObservaciones() {
        return observaciones;
    }

    public void setObservaciones(String observaciones_proce) {
        this.observaciones = observaciones_proce;
    }

    public int getValor() {
        return valor;
    }

    public void setValor(int valor) {
        this.valor = valor;
    }

    
    
    
}
