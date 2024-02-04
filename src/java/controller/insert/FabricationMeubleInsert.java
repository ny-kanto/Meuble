/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package controller.insert;

import java.io.IOException;
import java.sql.Connection;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import connection.Connect;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import model.Materiel;
import model.VEtatStock;
import model.VMaterielMeuble;

/**
 *
 * @author nykan
 */
@WebServlet(name = "FabricationMeubleInsert", urlPatterns = { "/FabricationMeubleInsert" })
public class FabricationMeubleInsert extends HttpServlet {

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
        Connection c = null;
        try {
            c = Connect.postgres("jdbc:postgresql://localhost:5432/meuble", "postgres", "mdp");
        } catch (SQLException | ClassNotFoundException e) {
            request.setAttribute("erreurMessage", e.getMessage());
            request.getRequestDispatcher("/error/index.jsp").forward(request, response);
        }
        int idmeuble = Integer.parseInt(request.getParameter("meuble"));
        int idvolume = Integer.parseInt(request.getParameter("volume"));
        double quantite = Double.parseDouble(request.getParameter("quantite"));
        double sommeQte = 0;

        Materiel m = new Materiel();
        List<Materiel> listm = new ArrayList<>();

        VEtatStock ves = new VEtatStock();
        List<VEtatStock> listves = new ArrayList<>();

        VMaterielMeuble vmm = new VMaterielMeuble();
        vmm.setIdmeuble(idmeuble);
        vmm.setIdvolume(idvolume);
        List<VMaterielMeuble> listvmm = new ArrayList<>();

        try {
            listvmm = vmm.select(c);
        } catch (SQLException e) {
            request.setAttribute("erreurMessage", e.getMessage());
            request.getRequestDispatcher("/error/index.jsp").forward(request, response);
        }

        if (listvmm.isEmpty() || listvmm == null) {
            try {
                throw new Exception("il n'y a pas de meuble de cette taille");
            } catch (Exception e) {
                request.setAttribute("erreurMessage", e.getMessage());
                request.getRequestDispatcher("/error/index.jsp").forward(request, response);
            }
        }

        // try {
        //     vmm.sommeQte(listvmm, ves, m, quantite, c);
        // } catch (SQLException | ClassNotFoundException e) {
        //     request.setAttribute("erreurMessage", e.getMessage());
        //     request.getRequestDispatcher("/error/index.jsp").forward(request, response);
        // }

        List<String> nommateriel = new ArrayList<>();
        List<Double> qteinsuffisante = new ArrayList<>();

        for (int i = 0; i < listvmm.size(); i++) {
            ves.setIdmateriel(listvmm.get(i).getIdmateriel());
            try {
                listves = ves.select(c);
                for (int j = 0; j < listves.size(); j++) {
                    sommeQte = listves.get(j).getReste() - (listvmm.get(i).getQte() * quantite);
                    m.setId(listvmm.get(i).getIdmateriel());
                    listm = m.select(c);
                    if (sommeQte < 0) {
                        nommateriel.add(listm.get(0).getNom());
                        qteinsuffisante.add((-sommeQte));
                    }
                }
            } catch (SQLException e) {
                request.setAttribute("erreurMessage", e.getMessage());
                request.getRequestDispatcher("/error/index.jsp").forward(request, response);
            }
        }

        try {
            c.close();
        } catch (SQLException e) {
            request.setAttribute("erreurMessage", e.getMessage());
            request.getRequestDispatcher("/error/index.jsp").forward(request, response);
        }
        if (nommateriel.size() > 0) {
            try {
                throw new Exception("Quantité de matériel insuffisante");
            } catch (Exception e) {
                request.setAttribute("erreurMessage", e.getMessage());
                request.setAttribute("listmat", nommateriel);
                request.setAttribute("qte", qteinsuffisante);
                request.getRequestDispatcher("/error/index.jsp").forward(request, response);
            }
        }
//        response.sendRedirect("/Furniture/AchatMateriel");
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
