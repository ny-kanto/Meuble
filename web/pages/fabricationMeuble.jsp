<%-- 
    Document   : fabricationMeuble
    Created on : 11 janv. 2024, 15:21:09
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
                          <h2>Fabrication Meuble</h2>
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
                                Fabrication
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
            
                  <% List<Meuble> listmeu = (List<Meuble>) request.getAttribute("listmeu");
                    List<Volume> listv = (List<Volume>) request.getAttribute("listv"); %>
                    <div class="form-elements-wrapper">
                        <div class="row">
                          <div class="col-lg-0">
                            <!-- input style start -->
                            <div class="card-style mb-30">
                              <form action="FabricationMeubleInsert" method="post">
                                <h6 class="mb-25">Fabrication de Meuble</h6>
                                <!-- end input -->
                                <div class="select-style-1">
                                  <label>Meuble</label>
                                  <div class="select-position">
                                    <select name="meuble" required>
                                      <option value="">Sélectionnez une Meuble</option>
                                      <% for(Meuble meuble : listmeu) { %>
                                        <option value="<%= meuble.getId() %>"><%= meuble.getNom() %></option>
                                        <% } %>
                                    </select>
                                  </div>
                                </div>
                                <div class="select-style-1">
                                    <label>Volume</label>
                                    <div class="select-position">
                                      <select name="volume" required>
                                        <option value="">Sélectionnez un Volume</option>
                                        <% for(Volume v : listv) { %>
                                            <option value="<%= v.getId() %>"><%= v.getNom() %></option>
                                            <% } %>
                                      </select>
                                    </div>
                                  </div>
                                <div class="input-style-1">
                                  <label>Quantité</label>
                                  <input type="text" placeholder="Quantité" name="quantite" required />
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
