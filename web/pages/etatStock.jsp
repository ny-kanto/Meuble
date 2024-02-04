<%-- 
    Document   : etatStock
    Created on : 11 janv. 2024, 17:49:42
    Author     : nykan
--%>



<%@page contentType="text/html" pageEncoding="UTF-8" %>
<%@page import="model.*, java.util.List" %>
<%@ include file="header.jsp" %>
        <% List<VEtatStock> listves = (List<VEtatStock>) request.getAttribute("listves"); %>
        <div class="container-fluid">
            <!-- ========== title-wrapper start ========== -->
            <div class="title-wrapper pt-30">
              <div class="row align-items-center">
                <div class="col-md-6">
                  <div class="title">
                    <h2>Etat de Stock</h2>
                  </div>
                </div>
                <!-- end col -->
                <div class="col-md-6">
                  <div class="breadcrumb-wrapper">
                    <nav aria-label="breadcrumb">
                      <ol class="breadcrumb">
                        <li class="breadcrumb-item">
                          <a href="#0">Dashboard</a>
                        </li>
                        <li class="breadcrumb-item active" aria-current="page">
                          Etat
                        </li>
                      </ol>
                    </nav>
                  </div>
                </div>
                <!-- end col -->
              </div>
              <!-- end row -->
            </div>
            <!-- ========== title-wrapper end ========== -->
  
            <div class="tables-wrapper">
              <div class="row">
                <div class="col-lg-12">
                  <div class="card-style mb-30">
                    <h3 class="mb-10">Etat de Stock</h3>
                    <div class="table-wrapper table-responsive">
                      <table class="table">
                        <thead>
                          <tr>
                            <th class="lead-info">
                              <h6>Materiel</h6>
                            </th>
                            <th class="lead-email">
                              <h6>Quantité Entrée</h6>
                            </th>
                            <th class="lead-email">
                                <h6>Quantité Sortie</h6>
                              </th>
                            <th class="lead-email">
                                <h6>Reste</h6>
                            </th>
                          </tr>
                          <!-- end table row-->
                        </thead>
                        <tbody>
                            <% for(VEtatStock ves : listves) { %>
                          <tr>
                            <td class="min-width">
                              <div class="lead">
                                <div class="lead-text">
                                  <p><%= ves.getNommateriel() %></p>
                                </div>
                              </div>
                            </td>
                            <td class="min-width">
                              <p><%= ves.getSommeentree() %></p>
                            </td>
                            <td class="min-width">
                                <p><%= ves.getSommesortie() %></p>
                            </td>
                            <td class="min-width">
                                <p><%= ves.getReste() %></p>
                            </td>
                          </tr>
                          <% } %>
                          <!-- end table row -->
                        </tbody>
                      </table>
                      <!-- end table -->
                    </div>
                  </div>
                  <!-- end card -->
              </div>
              <!-- end col -->
            </div>
            <!-- end row -->
          </div>
<%@ include file="footer.jsp" %>
