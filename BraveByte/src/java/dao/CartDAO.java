package dao;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import model.Game;
import service.DBContext;

public class CartDAO extends DBContext {
    public List<Game> getAllGamesForUser(HttpServletRequest request) {
        List<Game> games = new ArrayList<>();
        int userId = (int) request.getSession().getAttribute("userId"); // Lấy ID của người dùng từ session

        String sql = "SELECT g.ID, g.Title, g.Kind, g.Background, g.Price\n" +
                     "FROM dbo.Game g\n" +
                     "INNER JOIN dbo.Cart c ON g.ID = c.GID\n" +
                     "WHERE c.AccID = ?";

        try (
            PreparedStatement st = connection.prepareStatement(sql)
        ) {
            st.setInt(1, userId);
            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                Game game = new Game(
                    rs.getInt("ID"),
                    rs.getString("Title"),
                    rs.getString("Kind"),
                    rs.getString("Background"),
                    rs.getDouble("Price")
                );
                games.add(game);
            }
        } catch (SQLException e) {
            e.printStackTrace();
            // Handle the exception appropriately
        }
        return games;
    }
    
    public void removeGameFromCart(HttpSession session, int idGame) {
        String sql = "DELETE FROM dbo.Cart WHERE AccID = ? AND GID = ?";
        int userId = (int) session.getAttribute("userId");
        try (
            PreparedStatement st = connection.prepareStatement(sql)
        ) {
            st.setInt(1, userId);
            st.setInt(2, idGame);

            st.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
            // Handle the exception appropriately
        }
    }
    public void addGameToCart(HttpSession session, int idGame) {
        int userId = (int) session.getAttribute("userId");

        String sql = "INSERT INTO dbo.Cart (AccID, GID) VALUES (?, ?)";

        try (
            PreparedStatement st = connection.prepareStatement(sql)
        ) {
            st.setInt(1, userId);
            st.setInt(2, idGame);

            st.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
            // Handle the exception appropriately
        }
    }
    public void removeAllGamesFromCartForUser(HttpServletRequest request) {
        int userId = (int) request.getSession().getAttribute("userId");

        String sql = "DELETE FROM dbo.Cart WHERE AccID = ?";

        try (
            PreparedStatement st = connection.prepareStatement(sql)
        ) {
            st.setInt(1, userId);
            st.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
            // Handle the exception appropriately
        }
    }
}
