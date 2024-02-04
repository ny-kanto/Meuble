<%-- 
    Document   : meubleMaterielSearch
    Created on : 8 janv. 2024, 23:37:07
    Author     : nykan
--%>


<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="model.*, java.util.List" %>
<%@ include file="header.jsp" %>
        <% List<Materiel> listm = (List<Materiel>) request.getAttribute("listm");
            List<VMaterielMeuble> listvmm = (List<VMaterielMeuble>) request.getAttribute("listvmm"); %>
                <div class="container-fluid">
                    <!-- ========== title-wrapper start ========== -->
                    <div class="title-wrapper pt-30">
                      <div class="row align-items-center">
                        <div class="col-md-6">
                          <div class="title">
                            <h2>Liste des Meubles pour un Matériel</h2>
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
                                  Liste
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
                            <form action="MeubleMaterielSearch" method="post">
                                <div class="select-style-1">
                                    <label>Matériel</label>
                                    <div class="select-position">
                                      <select name="materiel" required>
                                        <option value="">Sélectionnez une matériel</option>
                                        <% for(Materiel materiel : listm) { %>
                                            <option value="<%= materiel.getId() %>"><%= materiel.getNom() %></option>
                                            <% } %>
                                      </select>
                                    </div>
                                </div>
                                <div class="mb-4">
                                    <button class="btn btn-primary" type="submit">Voir</button>
                                </div>
                            </form>
                            <h3 class="mb-10">Liste des Meubles</h3>
                            <div class="table-wrapper table-responsive">
                                <table class="table">
                                <thead>
                                    <tr>
                                    <th class="lead-info">
                                        <h6>Nom</h6>
                                    </th>
                                    <th class="lead-email">
                                        <h6>Volume</h6>
                                    </th>
                                    <th class="lead-info">
                                        <h6>Quantite</h6>
                                    </th>
                                    </tr>
                                    <!-- end table row-->
                                </thead>
                                <tbody>
                                    <% for(VMaterielMeuble vmm : listvmm) { %>
                                    <tr>
                                    <td class="min-width">
                                        <div class="lead">
                                        <div class="lead-text">
                                            <p><%= vmm.getNommeuble() %></p>
                                        </div>
                                        </div>
                                    </td>
                                    <td class="min-width">
                                        <p><%= vmm.getNomvolume() %></p>
                                    </td>
                                    <td class="min-width">
                                        <p><%= vmm.getQte() %></p>
                                    </td>
                                    </tr>
                                    <% } %>
                                    <!-- end table row -->
                                </tbody>
                                </table>
                        <!-- end table -->
                      </div>
                        </div>
                    </div>
                </div>

        <%@ include file="footer.jsp" %>
