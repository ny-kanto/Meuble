/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package controller.form;

import connection.Connect;
import java.io.IOException;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import model.Materiel;
import model.VMaterielMeuble;

import java.sql.Connection;
import java.util.ArrayList;
import java.util.List;

/**
 *
 * @author nykan
 * SERVLET POUR AFFICHER LA VUE meubleMaterielSearch.jsp POUR FAIRE UNE RECHERCHE DES MEUBLES UTILISANT UN MATERIEL
 */
@WebServlet(name = "MeubleMaterielSearch", urlPatterns = {"/MeubleMaterielSearch"})
public class MeubleMaterielSearch extends HttpServlet {

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
        try {
            Connection c = Connect.postgres("jdbc:postgresql://localhost:5432/meuble", "postgres", "mdp");
            VMaterielMeuble vmm = new VMaterielMeuble();
            List<VMaterielMeuble> listvmm = new ArrayList<>();
            Materiel m = new Materiel();
            List<Materiel> listm = m.select(c);
            if (request.getParameter("materiel") != null) {
                vmm.setIdmateriel(Integer.parseInt(request.getParameter("materiel")));
                listvmm = vmm.select(c);
            }
            request.setAttribute("listvmm", listvmm);
            request.setAttribute("listm", listm);
            c.close();
            request.getRequestDispatcher("./pages/meubleMaterielSearch.jsp").forward(request, response);
        } catch (Exception e) {
            e.printStackTrace();
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
