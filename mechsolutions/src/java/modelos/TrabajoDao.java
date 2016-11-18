/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package modelos;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.logging.Level;
import java.util.logging.Logger;
import utils.conexionMySQLServer;

/**
 *
 * @author derick
 */
public class TrabajoDao {
    
    //insertar trabajo
    public boolean registrarTrabajo(TrabajoBean trabajo){
        boolean flag = false;
        try {
            Connection conexion = conexionMySQLServer.getConnection();
            String Query = "INSERT INTO trabajo(fecha,fechaEntrega,descripcion,pieza,estado,cliente) VALUES(CURDATE(),?,?,?,?,?)";
            PreparedStatement pstm = conexion.prepareStatement(Query);
            pstm.setString(1, trabajo.getFechaEntrega());
            pstm.setString(2, trabajo.getDescripcion());
            pstm.setString(3, trabajo.getPieza());
            pstm.setBoolean(4, true);
            pstm.setInt(5, trabajo.getCliente());
                        
            if (pstm.executeUpdate() == 1) {
                    flag = true;
            }
            
            pstm.close();
            conexion.close();
            
        } catch (SQLException ex) {
            Logger.getLogger(PersonaDao.class.getName()).log(Level.SEVERE, null,
                    ex);
        }
        
        return flag;
    }
    
    
    //modificar trabajo
    public boolean actualizarTrabajo(TrabajoBean trabajo) {
        boolean status = false;

        try {
            Connection conexion = conexionMySQLServer.getConnection();
            String Query = "Update trabajo "
                    + "set fecha=CURDATE(), fechaEntrega=?, descripcion=?,"
                    + "pieza=?, cliente = ? WHERE id=?";
            PreparedStatement pstm = conexion.prepareStatement(Query);

            
            pstm.setString(1, trabajo.getFechaEntrega());
            pstm.setString(2, trabajo.getDescripcion());
            pstm.setString(3, trabajo.getPieza());
            pstm.setInt(4, trabajo.getCliente());
            pstm.setInt(5, trabajo.getId());
            

            if (pstm.executeUpdate() == 1) {
                status = true;
            }

            pstm.close();
            conexion.close();

        } catch (SQLException e) {
            e.printStackTrace();
        }
        return status;
    }
    
    
    //ver trabajos
    public ArrayList<TrabajoBean> Consult(PersonaBean persona){
        ArrayList<TrabajoBean> lista = new ArrayList<>();
        try {
            Connection conexion = conexionMySQLServer.getConnection();
            String Query = "SELECT trabajo.id,fecha,fechaEntrega,descripcion,"
                    + "pieza,estado,persona.id "
                    + "FROM trabajo join persona on "
                    + "trabajo.cliente=persona.id WHERE persona.id=?";
            PreparedStatement pstm = conexion.prepareStatement(Query);
            pstm.setInt(1, persona.getId());
            ResultSet res = pstm.executeQuery();
            
            while (res.next()) {
               
                TrabajoBean bean = new TrabajoBean();
                
                bean.setId(res.getInt(1));
                bean.setFecha(res.getString(2));
                bean.setFechaEntrega(res.getString(3));
                bean.setDescripcion(res.getString(4));
                bean.setPieza(res.getString(5));
                bean.setEstado(res.getBoolean(6));
                bean.setCliente(res.getInt(7));
                
                lista.add(bean);
            }
            
            res.close();
            pstm.close();
            conexion.close();
            
        } catch (SQLException ex) {
            Logger.getLogger(PersonaDao.class.getName()).log(Level.SEVERE, null,
                    ex);}        
        return lista;     
    }
    
    public ArrayList<TrabajoBean> ConsultTrabajos(){
        ArrayList<TrabajoBean> lista = new ArrayList<>();
        try {
            Connection conexion = conexionMySQLServer.getConnection();
            String Query = "SELECT trabajo.id,fecha,fechaEntrega,descripcion,"
                    + "pieza,estado,persona.id "
                    + "FROM trabajo join persona on "
                    + "trabajo.cliente=persona.id";
            PreparedStatement pstm = conexion.prepareStatement(Query);
            ResultSet res = pstm.executeQuery();
            
            while (res.next()) {
               
                TrabajoBean bean = new TrabajoBean();
                
                bean.setId(res.getInt(1));
                bean.setFecha(res.getString(2));
                bean.setFechaEntrega(res.getString(3));
                bean.setDescripcion(res.getString(4));
                bean.setPieza(res.getString(5));
                bean.setEstado(res.getBoolean(6));
                bean.setCliente(res.getInt(7));
                
                lista.add(bean);
            }
            
            res.close();
            pstm.close();
            conexion.close();
            
        } catch (SQLException ex) {
            Logger.getLogger(PersonaDao.class.getName()).log(Level.SEVERE, null,
                    ex);}        
        return lista;     
    }
       
      
}
