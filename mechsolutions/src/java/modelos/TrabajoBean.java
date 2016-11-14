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
public class TrabajoBean {

    private int id;
    private String fecha;
    private String fechaEntrega;
    private String descripcion;
    private String pieza;
    private boolean estado;
    private int cliente;

    public TrabajoBean() {
    }

    public TrabajoBean(int id, String fecha, String fechaEntrega, String descripcion, String pieza, boolean estado, int cliente) {
        this.id = id;
        this.fecha = fecha;
        this.fechaEntrega = fechaEntrega;
        this.descripcion = descripcion;
        this.pieza = pieza;
        this.estado = estado;
        this.cliente = cliente;
    }

    public int getCliente() {
        return cliente;
    }

    public void setCliente(int cliente) {
        this.cliente = cliente;
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
    
    
    
}
