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
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;

import utils.conexionMySQLServer;

/**
 *
 * @author derick
 */
public class PersonaDao {

    public boolean registrarPersona(PersonaBean persona) {
        boolean flag = false;
        try {
            Connection conexion = conexionMySQLServer.getConnection();
            String Query = "INSERT INTO persona(nombre,apellidos,mail,telefono,isCliente,direccion,password) VALUES(?,?,?,?,?,?,?)";
            PreparedStatement pstm = conexion.prepareStatement(Query);
            pstm.setString(1, persona.getNombre());
            pstm.setString(2, persona.getApellidos());
            pstm.setString(3, persona.getMail());
            pstm.setString(4, persona.getTelefono());
            pstm.setBoolean(5, persona.isCliente());
            pstm.setString(6, persona.getDireccion());
            pstm.setString(7, persona.getPassword());

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

    public boolean login(String mail, String passUser) {
        boolean flag = false;
        try {
            Connection conexion = conexionMySQLServer.getConnection();
            String Query = "SELECT * FROM persona WHERE mail=? AND password=?";
            PreparedStatement pstm = conexion.prepareStatement(Query);
            pstm.setString(1, mail);
            pstm.setString(2, passUser);
            ResultSet res = pstm.executeQuery();

            if (res.next()) {
                flag = true;
            }

            res.close();
            pstm.close();
            conexion.close();

        } catch (SQLException ex) {
            Logger.getLogger(PersonaDao.class.getName()).log(Level.SEVERE, null,
                    ex);
        }
        return flag;
    }

    public PersonaBean getUser(String mail, String passUser) {
        PersonaBean persona = new PersonaBean();
        try {
            Connection conexion = conexionMySQLServer.getConnection();
            String Query = "SELECT * FROM persona WHERE mail=? AND password=?";
            PreparedStatement pstm = conexion.prepareStatement(Query);
            pstm.setString(1, mail);
            pstm.setString(2, passUser);
            ResultSet res = pstm.executeQuery();

            if (res.next()) {
                persona = new PersonaBean(
                        res.getInt(1),
                        res.getString(2),
                        res.getString(3),
                        mail,
                        res.getString(4),
                        res.getBoolean(5),
                        res.getString(6),
                        res.getString(7)
                );
            }

            res.close();
            pstm.close();
            conexion.close();

        } catch (SQLException ex) {
            Logger.getLogger(PersonaDao.class.getName()).log(Level.SEVERE, null,
                    ex);
        }
        return persona;
    }

    public List<PersonaBean> getClientes() {
        List<PersonaBean> personas = new ArrayList();
        try {
            Connection conexion = conexionMySQLServer.getConnection();
            String Query = "SELECT * FROM persona WHERE isCliente=true";
            PreparedStatement pstm = conexion.prepareStatement(Query);
            ResultSet res = pstm.executeQuery();

            while (res.next()) {
                personas.add(new PersonaBean(
                        res.getInt(1),
                        res.getString(2),
                        res.getString(3),
                        res.getString(4),
                        res.getString(5),
                        res.getBoolean(6),
                        res.getString(7),
                        res.getString(8)
                ));
            }

            res.close();
            pstm.close();
            conexion.close();

        } catch (SQLException ex) {
            Logger.getLogger(PersonaDao.class.getName()).log(Level.SEVERE, null,
                    ex);
        }
        return personas;
    }
    
    public boolean exists(String mail){
        boolean flag=false;
        
        try {
            Connection conexion = conexionMySQLServer.getConnection();
            String Query = "SELECT * FROM persona WHERE mail=?";
            PreparedStatement pstm = conexion.prepareStatement(Query);
            pstm.setString(1, mail);
            ResultSet res = pstm.executeQuery();

            if (res.next()) {
                flag=true;
            }

            res.close();
            pstm.close();
            conexion.close();

        } catch (SQLException ex) {
            Logger.getLogger(PersonaDao.class.getName()).log(Level.SEVERE, null,
                    ex);
        }       
        return flag;
    }

     public boolean modificarPersona(PersonaBean persona) {
        boolean flag = false;
        try {
            Connection conexion = conexionMySQLServer.getConnection();
            String Query = "UPDATE persona SET"
                             + " nombre = ? ,apellidos = ?, mail =  ?,"
                             + " telefono = ?,direccion = ?"
                    + "WHERE id = ?";
            PreparedStatement pstm = conexion.prepareStatement(Query);
            pstm.setString(1, persona.getNombre());
            pstm.setString(2, persona.getApellidos());
            pstm.setString(3, persona.getMail());
            pstm.setString(4, persona.getTelefono());
            pstm.setString(5, persona.getDireccion());
            pstm.setInt(6, persona.getId());
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
     
     public boolean eliminarPersona(PersonaBean persona) {
        boolean flag = false;
        try {
            Connection conexion = conexionMySQLServer.getConnection();
            String Query = "DELETE FROM persona WHERE id = ? AND id <> 1;";
            PreparedStatement pstm = conexion.prepareStatement(Query);            
            pstm.setInt(1, persona.getId());
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
    
    
}
