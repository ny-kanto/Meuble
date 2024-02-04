<%-- 
    Document   : vente
    Created on : 25 janv. 2024, 14:49:33
    Author     : nykan
--%>


<%@page contentType="text/html" pageEncoding="UTF-8" %>
<%@page import="model.*, java.util.List" %>
<%@ include file="header.jsp" %>
        <% List<Volume> listv = (List<Volume>) request.getAttribute("listv");
        List<Meuble> listm = (List<Meuble>) request.getAttribute("listm");
        List<Client> listclient = (List<Client>) request.getAttribute("listclient"); %>
        <!-- <div class="section section-md pt-4">
            <div class="container">
                <div class="row justify-content-center">
                    <div class="col-lg-6 border">
                        <h2 class="h5 mb-4">Faire une vente</h2>
                        <form action="VenteInsert" method="post">
                            <div class="mb-3">
                                <label class="my-1 me-2" for="inlineFormCustomSelectPref">Client</label>
                                <select class="form-select" id="client" name="client" aria-label="Default select example">
                                    <option selected>Selectionnez un client</option>
                                    <% for(Client client : listclient) { %>
                                    <option value="<%= client.getId() %>"><%= client.getNom() %> <%= client.getPrenom() %></option>
                                    <% } %>
                                </select>
                            </div>
                            <div class="mb-3">
                                <label class="my-1 me-2" for="inlineFormCustomSelectPref">Meuble</label>
                                <select class="form-select" id="meuble" name="meuble" aria-label="Default select example">
                                    <option selected>Selectionnez un meuble</option>
                                    <% for(Meuble meuble : listm) { %>
                                    <option value="<%= meuble.getId() %>"><%= meuble.getNom() %></option>
                                    <% } %>
                                </select>
                            </div>
                            <div class="mb-3">
                                <label class="my-1 me-2" for="inlineFormCustomSelectPref">Volume</label>
                                <select class="form-select" id="volume" name="volume" aria-label="Default select example">
                                    <option selected>Selectionnez un volume</option>
                                    <% for(Volume volume : listv) { %>
                                    <option value="<%= volume.getId() %>"><%= volume.getNom() %></option>
                                    <% } %>
                                </select>
                            </div>
                            <div class="mb-3">
                                <label class="my-1 me-2" for="inlineFormCustomSelectPref">Quantite</label>
                                <input type="text" name="qte" id="qte" class="form-input">
                            </div>
                            <div class="mb-3">
                                <label class="my-1 me-2" for="inlineFormCustomSelectPref">Date du vente</label>
                                <input type="date" name="datevente" id="datevente" class="form-input">
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
              <h2>Insertion d' une Vente</h2>
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
                  <li class="breadcrumb-item"><a href="#0">Vente</a></li>
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
                  <form action="VenteInsert" method="post">
                    <h6 class="mb-25">Insertion d' une Vente</h6>                    
                    <div class="select-style-1">
                      <label>Client</label>
                      <div class="select-position">
                        <select name="client" required>
                          <option value="">Sélectionnez un(e) Client(e)</option>
                          <% for(Client client : listclient) { %>
                            <option value="<%= client.getId() %>"><%= client.getNom() %> <%= client.getPrenom() %></option>
                            <% } %>
                        </select>
                      </div>
                    </div>
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
                    <div class="input-style-1">
                        <label>Quantité</label>
                        <input type="text" placeholder="Quantité" name="quantite" required />
                    </div>
                    <div class="input-style-1">
                        <label>Date du Vente</label>
                        <input type="date" name="datevente" required />
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