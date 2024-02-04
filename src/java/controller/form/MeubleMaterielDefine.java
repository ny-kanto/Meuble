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
import model.VStyleMateriel;
import model.Volume;
import model.Meuble;

import java.sql.Connection;
import java.util.List;

/**
 *
 * @author nykan
 * SERVLET POUR AFFICHER LA VUE meubleMaterielDefine.jsp POUR DEFINIR LES MATERIELS D'UN MEUBLE UTILISANT UN MATERIEL SELECTIONNE
 */
@WebServlet(name = "MeubleMaterielDefine", urlPatterns = {"/MeubleMaterielDefine"})
public class MeubleMaterielDefine extends HttpServlet {

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
            Meuble m = new Meuble();
            m.setId(Integer.parseInt(request.getParameter("idmeuble")));
            List<Meuble> listm = m.select(c);
            VStyleMateriel vsm = new VStyleMateriel();
            vsm.setIdstyle(listm.get(0).getIdstyle());
            List<VStyleMateriel> listvsm = vsm.select(c);

            Volume v = new Volume();
            List<Volume> listv = v.select(c);

            request.setAttribute("listvsm", listvsm);
            request.setAttribute("listv", listv);
            request.setAttribute("idmeuble", request.getParameter("idmeuble"));
            c.close();
            request.getRequestDispatcher("./pages/meubleMaterielDefine.jsp").forward(request, response);
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
