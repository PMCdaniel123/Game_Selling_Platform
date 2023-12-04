/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package dao;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import model.Game;
import service.DBContext;

/**
 *
 * @author user
 */
public class GameDAO extends DBContext{

    public GameDAO() {
    }
    
    public ArrayList<Game> getGameList() {
        ArrayList<Game> list = new ArrayList<>();

        String sql = "SELECT * FROM dbo.Game";
        try {
            PreparedStatement pst = connection.prepareStatement(sql);
            ResultSet rs = pst.executeQuery();
            while (rs.next()) {
                Game game = new Game();
                game.setId(rs.getInt(1));
                game.setTitle(rs.getString(2));
                game.setDescription(rs.getString(3));
                game.setAuthor(rs.getString(4));
                game.setKind(rs.getString(5));
                game.setPoster(rs.getString(6));
                game.setBackground(rs.getString(7));
                game.setPrice(rs.getInt(8));
                game.setCreated_at(rs.getString(9));
                game.setRating(rs.getInt(10));
                list.add(game);
            }
        } catch (SQLException ex) {
            ex.printStackTrace();
        }
        return list;
    }
    
    public ArrayList<Game> getGameListByKind(String kind) {
        ArrayList<Game> list = new ArrayList<>();

        String sql = "SELECT * FROM dbo.Game WHERE Kind LIKE ?";
        try {
            PreparedStatement pst = connection.prepareStatement(sql);
            pst.setString(1, kind);
            ResultSet rs = pst.executeQuery();
            while (rs.next()) {
                Game game = new Game();
                game.setId(rs.getInt(1));
                game.setTitle(rs.getString(2));
                game.setDescription(rs.getString(3));
                game.setAuthor(rs.getString(4));
                game.setKind(rs.getString(5));
                game.setPoster(rs.getString(6));
                game.setBackground(rs.getString(7));
                game.setPrice(rs.getInt(8));
                game.setCreated_at(rs.getString(9));
                game.setRating(rs.getInt(10));
                list.add(game);
            }
        } catch (SQLException ex) {
            ex.printStackTrace();
        }
        return list;
    }
    
    public ArrayList<Game> getTop3Games() {
        ArrayList<Game> list = new ArrayList<>();

        String sql = "SELECT TOP 3 * FROM dbo.Game ORDER BY Rating DESC";
        try {
            PreparedStatement pst = connection.prepareStatement(sql);
            ResultSet rs = pst.executeQuery();
            while (rs.next()) {
                Game game = new Game();
                game.setId(rs.getInt(1));
                game.setTitle(rs.getString(2));
                game.setDescription(rs.getString(3));
                game.setAuthor(rs.getString(4));
                game.setKind(rs.getString(5));
                game.setPoster(rs.getString(6));
                game.setBackground(rs.getString(7));
                game.setPrice(rs.getInt(8));
                game.setCreated_at(rs.getString(9));
                game.setRating(rs.getInt(10));
                list.add(game);
            }
        } catch (SQLException ex) {
            ex.printStackTrace();
        }
        return list;
    }
    
    public ArrayList<Game> searchGames(String keyword, String min_raw, String max_raw, String kind_raw, String order_raw) {
        ArrayList<Game> list = new ArrayList<>();
        double min = 0; 
        double max = 0;
        int order = 0;
        int kind = 0;
        String sql = "SELECT * FROM dbo.Game WHERE (Title LIKE ? OR Author LIKE ?) AND (Price > ? AND Price < ?)";
        
        if (order_raw != null) {
            order = Integer.parseInt(order_raw);
        }
        
        if (kind_raw != null) {
            kind = Integer.parseInt(kind_raw);
        }
        
        if (keyword == null) {
            keyword = "";
        }
        
        if (min_raw != null) {
            min = Double.parseDouble(min_raw);
        }
        
        if (max_raw == null) {
            max = 1000000;
        } else {
            max = Double.parseDouble(max_raw);
        }
        
        switch (kind) {
            case 1:
                sql = sql + " AND Kind LIKE 'Action'";
                break;
            case 2:
                sql = sql + " AND Kind LIKE 'Adventure'";
                break;
            case 3:
                sql = sql + " AND Kind LIKE 'Shooter'";
                break;
            default:
                break;
        }
        
        switch (order) {
            case 1:
                sql = sql + " ORDER BY Title ASC";
                break;
            case 2:
                sql = sql + " ORDER BY Title DESC";
                break;
            case 3:
                sql = sql + " ORDER BY Price ASC";
                break;
            case 4:
                sql = sql + " ORDER BY Price DESC";
                break;
            default:
                break;
        }
        
        try {
            PreparedStatement pst = connection.prepareStatement(sql);
            pst.setString(1, "%" + keyword + "%");
            pst.setString(2, "%" + keyword + "%");
            pst.setDouble(3, min);
            pst.setDouble(4, max);
            ResultSet rs = pst.executeQuery();
            while (rs.next()) {
                Game game = new Game();
                game.setId(rs.getInt(1));
                game.setTitle(rs.getString(2));
                game.setDescription(rs.getString(3));
                game.setAuthor(rs.getString(4));
                game.setKind(rs.getString(5));
                game.setPoster(rs.getString(6));
                game.setBackground(rs.getString(7));
                game.setPrice(rs.getInt(8));
                game.setCreated_at(rs.getString(9));
                game.setRating(rs.getInt(10));
                list.add(game);
            }
        } catch (SQLException ex) {
            ex.printStackTrace();
        }
        return list;
    }
    
    public static void main(String[] args) {
        GameDAO gdao = new GameDAO();
        ArrayList<Game> list = gdao.searchGames(null, null, null, "2","4");
        for (Game game : list) {
            System.out.println(game);
        }
    }
}
