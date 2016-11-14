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
public class PubDao {
    
    public ArrayList<PubBean> Consult(){
        ArrayList<PubBean> lista = new ArrayList<>();
        try {
            Connection conexion = conexionMySQLServer.getConnection();
            String Query = "SELECT * FROM pub";
            PreparedStatement pstm = conexion.prepareStatement(Query);
            ResultSet res = pstm.executeQuery();
            
            while (res.next()) {
               
                PubBean bean = new PubBean();
                
                bean.setId(res.getInt(1));
                bean.setHeader(res.getString(2));
                bean.setTexto(res.getString(3));
                bean.setBoton(res.getString(4));
                bean.setLink(res.getString(5));
                bean.setImagen(res.getString(6));
                
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
