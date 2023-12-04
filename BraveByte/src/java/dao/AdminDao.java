/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package dao;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import model.Game;
import model.Pagging;
import service.DBContext;

/**
 *
 * @author acer
 */
public class AdminDao extends DBContext {

    public AdminDao() {

    }

    @SuppressWarnings("empty-statement")
    public void AddGame(String title, String description, String author, String category, String poster, String background, String price, String rating) {

        String sql = "INSERT INTO [dbo].[Game] ([Title], [Description], [Author], [Kind], [Poster], [Background], [Price], [Rating])\n"
                + "VALUES (?, ?, ?, ?, ?, ?, ?, ?)";
        try {

            PreparedStatement pst = connection.prepareStatement(sql);
            pst.setString(1, title);
            pst.setString(2, description);
            pst.setString(3, author);

            pst.setString(4, category);
            pst.setString(5, poster);

            pst.setString(6, background);

            pst.setDouble(7, (Double.parseDouble(price)));
            pst.setInt(8, Integer.parseInt(rating));

            int rowsInserted = pst.executeUpdate();
            if (rowsInserted > 0) {
                System.out.println("Insertion successful");
            } else {
                System.out.println("Insertion failed");
            }
        } catch (SQLException ex) {
            System.out.println("SQL Error: " + ex.getMessage());
        } catch (Exception e) {
            System.out.println("Error: " + e.getMessage());
        }

    }
    public int getCountGames() {
        int count = 0;
        String sql = "SELECT COUNT(*) FROM dbo.Game";
        
        try {
            PreparedStatement pst = connection.prepareStatement(sql);
            
            ResultSet rs = pst.executeQuery();
            while (rs.next()) {
                count = rs.getInt(1); // cột 1 là số lượng tin tức, thay vì dùng tên cột thì dùng index cột
            }

        } catch (SQLException ex) {
            ex.printStackTrace();
        }
        return count;
    }
    public int getCountAccounts() {
        int count = 0;
        String sql = "SELECT COUNT(*) FROM dbo.Account";
        
        try {
            PreparedStatement pst = connection.prepareStatement(sql);
            
            ResultSet rs = pst.executeQuery();
            while (rs.next()) {
                count = rs.getInt(1); // cột 1 là số lượng tin tức, thay vì dùng tên cột thì dùng index cột
            }

        } catch (SQLException ex) {
            ex.printStackTrace();
        }
        return count;
    }
    public int getCountBills() {
    int count = 0;
    String sql = "SELECT COUNT(*) FROM dbo.Bill";

    try {
        PreparedStatement pst = connection.prepareStatement(sql);

        ResultSet rs = pst.executeQuery();
        while (rs.next()) {
            count = rs.getInt(1); 
        }

    } catch (SQLException ex) {
        ex.printStackTrace();
    }
    return count;
}
}