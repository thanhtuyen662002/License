/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package utils;

import java.sql.Connection;
import java.sql.DriverManager;

/**
 *
 * @author PC
 */
public class DBUtils {
    public static Connection makeConnection() throws Exception{
        Connection cn=null;
        String IP="localhost";
        String instanceName="DESKTOP-9R59LGC";
        String port="1433";
        String uid="sa";
        String pwd="12345";
        String db="License";
        String driver="com.microsoft.sqlserver.jdbc.SQLServerDriver";
        String url="jdbc:sqlserver://" +IP+ "\\" +instanceName+ ":" +port+ 
                ";databasename=" +db+ ";user=" +uid+ ";password=" +pwd;
        Class.forName(driver);
        cn=DriverManager.getConnection(url);
        return cn;
    }
}
