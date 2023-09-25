
import java.util.ArrayList;
public class ListadoAutos {
    private final ArrayList<Vehiculo> listado;


    public ListadoAutos() {
        listado = new ArrayList<>();
    }
    public boolean agregar(Vehiculo vehiculo)
    {
        return listado.add(vehiculo);
    }
    public void listar()
    {
        int totalCompra = 0;
        System.out.println("========= LISTADO DE LOS VEHICULOS =========");
        for (Vehiculo vehiculo : listado) {
            System.out.println(vehiculo.imprimir());
            totalCompra += vehiculo.getTotalPagar();
        }
        System.out.println("============================================");
        System.out.println("El total de compra es: " + totalCompra);
    }

}
