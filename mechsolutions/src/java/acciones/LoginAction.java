/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package acciones;

import com.opensymphony.xwork2.ActionSupport;
import java.util.Map;
import modelos.PersonaBean;
import modelos.PersonaDao;
import org.apache.struts2.interceptor.SessionAware;

/**
 *
 * @author derick
 */
public class LoginAction extends ActionSupport implements SessionAware {

    private String usuario;
    private String password;
    String mensaje;

    private Map session;

    private final PersonaDao dao = new PersonaDao();

    @Override
    public String execute() {
        if (dao.login(usuario, password)) {

            PersonaBean bean = dao.getUser(usuario, password);
            session.put("user", bean);

            return "success";
        }else{
            mensaje = "error";
        }
        
        return "error";
    }

    public String logout() {
        session.put("user", null);
        return "success";
    }

    @Override
    public void setSession(Map<String, Object> map) {
        this.session = map;
    }

    public String getUsuario() {
        return usuario;
    }

    public void setUsuario(String usuario) {
        this.usuario = usuario;
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }

    public Map getSession() {
        return session;
    }

    public String getMensaje() {
        return mensaje;
    }

    public void setMensaje(String mensaje) {
        this.mensaje = mensaje;
    }
    
}
