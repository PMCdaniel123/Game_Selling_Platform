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
import model.Pagging;
import service.DBContext;

/**
 *
 * @author user
 */
public class PaggingDAO extends DBContext {

    public PaggingDAO() {
    }

    public Pagging getListGames(int page, int perPage) {
        Pagging pagging = new Pagging();
        ArrayList<Game> list = new ArrayList<>();
        String sql = "SELECT * FROM dbo.Game ORDER BY id OFFSET ? ROWS  FETCH FIRST ? ROWS ONLY";
        int offset = (page - 1) * perPage;
        
        try {
            PreparedStatement pst = connection.prepareStatement(sql);
            pst.setInt(1, offset);
            pst.setInt(2, perPage);
            
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
            //----------------------------------------------------
            pagging.setItems(list);
            
            String sqlCountAll = "SELECT COUNT(*) FROM dbo.Game";
            pst = connection.prepareStatement(sqlCountAll);
            rs = pst.executeQuery();
            int total = 0;
            while (rs.next()) {
                total = rs.getInt(1); // cột 1 là số lượng tin tức, thay vì dùng tên cột thì dùng index cột
            }
            pagging.setTotal(total);
            pagging.setPage(page);
            pagging.setPerPage(perPage);

        } catch (SQLException ex) {
            ex.printStackTrace();
        }
        return pagging;
    }
    
    public Pagging getListSearch(String keyword, String min_raw, String max_raw, String kind_raw, String order_raw, int page, int perPage) {
        Pagging pagging = new Pagging();
        GameDAO gdao = new GameDAO();
        ArrayList<Game> listItem = gdao.searchGames(keyword, min_raw, max_raw, kind_raw, order_raw);
        ArrayList<Game> list = new ArrayList<>();
        double min = 0; 
        double max = 0;
        int order = 0;
        int kind = 0;
        int offset = (page - 1) * perPage;
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
        sql += " ORDER BY id";
        switch (order) {
            case 1:
                sql = sql.substring(0, sql.length()-3) + " Title ASC";
                break;
            case 2:
                sql = sql.substring(0, sql.length()-3) + " Title DESC";
                break;
            case 3:
                sql = sql.substring(0, sql.length()-3) + " Price ASC";
                break;
            case 4:
                sql = sql.substring(0, sql.length()-3) + " Price DESC";
                break;
            default:
                break;
        }
        
        sql += " OFFSET ? ROWS  FETCH FIRST ? ROWS ONLY";
        System.out.println(sql);
        try {
            PreparedStatement pst = connection.prepareStatement(sql);
            pst.setString(1, "%" + keyword + "%");
            pst.setString(2, "%" + keyword + "%");
            pst.setDouble(3, min);
            pst.setDouble(4, max);
            pst.setInt(5, offset);
            pst.setInt(6, perPage);
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
            pagging.setItems(list);
            int total = 0;
            if (listItem != null) {
                total = listItem.size();
            }
            pagging.setTotal(total);
            pagging.setPage(page);
            pagging.setPerPage(perPage);
        } catch (SQLException ex) {
            ex.printStackTrace();
        }
        return pagging;
    }
    
    public static void main(String[] args) {
        PaggingDAO paggingDAO = new PaggingDAO();
        ArrayList<Game> list = paggingDAO.getListSearch(null, null, null, "2", "4", 3, 4).getItems();
        for (Game game : list) {
            System.out.println(game);
        }
    }
}
