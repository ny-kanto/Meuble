<%-- 
    Document   : volumePersonne
    Created on : 1 févr. 2024, 21:37:18
    Author     : nykan
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>

<%@page import="model.*, java.util.List" %>
<%@ include file="header.jsp" %>
<!-- ========== tab components start ========== -->
<section class="tab-components">
    <div class="container-fluid">
      <!-- ========== title-wrapper start ========== -->
      <div class="title-wrapper pt-30">
        <div class="row align-items-center">
          <div class="col-md-6">
            <div class="title">
              <h2>Personne pour Volume</h2>
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
                  <li class="breadcrumb-item"><a href="#0">Volume</a></li>
                  <li class="breadcrumb-item active" aria-current="page">
                    Personne
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

      <% List<Volume> listv = (List<Volume>) request.getAttribute("listv");
        List<Personne> listp = (List<Personne>) request.getAttribute("listp"); %>
        <div class="form-elements-wrapper">
            <div class="row">
              <div class="col-lg-0">
                <!-- input style start -->
                <div class="card-style mb-30">
                  <form action="VolumePersonneInsert" method="post">
                    <h6 class="mb-25">Personne pour Volume</h6>
                    <div class="select-style-1">
                      <label>Volume</label>
                      <div class="select-position">
                        <select name="volume" required>
                          <option value="">Sélectionnez une Volume</option>
                          <% for(Volume volume : listv) { %>
                            <option value="<%= volume.getId() %>"><%= volume.getNom() %></option>
                           <% } %>
                        </select>
                      </div>
                    </div>
                    <div class="select-style-1">
                        <label>Personne</label>
                        <div class="select-position">
                          <select name="personne" required>
                            <option value="">Sélectionnez une Personne</option>
                            <% for(Personne personne : listp) { %>
                              <option value="<%= personne.getId() %>"><%= personne.getNom() %></option>
                            <% } %>
                          </select>
                        </div>
                      </div>
                    <!-- end input -->
                    <div class="mb-4">
                      <button class="btn btn-primary" type="submit">Inserer</button>
                  </div>
                  </form>
                  <!-- end input -->
                </div>
                <!-- end card -->
              </div>
            </div>
        </div>
<%@ include file="footer.jsp" %>
