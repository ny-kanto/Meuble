/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package controller.insert;

import java.io.IOException;
import java.sql.Connection;
import java.sql.Date;

import connection.Connect;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import model.Vente;

/**
 *
 * @author nykan
 */
@WebServlet(name = "VenteInsert", urlPatterns = { "/VenteInsert" })
public class VenteInsert extends HttpServlet {

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request  servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException      if an I/O error occurs
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        try {
            Connection c = Connect.postgres("jdbc:postgresql://localhost:5432/meuble", "postgres", "mdp");
            int idclient = Integer.parseInt(request.getParameter("client"));
            int idmeuble = Integer.parseInt(request.getParameter("meuble"));
            int idvolume = Integer.parseInt(request.getParameter("volume"));
            double qte = Double.parseDouble(request.getParameter("qte"));
            Date datevente = Date.valueOf(request.getParameter("datevente"));

            Vente vente = new Vente();
            vente.setIdclient(idclient);
            vente.setIdmeuble(idmeuble);
            vente.setIdvolume(idvolume);
            vente.setQte(qte);
            vente.setDatevente(datevente);
            vente.insert(c);
            c.close();
            response.sendRedirect("/Furniture/Vente");
        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the
    // + sign on the left to edit the code.">
    /**
     * Handles the HTTP <code>GET</code> method.
     *
     * @param request  servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException      if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Handles the HTTP <code>POST</code> method.
     *
     * @param request  servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException      if an I/O error occurs
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
