/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package controller;

import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import model.WatchedList;
import model.media.Media;
import repository.WatchedListDAO;

/**
 *
 * @author aluno
 */
public class AddMediaToListServlet extends HttpServlet {

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

        String user_email = request.getParameter("user-email");
        int media_id = Integer.parseInt(request.getParameter("media-id"));
        String entry = request.getParameter("search-entry");

        WatchedListDAO wlDAO = new WatchedListDAO();
        WatchedList wl = wlDAO.getOne(user_email);

        boolean addMedia = wlDAO.addUserMedia(media_id, wl.getId());
        if (addMedia) {
            request.setAttribute("error", null);
            request.setAttribute("search-entry", entry);
            request.setAttribute("user-email", user_email);
            RequestDispatcher dispatcher = request.getRequestDispatcher("SearchMedia");
            dispatcher.forward(request, response);
        } else {
            request.setAttribute("error", "Alguma coisa deu errado!");
            request.setAttribute("search-entry", entry);
            request.setAttribute("user-email", user_email);
            RequestDispatcher dispatcher = request.getRequestDispatcher("SearchMedia");
            dispatcher.forward(request, response);
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
