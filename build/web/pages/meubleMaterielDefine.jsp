<%-- 
    Document   : meubleMaterielDefine
    Created on : 8 janv. 2024, 20:57:28
    Author     : nykan
--%>


<%@page contentType="text/html" pageEncoding="UTF-8" %>
<%@page import="model.*, java.util.List" %>
<%@ include file="header.jsp" %>
        <% List<VStyleMateriel> listvsm = (List<VStyleMateriel>) request.getAttribute("listvsm");
                        List<Volume> listv = (List<Volume>) request.getAttribute("listv");
                        String idmeuble = (String) request.getAttribute("idmeuble"); %>
        <!-- <div class="section section-md pt-4">
            <div class="container">
                <div class="row justify-content-center">
                    <div class="col-lg-6 border">
                        <h2 class="h5 mb-4">Definir la quantite des materiels pour une meuble</h2>
                        <form action="MeubleMaterielInsert" method="post">
                            <div class="mb-3">
                                <input type="hidden" name="idmeuble" value="<%= idmeuble %>">
                                <label class="my-1 me-2"
                                       for="inlineFormCustomSelectPref">Volume</label>
                                <select class="form-select" id="volume" name="volume"
                                        aria-label="Default select example">
                                    <option selected>Selectionnez un volume</option>
                                    <% for(Volume volume : listv) { %>
                                    <option value="<%= volume.getId() %>">
                                        <%= volume.getNom() %>
                                    </option>
                                    <% } %>
                                </select>
                            </div>
                            <% for(VStyleMateriel vsm : listvsm) { %>
                            <div class="form-check">
                                <input class="form-check-input" type="hidden" name="materielCheckbox" value="<%= vsm.getIdmateriel() %>"
                                       id="<%= "checkbox_" + vsm.getIdmateriel() %>">
                                <label class="form-check-label" for="<%= "checkbox_" + vsm.getIdmateriel() %>"><%= vsm.getNommateriel() %></label>
                                <input type="text" name="<%= "materielInput_" + vsm.getIdmateriel() %>" class="form-control" id="<%= "input_" + vsm.getIdmateriel() %>">
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
              <h2>Définir la Quantité des Matériaux pour une Meuble</h2>
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
                    Quantité Matériel
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
                    <h6 class="mb-25">Définir la Quantité des Matériaux pour une Meuble</h6>
                    <!-- end input -->
                    <input type="hidden" name="idmeuble" value="<%= idmeuble %>">
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
                    <% for(VStyleMateriel vsm : listvsm) { %>
                        <div class="input-style-1">
                            <label><%= vsm.getNommateriel() %></label>
                            <input class="form-check-input" type="hidden" name="materielCheckbox" value="<%= vsm.getIdmateriel() %>">
                            <input type="text" placeholder="<%= vsm.getNommateriel() %>" name="<%= "materielInput_" + vsm.getIdmateriel() %>" required />
                        </div>
                    <% } %>
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
