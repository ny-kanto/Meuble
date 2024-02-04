<%-- 
    Document   : index
    Created on : 11 janv. 2024, 15:38:35
    Author     : nykan
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.util.List" %>
<%@ include file="../pages/header.jsp" %>

<% String erreurMessage = (String) request.getAttribute("erreurMessage"); %>
<!-- ========== section start ========== -->
<section class="section">
    <div class="container-fluid">
      <!-- ========== title-wrapper start ========== -->
      <div class="title-wrapper pt-30">
        <div class="row align-items-center">
          <div class="col-md-6">
            <div class="title">
              <h2 class="alert-heading text-danger"><%= erreurMessage %></h2>
            </div>
          </div>
          <!-- end col -->
          <% List<String> listmat = (List<String>) request.getAttribute("listmat");
            List<Double> qte = (List<Double>) request.getAttribute("qte"); %>
          <div class="col-md-6">
            <div class="breadcrumb-wrapper">
              <nav aria-label="breadcrumb">
                <ol class="breadcrumb">
                  <li class="breadcrumb-item">
                    <a href="#0">Dashboard</a>
                  </li>
                  <li class="breadcrumb-item active" aria-current="page">
                    Error
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
              <h3 class="mb-10">Liste des matériaux</h3>
              <div class="table-wrapper table-responsive">
                <table class="table">
                  <thead>
                    <tr>
                      <th class="lead-email">
                        <h6>Nom</h6>
                      </th>
                      <th class="lead-email">
                          <h6>Quantité insuffisante</h6>
                        </th>
                    </tr>
                    <!-- end table row-->
                  </thead>
                  <tbody>
                      <% for(int i = 0; i < listmat.size(); i++) { %>
                    <tr>
                      <td class="min-width">
                        <div class="lead">
                          <div class="lead-text">
                            <p><%= listmat.get(i) %></p>
                          </div>
                        </div>
                      </td>
                      <td class="min-width">
                        <p><%= qte.get(i) %></p>
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
    <!-- end container -->
  </section>
  <!-- ========== section end ========== -->
<%@ include file="../pages/footer.jsp" %>