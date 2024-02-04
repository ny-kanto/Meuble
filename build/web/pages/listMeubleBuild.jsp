<%-- 
    Document   : listMeubleBuild
    Created on : 11 janv. 2024, 10:59:03
    Author     : nykan
--%>

<%@page contentType="text/html" pageEncoding="UTF-8" %>
<%@page import="model.*, java.util.List" %>
<%@ include file="header.jsp" %>
        <% List<VMeublePrix> listvmp = (List<VMeublePrix>) request.getAttribute("listvmp");
            List<Meuble> listm = (List<Meuble>) request.getAttribute("listm"); %>
        <div class="container-fluid">
            <!-- ========== title-wrapper start ========== -->
            <div class="title-wrapper pt-30">
                <div class="row align-items-center">
                <div class="col-md-6">
                    <div class="title">
                    <h2>Liste des Meubles Fabriqués</h2>
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
                        <li class="breadcrumb-item active" aria-current="page">
                            Liste
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

            <div class="tables-wrapper">
                <div class="row">
                  <div class="col-lg-12">
                    <div class="card-style mb-30">
                    <form action="ListMeubleBuild" method="post">
                        <div class="input-style-1">
                            <label>Prix minimum</label>
                            <input type="text" placeholder="Prix minimum" name="prix_min" />
                          </div>
                          <div class="input-style-1">
                            <label>Prix maximum</label>
                            <input type="text" placeholder="Prix maximum" name="prix_max" />
                          </div>
                        <div class="mb-4">
                            <button class="btn btn-primary" type="submit">Filtrer</button>
                        </div>
                    </form>
                    <h3 class="mb-10">Liste des Meubles</h3>
                    <div class="table-wrapper table-responsive">
                        <table class="table">
                        <thead>
                            <tr>
                            <th class="lead-info">
                                <h6>Nom</h6>
                            </th>
                            <th class="lead-email">
                                <h6>Volume</h6>
                            </th>
                            <th class="lead-info">
                                <h6>Prix</h6>
                            </th>
                            </tr>
                            <!-- end table row-->
                        </thead>
                        <tbody>
                            <% for(VMeublePrix vmp : listvmp) { %>
                            <tr>
                            <td class="min-width">
                                <div class="lead">
                                <div class="lead-text">
                                    <p><%= vmp.getNommeuble() %></p>
                                </div>
                                </div>
                            </td>
                            <td class="min-width">
                                <p><%= vmp.getNomvolume() %></p>
                            </td>
                            <td class="min-width">
                                <p><%= vmp.getSommefinale() %></p>
                            </td>
                            </tr>
                            <% } %>
                            <!-- end table row -->
                        </tbody>
                        </table>
                <!-- end table -->
              </div>
                </div>
            </div>
        <%@ include file="footer.jsp" %>
