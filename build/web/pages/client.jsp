<%-- 
    Document   : client.jsp
    Created on : 25 janv. 2024, 14:58:34
    Author     : nykan
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ include file="header.jsp" %>
<!-- ========== tab components start ========== -->
<section class="tab-components">
    <div class="container-fluid">
      <!-- ========== title-wrapper start ========== -->
      <div class="title-wrapper pt-30">
        <div class="row align-items-center">
          <div class="col-md-6">
            <div class="title">
              <h2>Insertion d'un Client</h2>
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
                  <li class="breadcrumb-item"><a href="#0">Client</a></li>
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
                  <form action="ClientInsert" method="post">
                    <h6 class="mb-25">Insertion d'un Client</h6>
                    <div class="input-style-1">
                      <label>Nom</label>
                      <input type="text" placeholder="Nom" name="nom" required />
                    </div>
                    <div class="input-style-1">
                        <label>Prénom</label>
                        <input type="text" placeholder="Prénom" name="prenom" required />
                      </div>
                    <!-- end input -->
                    <div class="select-style-1">
                      <label>Genre</label>
                      <div class="select-position">
                        <select name="genre" required>
                            <option value="">Sélectionnez un Genre</option>
                            <option value="1">Homme</option>
                            <option value="11">Femme</option>
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