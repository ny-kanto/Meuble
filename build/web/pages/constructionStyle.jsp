<%-- 
    Document   : constructionStyle
    Created on : 31 janv. 2024, 17:47:55
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
              <h2>Durée pour Style</h2>
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
                  <li class="breadcrumb-item"><a href="#0">Style</a></li>
                  <li class="breadcrumb-item active" aria-current="page">
                    Durée
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

      <% List<model.Style> lists = (List<model.Style>) request.getAttribute("lists"); %>
        <div class="form-elements-wrapper">
            <div class="row">
              <div class="col-lg-0">
                <!-- input style start -->
                <div class="card-style mb-30">
                  <form action="ConstructionStyleInsert" method="post">
                    <h6 class="mb-25">Durée pour Style</h6>
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
                    <div class="input-style-1">
                      <label>Durée</label>
                      <input type="text" placeholder="Durée" name="duree" required />
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
