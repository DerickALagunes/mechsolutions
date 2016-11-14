/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package interceptor;

import modelos.PersonaBean;
import com.opensymphony.xwork2.Action;
import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionInvocation;
import com.opensymphony.xwork2.interceptor.AbstractInterceptor;

import java.util.Map;

/**
 * @document PermisoAction
 * @author José Narváez
 * @versión 25/06/2014
 */
public class InterceptorAcceso extends AbstractInterceptor {

    @Override
    public void destroy() {
    }

    @Override
    public void init() {
    }

    @Override
    public String intercept(ActionInvocation actionInvocation) throws Exception {
        Map session = actionInvocation.getInvocationContext().getSession();
        PersonaBean usuario = (PersonaBean) session.get("user");
        String actionActual = (String) ActionContext.getContext().get(ActionContext.ACTION_NAME);

        if (usuario == null && !"login".equals(actionActual)) {
            return Action.LOGIN;
        } else {
            return actionInvocation.invoke();
        }
    }
}
