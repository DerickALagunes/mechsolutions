/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package acciones;

import com.opensymphony.xwork2.ActionSupport;
import java.util.List;
import java.util.Map;
import modelos.PersonaBean;
import modelos.PersonaDao;
import modelos.TrabajoBean;
import modelos.TrabajoDao;
import org.apache.struts2.interceptor.SessionAware;

/**
 *
 * @author derick
 */
public class AdminAction extends ActionSupport implements SessionAware{
    
    private PersonaBean persona;   
    private TrabajoBean trabajo;
    private List<PersonaBean> lista;
    private final PersonaDao daoP = new PersonaDao();
    private final TrabajoDao daoT = new TrabajoDao();
    private Map session;

    @Override
    public String execute() {
        lista = getLista();
        return SUCCESS;
    }
    
    public String addJob(){
        trabajo = new TrabajoBean();
        
        trabajo.setFechaEntrega(fechaEntrega);
        trabajo.setDescripcion(descripcion);
        trabajo.setPieza(pieza);
        trabajo.setCliente(cliente);
        
        if (cliente > 0) {
            daoT.registrarTrabajo(trabajo);
        }
        
        fechaEntrega="";
        descripcion="";
        pieza="";
        cliente=0;
        
        
        lista = getLista();
        return SUCCESS;
    }
    
    public String addUser(){
        
        persona = new PersonaBean();
        
        System.out.println(mail);
        System.out.println(daoP.exists(mail));
        
        if (!mail.isEmpty() && !daoP.exists(mail)) {
            
            //registrar
            persona.setNombre(nombre);
            persona.setApellidos(apellidos);
            persona.setMail(mail);
            persona.setTelefono(telefono);
            persona.setIsCliente(true);
            persona.setDireccion(direccion);
            persona.setPassword(telefono);
            
            daoP.registrarPersona(persona);
        }
            
        nombre=""; apellidos=""; mail=""; telefono=""; direccion=""; 
        
        
        lista = getLista();
        return SUCCESS;
    }

    public PersonaBean getPersona() {
        return persona;
    }

    public void setPersona(PersonaBean persona) {
        this.persona = persona;
    }

   @Override
    public void setSession(Map<String, Object> map) {
        this.session = map;
    }

    public Map getSession() {
        return session;
    }

    public List<PersonaBean> getLista() {
        return daoP.getClientes();
    }

    public void setLista(List<PersonaBean> lista) {
        this.lista = lista;
    }
    
    private int id;
    private String fecha;
    private String fechaEntrega;
    private String descripcion;
    private String pieza;
    private boolean estado;
    private int cliente;
    private String nombre;
    private String apellidos;
    private String mail;
    private String telefono;
    private boolean isCliente;
    private String direccion;
    private String password;

    public TrabajoBean getTrabajo() {
        return trabajo;
    }

    public void setTrabajo(TrabajoBean trabajo) {
        this.trabajo = trabajo;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getFecha() {
        return fecha;
    }

    public void setFecha(String fecha) {
        this.fecha = fecha;
    }

    public String getFechaEntrega() {
        return fechaEntrega;
    }

    public void setFechaEntrega(String fechaEntrega) {
        this.fechaEntrega = fechaEntrega;
    }

    public String getDescripcion() {
        return descripcion;
    }

    public void setDescripcion(String descripcion) {
        this.descripcion = descripcion;
    }

    public String getPieza() {
        return pieza;
    }

    public void setPieza(String pieza) {
        this.pieza = pieza;
    }

    public boolean isEstado() {
        return estado;
    }

    public void setEstado(boolean estado) {
        this.estado = estado;
    }

    public int getCliente() {
        return cliente;
    }

    public void setCliente(int cliente) {
        this.cliente = cliente;
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

    public boolean isIsCliente() {
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
