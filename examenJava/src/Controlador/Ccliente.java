/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package Controlador;

import Conexion.Conexion;
import Modelo.Cliente;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import java.util.logging.Level;
import java.util.logging.Logger;

/**
 *
 * @author eroja
 */
public class Ccliente {
    
     private Conexion conexion = new Conexion();
     
     public boolean agregar(Cliente cliente)
     {
        
              try {
            Connection cnx = conexion.obtenerConexion();
            String sql = "INSERT INTO CLIENTE (rut, dv, nombre, direccion, correo, comuna, telefono,tipoCliente) values(?,?,?,?,?,?,?,?)";
            PreparedStatement stmt = cnx.prepareStatement(sql);
            stmt.setInt(1, cliente.getRut());
            stmt.setString(2, cliente.getDv());
            stmt.setString(3, cliente.getNombre());
            stmt.setString(4, cliente.getDireccion());
            stmt.setString(5, cliente.getCorreo());
            stmt.setString(6, cliente.getComuna());
            stmt.setInt(7, cliente.getTelefono());
            stmt.setString(8, cliente.getTipoCliente());
            
            
            stmt.executeUpdate();
            stmt.close();
            cnx.close();            
            return true;
        } catch (SQLException ex) {
            Logger.getLogger(Cliente.class.getName()).log(Level.SEVERE, null, ex);
        }
        return false;
    }
     
    
         
     
     
     
    
}
