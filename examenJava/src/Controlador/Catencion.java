/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package Controlador;

import Conexion.Conexion;
import Modelo.Atenciones;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import java.util.logging.Level;
import java.util.logging.Logger;


/**
 *
 * @author eroja
 */
public class Catencion {
    
    private Conexion conexion = new Conexion();
     
     public boolean agregar(Atenciones atencion)
     {
        
              try {
            Connection cnx = conexion.obtenerConexion();
            String sql = "INSERT INTO ATENCION (fecha, rutMedico, codigoChip, procedimiento, observaciones, valor) values(?,?,?,?,?,?)";
            PreparedStatement stmt = cnx.prepareStatement(sql);
            stmt.setString(1, atencion.getFecha());
            stmt.setString(2, atencion.getRut());
            stmt.setString(3, atencion.getCodigoChip());
            stmt.setString(4, atencion.getProcesoRealizado());
            stmt.setString(5, atencion.getObservaciones());
            stmt.setInt(6, atencion.getValor());
            
            stmt.executeUpdate();
            stmt.close();
            cnx.close();            
            return true;
        } catch (SQLException ex) {
            Logger.getLogger(Atenciones.class.getName()).log(Level.SEVERE, null, ex);
        }
        return false;
    }
  
    
}
