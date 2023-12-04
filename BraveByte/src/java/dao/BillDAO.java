package dao;

import java.math.BigInteger;
import java.security.SecureRandom;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;
import javax.servlet.http.HttpServletRequest;
import model.Bill;
import model.Game;
import service.DBContext;

public class BillDAO extends DBContext {
public List<Bill> getBillsByBillID(String billID) {
    List<Bill> bills = new ArrayList<>();
    String sql = "SELECT b.BillID, b.AccID, a.Fullname, b.BillDate, b.TotalPrice "
               + "FROM [dbo].[Bill] b "
               + "INNER JOIN [dbo].[Account] a ON b.AccID = a.ID "
               + "WHERE b.BillID = ?";
    
    try (
        PreparedStatement st = connection.prepareStatement(sql)
    ) {
        st.setString(1, billID);
        ResultSet rs = st.executeQuery();
        while (rs.next()) {
            Bill bill = new Bill(
                rs.getString("BillID"),
                rs.getInt("AccID"),
                rs.getString("Fullname"),
                rs.getString("BillDate"),
                rs.getDouble("TotalPrice")
            );
            bills.add(bill);
        }
    } catch (SQLException e) {
        e.printStackTrace();
        // Handle the exception appropriately
    }
    return bills;
}




       public List<Bill> getBillsByUserId(HttpServletRequest request) {
    List<Bill> bills = new ArrayList<>();
    int userId = (int) request.getSession().getAttribute("userId");
    
    String sql = "SELECT b.BillID, b.BillDate, b.TotalPrice, a.ID AS AccID, a.Fullname "
               + "FROM [dbo].[Bill] b "
               + "INNER JOIN [dbo].[Account] a ON b.AccID = a.ID "
               + "WHERE b.AccID = ?";
    
    try (
        PreparedStatement st = connection.prepareStatement(sql)
    ) {
        st.setInt(1, userId);
        ResultSet rs = st.executeQuery();
        while (rs.next()) {
            Bill bill = new Bill(
                rs.getString("BillID"),
                rs.getInt("AccID"),
                rs.getString("Fullname"),
                rs.getString("BillDate"),
                rs.getDouble("TotalPrice")
            );
            bills.add(bill);
        }
    } catch (SQLException e) {
        e.printStackTrace();
        // Handle the exception appropriately
    }
    return bills;
}
public List<Game> getGamesInBill(String billID) {
    List<Game> games = new ArrayList<>();
    String sql = "SELECT g.ID, g.Title, g.Kind, g.Background, g.Price "
               + "FROM [dbo].[BillDetail] bd "
               + "INNER JOIN [dbo].[Game] g ON bd.GID = g.ID "
               + "WHERE bd.BillID = ?";
    
    try (
        PreparedStatement st = connection.prepareStatement(sql)
    ) {
        st.setString(1, billID);
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

public void createBillAndBillDetails(Bill bill, List<Game> games) {
    String createBillSQL = "INSERT INTO [dbo].[Bill] (BillID, AccID, BillDate, TotalPrice) "
                         + "VALUES (?, ?, ?, ?)";

    String createBillDetailSQL = "INSERT INTO [dbo].[BillDetail] (GID, BillID) VALUES (?, ?)";

    try (
        PreparedStatement createBillStatement = connection.prepareStatement(createBillSQL, Statement.RETURN_GENERATED_KEYS);
        PreparedStatement createBillDetailStatement = connection.prepareStatement(createBillDetailSQL)
    ) {
        connection.setAutoCommit(false);

        String generatedBillID = generateRandomUniqueBillID(); // Generate a unique BillID
        createBillStatement.setString(1, generatedBillID);
        createBillStatement.setInt(2, bill.getAccID());
        createBillStatement.setString(3, bill.getBillDate());
        createBillStatement.setDouble(4, bill.getTotal());

        createBillStatement.executeUpdate();

        ResultSet generatedKeys = createBillStatement.getGeneratedKeys();
        if (generatedKeys.next()) {
            for (Game game : games) {
                createBillDetailStatement.setInt(1, game.getId());
                createBillDetailStatement.setString(2, generatedBillID); // Use the generated BillID
                createBillDetailStatement.addBatch();
            }

            createBillDetailStatement.executeBatch();
            connection.commit();
        } else {
            connection.rollback();
            // Handle the case where no keys were generated
        }
    } catch (SQLException e) {
        e.printStackTrace();
        try {
            connection.rollback();
        } catch (SQLException ex) {
            ex.printStackTrace();
        }
        // Handle the exception appropriately
    } finally {
        try {
            connection.setAutoCommit(true);
        } catch (SQLException ex) {
            ex.printStackTrace();
        }
    }
}


    public List<Bill> getAllBills() {
        List<Bill> bills = new ArrayList<>();
        String sql = "SELECT b.BillID, b.BillDate, b.TotalPrice, a.ID AS AccID, a.Fullname "
                   + "FROM [dbo].[Bill] b "
                   + "INNER JOIN [dbo].[Account] a ON b.AccID = a.ID";
        
        try (
            PreparedStatement st = connection.prepareStatement(sql)
        ) {
            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                Bill bill = new Bill(
                   rs.getString("BillID"),
                    rs.getInt("AccID"),
                    rs.getString("Fullname"),
                    rs.getString("BillDate"),
                    rs.getDouble("TotalPrice")
                );
                bills.add(bill);
            }
        } catch (SQLException e) {
            e.printStackTrace();
            // Handle the exception appropriately
        }
        return bills;
    }
    public String generateRandomUniqueBillID() {
        int length = 16;
        String randomBillID;
        do {
            randomBillID = generateRandomBillID(length);
        } while (isBillIDExists(randomBillID));

        return randomBillID;
    }

    private boolean isBillIDExists(String billID) {
        String sql = "SELECT BillID FROM [dbo].[Bill] WHERE BillID = ?";
        try (PreparedStatement st = connection.prepareStatement(sql)) {
            st.setString(1, billID);
            try (ResultSet rs = st.executeQuery()) {
                return rs.next();
            }
        } catch (SQLException e) {
            e.printStackTrace();
            // Handle the exception appropriately
            return false;
        }
    }

    private String generateRandomBillID(int length) {
        SecureRandom random = new SecureRandom();
        byte[] bytes = new byte[length / 2];
        random.nextBytes(bytes);
        String randomString = new BigInteger(1, bytes).toString(16);

        // Pad the string with zeros if it's shorter than the desired length
        while (randomString.length() < length) {
            randomString = "0" + randomString;
        }

        return randomString;
    }
}
