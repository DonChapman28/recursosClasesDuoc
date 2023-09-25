public class Principal {
    public static void main(String[] args) {
        // crear algunos autos
        Auto a1 = new Auto();
        a1.setColor("Negro");
        a1.setMarca("Chevrolet");
        a1.setCantidadPuertas(5);
        a1.setCapacidadMaletero(400);
        a1.setPatente("DD-TF-54");       
        a1.setCostoNetoServicio(200000);
        a1.setIvapagar(19);
        a1.calcularSubtotal();
        
       
        
        Auto a2 = new Auto();
        a2.setColor("Azul");
        a2.setMarca("Subaru");
        a2.setCantidadPuertas(5);
        a2.setCapacidadMaletero(240);
        a2.setPatente("ER-GT-95");
        a2.setCostoNetoServicio(600000);
        a2.setIvapagar(19);
        a2.calcularSubtotal();
        
        ////////////
        
        Moto m1 = new Moto();
        m1.setColor("Naranja");
        m1.setMarca("Honda");
        m1.setEstiloMoto("sport");
        m1.setLargoManillar(20);
        m1.setPatente("XD-563");
        m1.setCostoNetoServicio(400000);
        m1.setIvapagar(19);
        m1.calcularSubtotal();
        
        
        
        // realizar la lista de autos
        ListadoAutos compras = new ListadoAutos();
        compras.agregar(a1);
        compras.agregar(a2);
        compras.agregar(m1);
        
        // mostrar listado de autos y total de la compra
        compras.listar();
        
    }
}
