<%-- 
    Document   : experience
    Created on : 29 janv. 2024, 14:35:49
    Author     : nykan
--%>


<%@page contentType="text/html" pageEncoding="UTF-8" %>
<%@page import="model.*, java.util.List" %>
<%@ include file="header.jsp" %>
        <% List<Experience> liste = (List<Experience>) request.getAttribute("liste"); %>

        <div class="container-fluid">
            <!-- ========== title-wrapper start ========== -->
            <div class="title-wrapper pt-30">
              <div class="row align-items-center">
                <div class="col-md-6">
                  <div class="title">
                    <h2>Liste des expériences</h2>
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
                    <h3 class="mb-10">Liste des expériences</h3>
                    <div class="table-wrapper table-responsive">
                      <table class="table">
                        <thead>
                          <tr>
                            <th class="lead-info">
                              <h6>Nom</h6>
                            </th>
                            <th class="lead-email">
                              <h6>Année minimum</h6>
                            </th>
                            <th class="lead-email">
                                <h6>Année maximum</h6>
                              </th>
                            <th class="lead-email">
                                <h6>Salaire multi</h6>
                            </th>
                          </tr>
                          <!-- end table row-->
                        </thead>
                        <tbody>
                            <% for(Experience e : liste) { %>
                          <tr>
                            <td class="min-width">
                              <div class="lead">
                                <div class="lead-text">
                                  <p><%= e.getNom() %></p>
                                </div>
                              </div>
                            </td>
                            <td class="min-width">
                              <p><%= e.getAnneemin() %></p>
                            </td>
                            <td class="min-width">
                                <p><%= e.getAnneemax() %></p>
                            </td>
                            <td class="min-width">
                                <p>x <%= e.getSalairemulti() %></p>
                            </td>
                            <td class="min-width">
                              <p>
                                <a href="ExperienceUpdate?idexperience=<%= e.getId() %>">
                                    <i class="lni lni-pencil"></i>                         
                                </a></p>
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