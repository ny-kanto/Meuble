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
import java.sql.Connection;
import java.util.ArrayList;
import java.util.List;
import model.Style;
import model.VStyleMateriel;

/**
 *
 * @author nykan
 * SERVLET POUR AFFICHER LA VUE styleMaterielSearch.jsp POUR FAIRE UNE RECHERCHE DES MATERIELS POUR UNE STYLE
 */
@WebServlet(name = "StyleMaterielSearch", urlPatterns = {"/StyleMaterielSearch"})
public class StyleMaterielSearch extends HttpServlet {

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
            VStyleMateriel vms = new VStyleMateriel();
            Style s = new Style();
            List<Style> lists = s.select(c);
            List<VStyleMateriel> listvms = new ArrayList<>();
            if (request.getParameter("style") != null) {
                vms.setIdstyle(Integer.parseInt(request.getParameter("style")));
                listvms = vms.select(c);
            }
            for (int i = 0; i < listvms.size(); i++) {
                System.out.println("nom materiel " + listvms.get(i).getNommateriel());
            }
            request.setAttribute("lists", lists);
            request.setAttribute("listvms", listvms);
            c.close();
            request.getRequestDispatcher("./pages/styleMaterielSearch.jsp").forward(request, response);
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
