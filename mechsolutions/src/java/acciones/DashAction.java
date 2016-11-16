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
import modelos.TrabajoBean;
import modelos.TrabajoDao;
import org.apache.struts2.interceptor.SessionAware;

/**
 *
 * @author derick
 */
public class DashAction extends ActionSupport implements SessionAware {
    
    private List<TrabajoBean> trabajos;
    private PersonaBean persona;   
    
    private Map session;

    private final TrabajoDao dao = new TrabajoDao();

    @Override
    public String execute() {

        persona = (PersonaBean) session.get("user");
        trabajos = dao.Consult(persona);
        
        return "success";
    }

    @Override
    public void setSession(Map<String, Object> map) {
        this.session = map;
    }

    public Map getSession() {
        return session;
    }

    public List<TrabajoBean> getTrabajos() {
        return trabajos;
    }

    public void setTrabajos(List<TrabajoBean> trabajos) {
        this.trabajos = trabajos;
    }

    public PersonaBean getPersona() {
        return persona;
    }

    public void setPersona(PersonaBean persona) {
        this.persona = persona;
    }
    
    
    
}
