<%-- 
    Document   : personne
    Created on : 23 janv. 2024, 14:48:05
    Author     : nykan
--%>


<%@page contentType="text/html" pageEncoding="UTF-8" %>
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
              <h2>Insertion Employé</h2>
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
                  <li class="breadcrumb-item"><a href="#0">Employé</a></li>
                  <li class="breadcrumb-item active" aria-current="page">
                    Insertion
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

        <% List<Poste> listp = (List<Poste>) request.getAttribute("listp"); %>
        <div class="form-elements-wrapper">
            <div class="row">
              <div class="col-lg-0">
                <!-- input style start -->
                <div class="card-style mb-30">
                  <form action="PersonneInsert" method="post">
                    <h6 class="mb-25">Insertion d'un Employé</h6>
                    <div class="input-style-1">
                      <label>Nom</label>
                      <input type="text" placeholder="Nom" name="nom" required />
                    </div>
                    <!-- end input -->
                    <div class="select-style-1">
                      <label>Poste</label>
                      <div class="select-position">
                        <select name="poste" required>
                          <option value="">Sélectionnez une Poste</option>
                          <% for(Poste p : listp) { %>
                            <option value="<%= p.getId() %>"><%= p.getNom() %></option>
                            <% } %>
                        </select>
                      </div>
                    </div>
                    <!-- end input -->
                    <div class="input-style-1">
                      <label>Date d'embauche</label>
                      <input type="date" name="dateembauche" required />
                    </div>
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
