<%-- 
    Document   : experienceUpdate
    Created on : 29 janv. 2024, 15:31:04
    Author     : nykan
--%>


<%@page contentType="text/html" pageEncoding="UTF-8" %>
<%@page import="model.*" %>
<%@ include file="header.jsp" %>
        <% int idexperience = (int) request.getAttribute("idexperience"); %>
        <!-- <div class="section section-md pt-4">
            <div class="container">
                <div class="row justify-content-center">
                    <div class="col-lg-6 border">
                        <h2 class="h5 mb-4">Modification d'une experience</h2>
                        <form action="ExperienceUpdate" method="post">
                            <input type="hidden" name="idexperience" value="<%= idexperience %>">
                            <div class="mb-3">
                                <label class="my-1 me-2" for="inlineFormCustomSelectPref">Nom</label>
                                <input type="text" name="nom" id="nom" class="form-input">
                            </div>
                            <div class="mb-3">
                                <label class="my-1 me-2" for="inlineFormCustomSelectPref">Annee minimum</label>
                                <input type="number" name="anneemin" id="anneemin" class="form-input">
                            </div>
                            <div class="mb-3">
                                <label class="my-1 me-2" for="inlineFormCustomSelectPref">Annee maximum</label>
                                <input type="number" name="anneemax" id="anneemax" class="form-input">
                            </div>
                            <div class="mb-3">
                                <label class="my-1 me-2" for="inlineFormCustomSelectPref">Salaire multiplicateur</label>
                                <input type="text" name="salairemulti" id="salairemulti" class="form-input">
                            </div>
                            <div class="mb-4">
                                <button class="btn btn-primary" type="submit">Valider</button>
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
              <h2>Modification d'une experience</h2>
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
                  <li class="breadcrumb-item"><a href="#0">Matériel</a></li>
                  <li class="breadcrumb-item active" aria-current="page">
                    Achat
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
                  <form action="ExperienceUpdate" method="post">
                    <h6 class="mb-25">Modification d'une experience</h6>
                    <!-- end input -->
                    <input type="hidden" name="idexperience" value="<%= idexperience %>">
                    <div class="input-style-1">
                        <label>Nom</label>
                        <input type="text" placeholder="Nom" name="nom" required />
                      </div>
                    <div class="input-style-1">
                      <label>Année Minimum</label>
                      <input type="text" placeholder="Année Minimum" name="anneemin" required />
                    </div>
                    <div class="input-style-1">
                        <label>Année Maximum</label>
                        <input type="text" placeholder="Année Maximum" name="anneemax" required />
                      </div>
                    <div class="input-style-1">
                        <label>Salaire multiplicateur</label>
                        <input type="text" placeholder="Salaire multiplicateur" name="salairemulti" required />
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
