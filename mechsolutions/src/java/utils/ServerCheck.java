/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package utils;

import java.io.IOException;
import java.net.InetSocketAddress;
import java.net.Socket;
import java.net.SocketAddress;
import java.net.SocketTimeoutException;

/**
 *
 * @author derick
 */
public class ServerCheck {

    public String checkServers(String port) {
        SocketAddress sockaddr
                = new InetSocketAddress("mechsolutions.sytes.net", Integer.parseInt(port));
        // Create your socket
        Socket socket = new Socket();
        boolean online = true;
        // Connect with 5 s timeout
        try {
            socket.connect(sockaddr, 3000);
        } catch (SocketTimeoutException stex) {
                // treating timeout errors separately from other io exceptions
            // may make sense
            online = false;
        } catch (IOException iOException) {
            online = false;
        } finally {
                // As the close() operation can also throw an IOException
            // it must caught here
            try {
                socket.close();
            } catch (IOException ex) {
                // feel free to do something moderately useful here, eg log the event
            }
        }
        return online + "";
    }

}
