/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package servlet;

import dao.BillDAO;
import dao.CartDAO;
import dao.LibraryDAO;
import java.io.IOException;
import java.math.BigInteger;
import java.security.SecureRandom;
import java.time.LocalDate;
import java.time.format.DateTimeFormatter;
import java.util.List;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import model.Bill;
import model.Game;

/**
 *
 * @author ADMIN
 */
@WebServlet(name = "AddGametoLibrary", urlPatterns = {"/addgamelibrary"})
public class AddGametoLibrary extends HttpServlet {

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /**
     * Handles the HTTP <code>GET</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
            
            
    }

    /**
     * Handles the HTTP <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
 
protected void doPost(HttpServletRequest request, HttpServletResponse response)
        throws ServletException, IOException {
    LibraryDAO libraryDAO = new LibraryDAO();
    CartDAO cartDAO = new CartDAO();
    HttpSession session = request.getSession();
        List<Game> cartGames = cartDAO.getAllGamesForUser(request);
        
        if (cartGames != null) {
            for (Game game : cartGames) {
                 libraryDAO.addGameToLibrary(session, game.getId());
                 cartDAO.removeGameFromCart(session, game.getId());
            }
            BillDAO billDAO = new BillDAO();
    Bill newBill = new Bill();
    
   
     int userId = (int) session.getAttribute("userId");
    newBill.setAccID(userId);
    LocalDate currentDate = LocalDate.now();
    DateTimeFormatter formatter = DateTimeFormatter.ofPattern("yyyy-MM-dd");
    String formattedDate = currentDate.format(formatter);
    newBill.setBillDate(formattedDate);
    double total =0;
    for (Game game : cartGames) {
       total =total + game.getPrice();
    }
    newBill.setTotal(total); 
    billDAO.createBillAndBillDetails(newBill, cartGames);
     }   
    response.sendRedirect("home.jsp");
}
   
}

   
   


