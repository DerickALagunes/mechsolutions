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
public class FAQDao {
    
    public ArrayList<FAQBean> Consult(){
        ArrayList<FAQBean> lista = new ArrayList<>();
        try {
            Connection conexion = conexionMySQLServer.getConnection();
            String Query = "SELECT * FROM faq";
            PreparedStatement pstm = conexion.prepareStatement(Query);
            ResultSet res = pstm.executeQuery();
            
            while (res.next()) {
               
                FAQBean bean = new FAQBean();
                
                bean.setId(res.getInt(1));
                bean.setTema(res.getString(2));
                bean.setRespuesta(res.getString(3));
                
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
