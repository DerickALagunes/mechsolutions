/*
 * Copyright (C) 2016 derick
 *
 * This program is free software; you can redistribute it and/or
 * modify it under the terms of the GNU General Public License
 * as published by the Free Software Foundation; either version 2
 * of the License, or (at your option) any later version.
 *
 * This program is distributed in the hope that it will be useful,
 * but WITHOUT ANY WARRANTY; without even the implied warranty of
 * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
 * GNU General Public License for more details.
 *
 * You should have received a copy of the GNU General Public License
 * along with this program; if not, write to the Free Software
 * Foundation, Inc., 59 Temple Place - Suite 330, Boston, MA  02111-1307, USA.
 */
package utils;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

public class conexionMySQLServer {

    // Static variables
    private static final String ipAddress = "localhost"; //nota: localhost= 127.0.0.1
    private static final String dbName = "mech";
    private static final String user = "root";
    private static final String password = "root";

    /**
     * Returns Mysql database conecction.
     * <p>
     * This method tries to get the conecction to the Mysql server using
     * the defined global variables inside the class.
     *
     * @return Connection
     * @throws java.sql.SQLException
     */
    public static Connection getConnection() throws SQLException {
        try {
            Class.forName("com.mysql.jdbc.Driver");
        } catch (ClassNotFoundException e) {
            System.out.println("error \n");
            e.printStackTrace();
        }
        String url = "jdbc:mysql://" + ipAddress + "/" + dbName + "?useUnicode=yes&characterEncoding=UTF-8";
        return DriverManager.getConnection(url, user, password);
    }

    /**
     * Test method for connection.
     * <p>
     * This method tries to test the link between the application and the data
     * base.
     *
     * @throws java.sql.SQLException
     */
    private static void test() throws SQLException {
        Connection con = conexionMySQLServer.getConnection();
        if (con != null) {
            System.out.println("Conexión exitosa");
        }
    }
}
