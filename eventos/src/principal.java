import java.util.Scanner;


public class principal {
    public static void main(String[] args) {
        Scanner leer = new Scanner(System.in);
        
        
                
        int opcion = 0;
        String nombre = "";
        int descuento = 0;
        int rut = 0;
        int dv = 0;

        
        while(opcion != 4)
        {
            System.out.println("*********** EVENTOS ***********");
            System.out.println("1.- crear evento");
            System.out.println("2.- mostrar informacion del evento");
            System.out.println("3.- descuento");
            System.out.println("4.- Salir");
            System.out.print("Ingrese una numero:");
            opcion = leer.nextInt();

            if(opcion < 1 || opcion > 4) 
            {
                System.out.println("La opción no es válida");
            }
            else 
            {
                if(opcion == 4)
                {
                    System.out.println("Hasta luego "+nombre+", Cerrando programa.");
                    break;
                }
                else if(opcion == 1)
                {                   
                    System.out.println("creando evento...");
                    System.out.print("Ingrese su nombre:");
                    nombre = leer.next();              
                    System.out.print("Ingrese su rut sin dv:");
                    rut = leer.nextInt();
                                       
                    

                }
                
                else if(opcion == 2)
                {
                    rut = rut + dv;
                    System.out.println("mostrar informacion");
                    System.out.println("nombre.- "+nombre);
                    System.out.println("rut.- "+rut);
                    
                    
                    

                }
                else
                {
                    System.out.println("sex");
                    
                   

                }
            }
        }        
       
    }
    
    
}


