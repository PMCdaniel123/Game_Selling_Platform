/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package servlet;

import dao.GameDAO;
import dao.PaggingDAO;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import model.Game;
import model.Pagging;

/**
 *
 * @author user
 */
public class SearchServlet extends HttpServlet {

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
            /* TODO output your page here. You may use following sample code. */
            String minimum = null;
            String maximum = null;
            String keyword = null;
            String kind = request.getParameter("kind");
            String sort = request.getParameter("sort");
            
            if (!request.getParameter("txtSearch").equals("")) {
                keyword = request.getParameter("txtSearch");
            }
            if (!request.getParameter("minimum").equals("")) {
                minimum = request.getParameter("minimum");
            }
            if (!request.getParameter("maximum").equals("")) {
                maximum = request.getParameter("maximum");
            }

            GameDAO gdao = new GameDAO();
//            ArrayList<Game> searchs = gdao.searchGames(keyword, minimum, maximum, kind,sort);
            
            PaggingDAO paggingDAO = new PaggingDAO();
            String currentPage = request.getParameter("currentPage");
            int page = 1;
            Pagging pagging = null;
            
            if (currentPage != null) {
                page = Integer.parseInt(currentPage);
            }
            int perPage = 4;
            pagging = paggingDAO.getListSearch(keyword, minimum, maximum, kind, sort, page, perPage);
            for (Game item : pagging.getItems()) {
                System.out.println(item);
            }
            double tt = (pagging.getTotal() * 1.0) / perPage;
            int numberPage = (int) Math.ceil(tt);
            
            request.setAttribute("listGame", pagging.getItems());
            request.setAttribute("page", pagging.getPage());
            request.setAttribute("total", pagging.getTotal());
            request.setAttribute("numberPage", numberPage);
            request.setAttribute("pagging", pagging);

//            request.setAttribute("searchs", searchs);
            request.setAttribute("keyword", keyword);
            request.setAttribute("maximum", maximum);
            request.setAttribute("minimum", minimum);
            request.setAttribute("sort", sort);
            request.setAttribute("kind", kind);
            request.getRequestDispatcher("searchs.jsp").forward(request, response);
        }
    }

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
        processRequest(request, response);
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
        processRequest(request, response);
    }

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
