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
public class AdminAction extends ActionSupport implements SessionAware {

    private PersonaBean persona;
    private TrabajoBean trabajo;
    private List<PersonaBean> lista;
    private List<TrabajoBean> listaTra;
    private final PersonaDao daoP = new PersonaDao();
    private final TrabajoDao daoT = new TrabajoDao();
    private Map session;

    @Override
    public String execute() {
        lista = getLista();
        listaTra = getListaTra();
        return SUCCESS;
    }

    public String addJob() {
        trabajo = new TrabajoBean();
        cliente = Integer.parseInt(clienteString);
        System.out.println("cleitte " + cliente);
        trabajo.setFechaEntrega(fechaEntrega);
        trabajo.setDescripcion(descripcion);
        trabajo.setPieza(pieza);
        trabajo.setCliente(cliente);

        if (cliente > 0) {
            daoT.registrarTrabajo(trabajo);
        }

        fechaEntrega = "";
        descripcion = "";
        pieza = "";
        clienteString = "";
        cliente = 0;

        lista = getLista();
        return SUCCESS;
    }

    public String addUser() {

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

        nombre = "";
        apellidos = "";
        mail = "";
        telefono = "";
        direccion = "";

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
    private String idString;
    private String fecha;
    private String fechaEntrega;
    private String descripcion;
    private String pieza;
    private boolean estado;
    private int cliente;
    private String clienteString;
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

    public String getIdString() {
        return idString;
    }

    public void setIdString(String idString) {
        this.idString = idString;
    }

    public String getClienteString() {
        return clienteString;
    }

    public void setClienteString(String clienteString) {
        this.clienteString = clienteString;
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

    public List<TrabajoBean> getListaTra() {
        return listaTra = daoT.ConsultTrabajos();
    }

    public void setListaTra(List<TrabajoBean> listaTra) {
        this.listaTra = listaTra;
    }

    public String modjob() {
        System.out.println("cliente " + Integer.parseInt(idString));
        id = Integer.parseInt(idString);
        cliente = Integer.parseInt(clienteString);
        trabajo = new TrabajoBean();
        trabajo.setId(id);
        trabajo.setFechaEntrega(fechaEntrega);
        trabajo.setDescripcion(descripcion);
        trabajo.setPieza(pieza);
        trabajo.setCliente(cliente);

        boolean booActualizacion = daoT.actualizarTrabajo(trabajo);
        idString = "";
        cliente = 0;
        id = 0;
        fechaEntrega = "";
        descripcion = "";
        pieza = "";

        if (booActualizacion) {
            return SUCCESS;
        } else {
            return ERROR;
        }

    }

    public String tertrab() {
        System.out.println("id: " + id);
        trabajo = new TrabajoBean();
        trabajo.setId(id);
        boolean booleanTerminarTrabajo = daoT.terminarTrabajo(trabajo, false);
        if (booleanTerminarTrabajo) {
            id = 0;
            return SUCCESS;
        } else {
            id = 0;
            return ERROR;
        }
    }

    public String modUser() {

        persona = new PersonaBean();

        System.out.println(mail);
        System.out.println(daoP.exists(mail));
        boolean mdoficacionE = false;
        if (!mail.isEmpty()) {

            //Modificar
            id = Integer.parseInt(idString);
            persona.setId(id);
            persona.setNombre(nombre);
            persona.setApellidos(apellidos);
            persona.setMail(mail);
            persona.setTelefono(telefono);
            persona.setIsCliente(true);
            persona.setDireccion(direccion);
            persona.setPassword(telefono);

            mdoficacionE = daoP.modificarPersona(persona);
        }

        nombre = "";
        apellidos = "";
        mail = "";
        telefono = "";
        direccion = "";

        listaTra = getListaTra();
        lista = getLista();
        if (mdoficacionE) {
            return SUCCESS;
        } else {
            return ERROR;
        }
    }

    public String delUsuario() {

        persona = new PersonaBean();
        persona.setId(id);

        boolean bandera = daoP.eliminarPersona(persona);
        id = 0;
        if (bandera) {
            return SUCCESS;
        } else {
            return ERROR;
        }

    }

}
