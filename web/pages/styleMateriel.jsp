<%-- 
    Document   : styleMateriel.jsp
    Created on : 8 janv. 2024, 20:20:20
    Author     : nykan
--%>



<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="model.*, java.util.List" %>
<%@ include file="header.jsp" %>
        <% List<model.Style> lists = (List<model.Style>) request.getAttribute("lists");
                        List<Materiel> listm = (List<Materiel>) request.getAttribute("listm"); %>
        <!-- <div class="section section-md pt-4">
            <div class="container">
                <div class="row justify-content-center">
                    <div class="col-lg-6 border">
                        <h2 class="h5 mb-4">Definir les materiels pour une style</h2>
                        <form action="StyleMaterielInsert" method="post">
                            <div class="mb-3">
                                <label class="my-1 me-2"
                                       for="inlineFormCustomSelectPref">Style</label>
                                <select class="form-select" id="style" name="style"
                                        aria-label="Default select example">
                                    <option selected>Selectionnez un style</option>
                                    <% for(Style style : lists) { %>
                                    <option value="<%= style.getId() %>">
                                        <%= style.getNom() %>
                                    </option>
                                    <% } %>
                                </select>
                            </div>
                            <% for(Materiel materiel : listm) { %>
                            <div class="form-check">
                                <input class="form-check-input" type="checkbox" name="materielCheckbox" value="<%= materiel.getId() %>"
                                       id="<%= "checkbox_" + materiel.getId() %>">
                               <label class="my-1 me-2"
                                       for="form-check-input"><%= materiel.getNom() %></label>
                            </div>
                            <% } %>
                            <div class="mb-4">
                                <button class="btn btn-primary"
                                        type="submit">Valider</button>
                            </div>
                        </form>
                    </div>
                </div>
            </div>
        </div> -->

        
<!-- ========== tab components start ========== -->
<section class="tab-components">
    <div class="container-fluid">
      <!-- ========== title-wrapper start ========== -->
      <div class="title-wrapper pt-30">
        <div class="row align-items-center">
          <div class="col-md-6">
            <div class="title">
              <h2>Définir les Matériaux pour une Style</h2>
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
                    Matériel pour Style
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
                  <form action="StyleMaterielInsert" method="post">
                    <h6 class="mb-25">Définir les Matériaux pour une Style</h6>
                    <!-- end input -->
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
                    <% for(Materiel materiel : listm) { %>
                        <div class="form-check checkbox-style mb-20">
                            <input class="form-check-input" type="checkbox" value="<%= materiel.getId() %>" id="<%= "checkbox_" + materiel.getId() %>" />
                            <label class="form-check-label" for="<%= "checkbox_" + materiel.getId() %>"><%= materiel.getNom() %></label>
                          </div>
                    <% } %>
                    <!-- end input -->
                    <div class="mb-4">
                      <button class="btn btn-primary" type="submit">Definir</button>
                  </div>
                  </form>
                  <!-- end input -->
                </div>
                <!-- end card -->
              </div>
            </div>
        </div>
        <%@ include file="footer.jsp" %>
