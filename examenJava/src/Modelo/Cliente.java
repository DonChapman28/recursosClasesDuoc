
package Modelo;

/**
 *
 * @author erojas
 */
public class Cliente extends Persona {
    private String comuna;
    private int telefono;
    private String tipoCliente;

    public Cliente(String comuna, int telefono, String tipoCliente) {
        this.comuna = comuna;
        this.telefono = telefono;
        this.tipoCliente = tipoCliente;
    }

    public Cliente() {

        this.comuna = "";
        this.telefono = 0;
        this.tipoCliente = "";
    }  
    
    public String getComuna() {
        return comuna;
    }

    public void setComuna(String comuna) {
        this.comuna = comuna;
    }

    public int getTelefono() {
        return telefono;
    }

    public void setTelefono(int telefono) {
        this.telefono = telefono;
    }

    public String getTipoCliente() {
        return tipoCliente;
    }

    public void setTipoCliente(String tipoCliente) {
        this.tipoCliente = tipoCliente;
    }



    
    
    
    
}
