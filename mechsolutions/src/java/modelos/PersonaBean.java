/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package modelos;

/**
 *
 * @author derick
 */
public class PersonaBean {

    private int id;
    private String nombre;
    private String apellidos;
    private String mail;
    private String telefono;
    private boolean isCliente;
    private String direccion;
    private String password;

    public PersonaBean() {
    }

    public PersonaBean(int id, String nombre, String apellidos, String mail, String telefono, boolean isCliente, String direccion, String password) {
        this.id = id;
        this.nombre = nombre;
        this.apellidos = apellidos;
        this.mail = mail;
        this.telefono = telefono;
        this.isCliente = isCliente;
        this.direccion = direccion;
        this.password = password;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getNombre() {
        return nombre;
    }

    public void setNombre(String nombre) {
        this.nombre = nombre;
    }

    public String getApellidos() {
        return apellidos;
    }

    public void setApellidos(String apellidos) {
        this.apellidos = apellidos;
    }

    public String getMail() {
        return mail;
    }

    public void setMail(String mail) {
        this.mail = mail;
    }

    public String getTelefono() {
        return telefono;
    }

    public void setTelefono(String telefono) {
        this.telefono = telefono;
    }

    public boolean isCliente() {
        return isCliente;
    }

    public void setIsCliente(boolean isCliente) {
        this.isCliente = isCliente;
    }

    public String getDireccion() {
        return direccion;
    }

    public void setDireccion(String direccion) {
        this.direccion = direccion;
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }


}
