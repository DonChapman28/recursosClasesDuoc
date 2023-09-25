/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package Controlador;

import Conexion.Conexion;
import Modelo.Medico;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import java.util.logging.Level;
import java.util.logging.Logger;

/**
 *
 * @author eroja
 */
public class Cmedico {
    
    private Conexion conexion = new Conexion();
     
     public boolean agregar(Medico medico)
     {
        
              try {
            Connection cnx = conexion.obtenerConexion();
            String sql = "INSERT INTO MEDICO (rut, dv, nombre, direccion, correo,especialidad) values(?,?,?,?,?,?)";
            PreparedStatement stmt = cnx.prepareStatement(sql);
            stmt.setInt(1, medico.getRut());
            stmt.setString(2, medico.getDv());
            stmt.setString(3, medico.getNombre());
            stmt.setString(4, medico.getDireccion());
            stmt.setString(5, medico.getCorreo());
            stmt.setString(6, medico.getEspecialidad());
            
            
            stmt.executeUpdate();
            stmt.close();
            cnx.close();            
            return true;
        } catch (SQLException ex) {
            Logger.getLogger(Medico.class.getName()).log(Level.SEVERE, null, ex);
        }
        return false;
    }
    
}
