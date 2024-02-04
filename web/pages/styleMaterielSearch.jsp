<%-- 
    Document   : styleMaterielSearch
    Created on : 8 janv. 2024, 20:25:56
    Author     : nykan
--%>


<%@page contentType="text/html" pageEncoding="UTF-8" %>
<%@page import="model.*, java.util.List" %>
<%@ include file="header.jsp" %>
        <% List<model.Style> lists = (List<model.Style>) request.getAttribute("lists");
            List<VStyleMateriel> listvms = (List<VStyleMateriel>) request.getAttribute("listvms"); %>
                <div class="container-fluid">
                    <!-- ========== title-wrapper start ========== -->
                    <div class="title-wrapper pt-30">
                      <div class="row align-items-center">
                        <div class="col-md-6">
                          <div class="title">
                            <h2>Liste des Matériaux pour un Style</h2>
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
                            <form action="StyleMaterielSearch" method="post">
                                <div class="select-style-1">
                                    <label>Style</label>
                                    <div class="select-position">
                                      <select name="style" required>
                                        <option value="">Sélectionnez une style</option>
                                        <% for(Style style : lists) { %>
                                            <option value="<%= style.getId() %>"><%= style.getNom() %></option>
                                            <% } %>
                                      </select>
                                    </div>
                                </div>
                                <div class="mb-4">
                                    <button class="btn btn-primary" type="submit">Voir</button>
                                </div>
                            </form>
                            <h3 class="mb-10">Liste des Matériaux</h3>
                            <div class="table-wrapper table-responsive">
                                <table class="table">
                                <thead>
                                    <tr>
                                    <th class="lead-info">
                                        <h6>Nom</h6>
                                    </th>
                                    </tr>
                                    <!-- end table row-->
                                </thead>
                                <tbody>
                                    <% for(VStyleMateriel vms : listvms) { %>
                                    <tr>
                                    <td class="min-width">
                                        <div class="lead">
                                        <div class="lead-text">
                                            <p><%= vms.getNommateriel() %></p>
                                        </div>
                                        </div>
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