<%-- 
    Document   : personneExperience
    Created on : 23 janv. 2024, 15:40:25
    Author     : nykan
--%>

<%@page contentType="text/html" pageEncoding="UTF-8" %>
<%@page import="model.*, java.util.List" %>
<%@ include file="header.jsp" %>
        <% List<VPersonneExperience> listvpe = (List<VPersonneExperience>) request.getAttribute("listvpe");
            List<Experience> listexp = (List<Experience>) request.getAttribute("listexp");
            List<Poste> listp = (List<Poste>) request.getAttribute("listp"); %>
                <div class="container-fluid">
                    <!-- ========== title-wrapper start ========== -->
                    <div class="title-wrapper pt-30">
                      <div class="row align-items-center">
                        <div class="col-md-6">
                          <div class="title">
                            <h2>Liste des employés</h2>
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
                        <form action="PersonneExperience " method="post">
                            <div class="select-style-1">
                                <label>Poste</label>
                                <div class="select-position">
                                  <select name="poste">
                                    <option value="">Sélectionnez une poste</option>
                                    <% for(Poste p : listp) { %>
                                        <option value="<%= p.getId() %>"><%= p.getNom() %></option>
                                        <% } %>
                                  </select>
                                </div>
                            </div>
                            <div class="select-style-1">
                                <label>Expérience</label>
                                <div class="select-position">
                                  <select name="experience">
                                    <option value="">Selectionnez une expérience</option>
                                    <% for(Experience e : listexp) { %>
                                        <option value="<%= e.getId() %>"><%= e.getNom() %></option>
                                        <% } %>
                                  </select>
                                </div>
                            </div>
                            <div class="input-style-1">
                                <label>Salaire minimum</label>
                                <input type="text" placeholder="Salaire minimum" name="salaire_min" />
                              </div>
                              <div class="input-style-1">
                                <label>Salaire maximum</label>
                                <input type="text" placeholder="Salaire maximum" name="salaire_max" />
                              </div>
                            <div class="mb-4">
                                <button class="btn btn-primary" type="submit">Filtrer</button>
                            </div>
                        </form>
                        <h3 class="mb-10">Liste des employés</h3>
                        <div class="table-wrapper table-responsive">
                            <table class="table">
                            <thead>
                                <tr>
                                <th class="lead-info">
                                    <h6>Nom</h6>
                                </th>
                                <th class="lead-email">
                                    <h6>Poste</h6>
                                </th>
                                <th class="lead-info">
                                    <h6>Experience</h6>
                                </th>
                                <th class="lead-email">
                                    <h6>Salaire</h6>
                                </th>
                                </tr>
                                <!-- end table row-->
                            </thead>
                            <tbody>
                                <% for(VPersonneExperience vpe : listvpe) { %>
                                <tr>
                                <td class="min-width">
                                    <div class="lead">
                                    <div class="lead-text">
                                        <p><%= vpe.getNompersonne() %></p>
                                    </div>
                                    </div>
                                </td>
                                <td class="min-width">
                                    <p><%= vpe.getNomposte() %></p>
                                </td>
                                <td class="min-width">
                                    <p><%= vpe.getNomexperience() %></p>
                                </td>
                                <td class="min-width">
                                    <p><%= vpe.getSalaireexp() %></p>
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
        </div>
<%@ include file="footer.jsp" %>