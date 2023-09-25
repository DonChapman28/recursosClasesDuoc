/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package Controlador;

import Conexion.Conexion;
import Modelo.Mascota;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import java.util.logging.Level;
import java.util.logging.Logger;

/**
 *
 * @author eroja
 */
public class Cmascota {
    
     private Conexion conexion = new Conexion();
     
     public boolean agregar(Mascota mascota)
     {
        
              try {
            Connection cnx = conexion.obtenerConexion();
            String sql = "INSERT INTO MASCOTA (codigoChip, nombre, rutCliente, fechaNacimiento  ,especie	,raza, descripcion) values(?,?,?,?,?,?,?)";
            PreparedStatement stmt = cnx.prepareStatement(sql);
            stmt.setString(1, mascota.getCodigoChip());
            stmt.setString(2, mascota.getNombre());
            stmt.setString(3, mascota.getRut());
            stmt.setString(4, mascota.getFechaNacimiento());
            stmt.setString(5, mascota.getEspecie());
            stmt.setString(6, mascota.getRaza());
            stmt.setString(7, mascota.getDescripcion());
            
            
            stmt.executeUpdate();
            stmt.close();
            cnx.close();            
            return true;
        } catch (SQLException ex) {
            Logger.getLogger(Mascota.class.getName()).log(Level.SEVERE, null, ex);
        }
        return false;
    }
    
}
