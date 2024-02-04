<%-- 
    Document   : constructionVolume
    Created on : 31 janv. 2024, 17:39:12
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
              <h2>Nb Personne pour Volume</h2>
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
                    Nb Personne
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
                  <form action="ConstructionVolumeInsert" method="post">
                    <h6 class="mb-25">Nb Personne Volume</h6>
                    <div class="input-style-1">
                      <label>Nb Personne</label>
                      <input type="number" placeholder="Nb Personne" name="nbpersonne" required />
                    </div>
                    <div class="input-style-1">
                        <label>Multiplicateur</label>
                        <input type="text" placeholder="Multiplicateur" name="multi" required />
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
