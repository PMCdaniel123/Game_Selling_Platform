/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package dao;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.logging.Level;
import java.util.logging.Logger;
import model.Account;
import service.DBContext;

/**
 *
 * @author LENOVO
 */
public class AccountDAO extends DBContext {

    public AccountDAO() {

    }

    public ArrayList<Account> getAccountList() {
        ArrayList<Account> accounts = new ArrayList<>();

        String sql = "SELECT * FROM dbo.Account";
        boolean role = false;
        try {
            PreparedStatement pst = connection.prepareStatement(sql);
            ResultSet rs = pst.executeQuery();
            while (rs.next()) {
                Account acc = new Account();
                acc.setId(rs.getInt(1));
                acc.setUsername(rs.getString(2));
                acc.setEmail(rs.getString(3));
                acc.setPassword(rs.getString(4));
                acc.setFullname(rs.getString(5));
                acc.setPhone(rs.getString(6));
                if (rs.getInt(7) == 1) {
                    role = true;
                }
                acc.setRole(role);
                accounts.add(acc);
            }

        } catch (SQLException ex) {
            ex.printStackTrace();
        }
        return accounts;
    }
    public int numberofgame(int id) {
        int count = 0;
        String sql ="SELECT COUNT(*) FROM dbo.Library WHERE AccID = ?";
        try {
            PreparedStatement pst = connection.prepareStatement(sql);
            pst.setInt(1, id);
            ResultSet rs = pst.executeQuery();
            
            while (rs.next()) {                
                count = rs.getInt(1);
            }
        
        } catch (SQLException ex) {
            ex.printStackTrace();
        }
        return count;
        
    }

    public void deleteAccount(int id) {
    //DELETE FROM users WHERE id = 1;
    String sql = "DELETE FROM dbo.Account WHERE ID = ?";
        System.out.println("xóa ");
    try {
        PreparedStatement pst = connection.prepareStatement(sql);
        pst.setInt(1, id);
        pst.executeUpdate();
    } catch (SQLException ex) {
        Logger.getLogger(AccountDAO.class.getName()).log(Level.SEVERE, null, ex);
    }
}


    public Account getAccount(int id) {
        Account acc = new Account();
        String sql = "SELECT * FROM dbo.Account WHERE ID = ?";
        boolean role = false;
        try {
            PreparedStatement pst = connection.prepareStatement(sql);
            pst.setInt(1, id);
            ResultSet rs = pst.executeQuery();
            while (rs.next()) {
                acc.setId(rs.getInt(1));
                acc.setUsername(rs.getString(2));
                acc.setEmail(rs.getString(3));
                acc.setPassword(rs.getString(4));
                acc.setFullname(rs.getString(5));
                acc.setPhone(rs.getString(6));
                if (rs.getInt(7) == 1) {
                    role = true;
                }
                acc.setRole(role);
            }

        } catch (SQLException ex) {
            ex.printStackTrace();
        }
        return acc;
    }

    public Account getAccount(String username, String password) {
        Account acc = new Account();
        String sql = "SELECT * FROM dbo.Account WHERE Username = ? and Password = ?";
        boolean role = false;
        try {
            PreparedStatement pst = connection.prepareStatement(sql);
            pst.setString(1, username);
            pst.setString(2, password);
            ResultSet rs = pst.executeQuery();
            while (rs.next()) {
                acc.setId(rs.getInt(1));
                acc.setUsername(rs.getString(2));
                acc.setEmail(rs.getString(3));
                acc.setPassword(rs.getString(4));
                acc.setFullname(rs.getString(5));
                acc.setPhone(rs.getString(6));
                if (rs.getInt(7) == 1) {
                    role = true;
                }
                acc.setRole(role);
            }

        } catch (SQLException ex) {
            ex.printStackTrace();
        }
        return acc;
    }

    public Account getAccountwhileforgot(String email, String phone) {
        Account acc = new Account();
        String sql = "SELECT * FROM dbo.Account WHERE Email = ? and Phone = ?";
        boolean role = false;
        try {
            PreparedStatement pst = connection.prepareStatement(sql);
            pst.setString(1, email);
            pst.setString(2, phone);
            ResultSet rs = pst.executeQuery();
            while (rs.next()) {
                acc.setId(rs.getInt(1));
                acc.setUsername(rs.getString(2));
                acc.setEmail(rs.getString(3));
                acc.setPassword(rs.getString(4));
                acc.setFullname(rs.getString(5));
                acc.setPhone(rs.getString(6));
                if (rs.getInt(7) == 1) {
                    role = true;
                }
                acc.setRole(role);
            }

        } catch (SQLException ex) {
            ex.printStackTrace();
        }
        return acc;
    }

    public boolean isRegister(String username, String email, String phone) {
        Account acc = new Account();
        String sql = "SELECT * FROM dbo.Account WHERE Username = ? OR Email = ? OR Phone = ?";
        try {
            PreparedStatement pst = connection.prepareStatement(sql);
            pst.setString(1, username);
            pst.setString(2, email);
            pst.setString(3, phone);
            ResultSet rs = pst.executeQuery();
            while (rs.next()) {
                acc.setId(rs.getInt(1));
                acc.setUsername(rs.getString(2));
                acc.setEmail(rs.getString(3));
                acc.setPassword(rs.getString(4));
                acc.setFullname(rs.getString(5));
                acc.setPhone(rs.getString(6));
                acc.setRole(false);
            }
            if (acc.getEmail() == null) {
                return true;
            }
        } catch (SQLException ex) {
        }
        return false;
    }

    public void Updateprofile(int id, String fullname, String email, String phone) {
//        AccountDAO accountDAO = new AccountDAO();
//            Account acc = new Account();
        String sql = "UPDATE dbo.Account SET Fullname = ?,Email = ?, Phone = ? WHERE ID = ?";
        try {
            PreparedStatement pst = connection.prepareStatement(sql);
            pst.setString(1, fullname);
            pst.setString(2, email);
            pst.setString(3, phone);
            pst.setInt(4, id);
            ResultSet rs = pst.executeQuery();
        } catch (SQLException ex) {

        }
    }

    public void updatePassword(int id, String newpw) {

        String sql = "UPDATE dbo.Account SET Password = ? WHERE id = ?";
        try {
            PreparedStatement pst = connection.prepareStatement(sql);
            pst.setString(1, newpw);
            pst.setInt(2, id);
            ResultSet rs = pst.executeQuery();
        } catch (Exception e) {
        }
    }

    public void setAccount(String username, String email, String password, String fullname, String phone) {
        try {

            PreparedStatement pst = connection.prepareStatement("INSERT INTO dbo.Account (Username,Email,Password,Fullname,Phone,Role) values(?,?,?,?,?,?)");
            pst.setString(1, username);
            pst.setString(2, email);
            pst.setString(3, password);
            pst.setString(4, fullname);
            pst.setString(5, phone);
            pst.setInt(6, 0);

            pst.executeUpdate();

        } catch (SQLException ex) {
            ex.printStackTrace();
        }
    }

    public static void main(String[] args) {
        AccountDAO accountDAO = new AccountDAO();
        ArrayList<Account> accounts = new ArrayList<>();
        System.out.println(accountDAO.getAccountList());
    }
}