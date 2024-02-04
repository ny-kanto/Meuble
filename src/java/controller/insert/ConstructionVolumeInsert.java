/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package controller.insert;

import java.io.IOException;
import java.sql.Connection;

import java.util.List;

import connection.Connect;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import model.ConstructionVolume;
import model.Volume;

/**
 *
 * @author nykan
 */
@WebServlet(name = "ConstructionVolumeInsert", urlPatterns = { "/ConstructionVolumeInsert" })
public class ConstructionVolumeInsert extends HttpServlet {

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
            int nbpersonne = Integer.parseInt(request.getParameter("nbpersonne"));
            int multi = Integer.parseInt(request.getParameter("multi"));

            Volume v = new Volume();
            List<Volume> listv = v.select(c);

            ConstructionVolume cv = new ConstructionVolume();

            int temp = 0;

            for (int i = 0; i < listv.size(); i++) {
                cv.setIdvolume(listv.get(i).getId());
                if (listv.get(i).getId() == 1) {
                    cv.setNbpersonne(nbpersonne);
                    temp = cv.getNbpersonne();
                } else {
                    cv.setNbpersonne(temp * multi);
                    temp = cv.getNbpersonne();
                }
                cv.insert(c);
            }
            c.close();
            response.sendRedirect("/Furniture/ConstructionVolume");
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
