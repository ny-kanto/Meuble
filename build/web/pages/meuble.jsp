<%-- 
    Document   : meuble
    Created on : 8 janv. 2024, 20:29:44
    Author     : nykan
--%>


<%@page contentType="text/html" pageEncoding="UTF-8" %>
<%@page import="model.*, java.util.List" %>
<%@ include file="header.jsp" %>
        <% List<Categorie> listcat = (List<Categorie>) request.getAttribute("listcat");
        List<model.Style> lists = (List<model.Style>) request.getAttribute("lists"); %>

<!-- ========== tab components start ========== -->
<section class="tab-components">
    <div class="container-fluid">
      <!-- ========== title-wrapper start ========== -->
      <div class="title-wrapper pt-30">
        <div class="row align-items-center">
          <div class="col-md-6">
            <div class="title">
              <h2>Insertion d'un Meuble</h2>
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
                  <li class="breadcrumb-item"><a href="#0">Meuble</a></li>
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
        <div class="form-elements-wrapper">
            <div class="row">
              <div class="col-lg-0">
                <!-- input style start -->
                <div class="card-style mb-30">
                  <form action="AchatMaterielInsert" method="post">
                    <h6 class="mb-25">Insertion d'un Meuble</h6>
                    <!-- end input -->
                    <div class="input-style-1">
                        <label>Nom</label>
                        <input type="text" placeholder="Nom" name="nom" required />
                      </div>
                    <div class="select-style-1">
                      <label>Catégorie</label>
                      <div class="select-position">
                        <select name="categorie" required>
                          <option value="">Sélectionnez une Catégorie</option>
                          <% for(Categorie categorie : listcat) { %>
                            <option value="<%= categorie.getId() %>"><%= categorie.getNom() %></option>
                            <% } %>
                        </select>
                      </div>
                    </div>
                    <div class="select-style-1">
                        <label>Style</label>
                        <div class="select-position">
                          <select name="style" required>
                            <option value="">Sélectionnez une Style</option>
                            <% for(Style style : lists) { %>
                                <option value="<%= style.getId() %>"><%= style.getNom() %></option>
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
