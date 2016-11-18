/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package acciones;

import com.opensymphony.xwork2.ActionSupport;
import java.util.Map;
import org.apache.struts2.interceptor.SessionAware;
import utils.ServerCheck;

/**
 *
 * @author derick
 */
public class Server extends ActionSupport implements SessionAware {

    private Map session;
    private final String plex = "<h5>Plex organiza video, música y fotos de librerías de medios personales y hace stream de estos a smart TVs, reproductores de medios y dispositivos móviles. Nuestro servidor contiene varias series disponibles y puedes enviarnos un correo para poner mas series o peliculas, tambien podemos configurar tu smartTV para que se conecte a nuestro servidor y puedas ver las series en tu televisión.</h5>";
    private final String minecraft = "<h5>Minecraft es un juego tipo sandbox, en esta ocasion podras conectarte a un mundo generado por nosotros para que juegues con tus amigos en linea.</h5>";
    private final String cod = "<h5>Call of Duty 4 es un juego de disparos en primera persona, bastante popular, conectate con tus amigos para pasar el rato!</h5>";
    private final String draw = "<h5>Draw.io es una herramienta muy util para hacer diagramas de cualquier tipo de una manera sencilla y sin descargar programas ya que se usa en el mismo navegador, la version de mech solutions se traducira a español pronto. Ver proyecto original:https://github.com/jgraph/draw.io</h5>";
    private final String lufi = "<h5>Lufi es una herramienta para subir archivos a nuestro servidor, tus archivos se encriptan con el navagedor asi que permanecen seguros durante la subida y descargas de los mismos, al subir un archivo genera una liga que podras usar para descargarlo de nuevo, los archivos solo duraran cierto tiempo en el servidor antes de ser borrados.\n\n lufi fue desarrollada por Luc Didry (<a href='https://github.com/ldidry/lufi'>Pagina del proyecto</a>)</h5>";
    private final String git = "<h5>Una herramienta que hace la instalación, configuración y gestión de un servidor Git propio (administrar; usuarios, repositorios,gestionar ramas,permisos, ver los commits, ver el código, mostrar estadísticas y muchas mas características.) mucho más amigable gracias a su interfaz web, muy al estilo de la interfaz de github.com.</h5>";

    private final String iPlex = 
            "<h5>1.Ve a <a href='http://mechsolutions.sytes.net:32400/'>plex</a> y crea una cuenta<br/><br/>2.Regresa a <a href='http://mechsolutions.sytes.net:32400/'>plex</a> luego de confirmar tu cuenta e inicia sesión<br/><br/>3.Envia un correo a mech_solutions@outlook.com con tu nombre de usuario plex y espera a que el administrador te de acceso a las series y peliculas.</h5><br/>";
    private final String iMinecraft = 
            "<h5>1.Abre tu launcher de minecraft<br/><br/>2.Selecciona jugar en la versión 1.7.4 del juego<br/><br/>3.Incia el juego y ve a multijugador<br/><br/>4.En add server ingresa: <b>mechsolutions.sytes.net:25565</b><br/><br/>5.Dale agregar y cuando aparesca en la lista de servidores selecciona y da doble click.</h5><br/>";
    private final String iCod = 
            "<h5>1.Abre el juego de Call of Duty 4 (Cod4) en modo en linea<br/><br/>  </h5>";
    private final String iDraw = 
            "<h5>1.Entra al siguiente link y comienza a usarlo <a href='https://www.draw.io/'>Draw.io</a>.</h5>";
    private final String iLufi = 
            "<h5>1.Entra al siguiente link <a href='https://demo.lufi.io'>Lufi</a><br/><br/>2.Sube tus archivos y selecciona el tiempo que quieres que permanescan en el servidor(despues de ese tiempo seran borrados)<br/><br/>3.se generará un link, usa ese link para descargar tu archivo, puedes compartir tu link con otras personas pero ten cuidado si tus archivos son personales.</h5>";
    private final String iGit = 
            "<h5>1.Entra al siguiente link <a href='https://gitlab.com/'>Gitlab</a><br/><br/>2.Tendras que hacer una cuenta y confirmar tu correo electronico<br/><br/>3.Una vez confirmada puedes utilizar las funciones de usuario de gitlab y crear repositorios para tus proyectos.</h5>";

    
    private String estado;
    private String desc;
    private String link;
    private String instruciones;
    private String serverName;
    private final ServerCheck check = new ServerCheck();

    @Override
    public String execute() {
        switch (serverName) {
            case "plex":
                setEstado(check.checkServers("32400"));
                setDesc(plex);
                setInstruciones(iPlex);
                setLink("http://mechsolutions.sytes.net:32400/");
                break;
            case "minecraft":
                setEstado(check.checkServers("25565"));
                setDesc(minecraft);
                setInstruciones(iMinecraft);
                setLink("#instruc");
                break;
            case "cod":
                setEstado(check.checkServers("9999"));
                setDesc(cod);
                setInstruciones(iCod);
                setLink("#instruc");
                break;
            case "draw":
                setEstado(check.checkServers("9999"));
                setDesc(draw);
                setInstruciones(iDraw);
                setLink("http://mechsolutions.sytes.net/");
                break;
            case "git":
                setEstado(check.checkServers("9999"));
                setDesc(git);
                setInstruciones(iGit);
                setLink("http://mechsolutions.sytes.net:9999/");
                break;
            case "lufi":
                setEstado(check.checkServers("9999"));
                setDesc(lufi);
                setInstruciones(iLufi);
                setLink("http://mechsolutions.sytes.net/");
                break;
        }
        return "success";
    }

    @Override
    public void setSession(Map<String, Object> map) {
        this.session = map;
    }

    public Map getSession() {
        return session;
    }

    public String getServerName() {
        return serverName;
    }

    public void setServerName(String serverName) {
        this.serverName = serverName;
    }

    public String getEstado() {
        return estado;
    }

    public void setEstado(String estado) {
        this.estado = estado;
    }

    public String getDesc() {
        return desc;
    }

    public void setDesc(String desc) {
        this.desc = desc;
    } 

    public String getLink() {
        return link;
    }

    public void setLink(String link) {
        this.link = link;
    }

    public String getInstruciones() {
        return instruciones;
    }

    public void setInstruciones(String instruciones) {
        this.instruciones = instruciones;
    }
    

}
