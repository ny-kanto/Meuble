/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package controller.form;

import java.io.IOException;
import java.sql.Connection;
import java.time.LocalDate;
import java.util.List;

import connection.Connect;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.util.ArrayList;
import model.VStatistique;
import model.Volume;
import model.Meuble;

/**
 *
 * @author nykan
 */
@WebServlet(name = "Statistique", urlPatterns = { "/Statistique" })
public class Statistique extends HttpServlet {

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
            VStatistique vs = new VStatistique();
            List<VStatistique> listvs = new ArrayList<>();
            Volume v = new Volume();
            List<Volume> listv = v.select(c);

            Meuble m = new Meuble();
            List<Meuble> listm = m.select(c);
            System.out.println("meuble " + request.getParameter("meuble") + " ito");

            LocalDate currentDate = LocalDate.now();
            int annee = currentDate.getYear();

            if (request.getParameter("meuble") == null || request.getParameter("meuble") == "") {
                if (request.getParameter("annee") == null || request.getParameter("annee") == "") {
                    listvs = vs.listStatMeuble(request.getParameter("volume"), annee, c);
                } else {
                    listvs = vs.listStatMeuble(request.getParameter("volume"), Integer.parseInt(request.getParameter("annee")), c);
                }
            } else if (request.getParameter("meuble") != null || request.getParameter("meuble") != "") {
                if (request.getParameter("annee") == null || request.getParameter("annee") == "") {
                    listvs = vs.listStat(request.getParameter("meuble"), request.getParameter("volume"), annee, c);
                } else {
                    listvs = vs.listStat(request.getParameter("meuble"), request.getParameter("volume"), Integer.parseInt(request.getParameter("annee")), c);
                }
            }

            request.setAttribute("listvs", listvs);
            request.setAttribute("listm", listm);
            request.setAttribute("listv", listv);
            c.close();
            request.getRequestDispatcher("./pages/statistique.jsp").forward(request, response);
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