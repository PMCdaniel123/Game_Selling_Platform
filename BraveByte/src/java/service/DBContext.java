/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package service;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

/**
 *
 * @author user
 */

//LAPTOP-E4SKS25R\PHAMCUONG

public class DBContext {
    
    protected  Connection connection;

    public DBContext() {
        try {
            String url = "jdbc:sqlserver://localhost:1433;databasename=Fsoft_FinalProject";
            String uid = "sa";
            String pwd = "123456";
            Class.forName("com.microsoft.sqlserver.jdbc.SQLServerDriver");
            connection = DriverManager.getConnection(url, uid, pwd);
            
        } catch (ClassNotFoundException | SQLException e) {
            System.out.println(e);
        }
    }
}
