<%-- 
    Document   : meubleVente
    Created on : 24 janv. 2024, 16:47:20
    Author     : nykan
--%>


<%@page contentType="text/html" pageEncoding="UTF-8" %>
<%@page import="model.*, java.util.List" %>
<%@ include file="header.jsp" %>
        <% List<Volume> listv = (List<Volume>) request.getAttribute("listv");
        List<Meuble> listm = (List<Meuble>) request.getAttribute("listm"); %>
<!-- ========== tab components start ========== -->
<section class="tab-components">
    <div class="container-fluid">
      <!-- ========== title-wrapper start ========== -->
      <div class="title-wrapper pt-30">
        <div class="row align-items-center">
          <div class="col-md-6">
            <div class="title">
              <h2>Prix de Vente d'un Meuble</h2>
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
                    Prix de Vente
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
                  <form action="MeubleVenteInsert" method="post">
                    <h6 class="mb-25">Prix de Vente d'un Meuble</h6>
                    <!-- end input -->
                    <div class="select-style-1">
                      <label>Meuble</label>
                      <div class="select-position">
                        <select name="meuble" required>
                          <option value="">Sélectionnez une Meuble</option>
                          <% for(Meuble m : listm) { %>
                            <option value="<%= m.getId() %>"><%= m.getNom() %></option>
                            <% } %>
                        </select>
                      </div>
                    </div>
                    <div class="select-style-1">
                        <label>Volume</label>
                        <div class="select-position">
                          <select name="volume" required>
                            <option value="">Sélectionnez une Volume</option>
                            <% for(Volume v : listv) { %>
                                <option value="<%= v.getId() %>"><%= v.getNom() %></option>
                                <% } %>
                          </select>
                        </div>
                    </div>
                    <div class="input-style-1">
                        <label>Prix de Vente</label>
                        <input type="text" placeholder="Prix de Vente" name="prixvente" required />
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
