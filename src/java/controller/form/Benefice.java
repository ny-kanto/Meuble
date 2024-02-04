/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package controller.form;

import java.io.IOException;
import java.sql.Connection;

import connection.Connect;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import model.VBenefice;
import java.util.List;
import java.util.ArrayList;

/**
 *
 * @author nykan
 */
@WebServlet(name = "Benefice", urlPatterns = { "/Benefice" })
public class Benefice extends HttpServlet {

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
            VBenefice vb = new VBenefice();
            List<VBenefice> listvb = new ArrayList<>();
            System.out.println("prixmin" + request.getParameter("prix_min") + "a");
            System.out.println("prixmax" + request.getParameter("prix_max") + "a");
            if (request.getParameter("prix_min") != null && request.getParameter("prix_max") != null
                    && request.getParameter("prix_min") != "" && request.getParameter("prix_max") != "") {
                System.out.println("Tafi");
                listvb = vb.getBeneficeMinMax(Double.parseDouble(request.getParameter("prix_min")),
                        Double.parseDouble(request.getParameter("prix_max")), c);
            } else {
                listvb = vb.select(c);
            }
            request.setAttribute("listvb", listvb);
            c.close();
            request.getRequestDispatcher("./pages/listMeubleBenefice.jsp").forward(request, response);
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
