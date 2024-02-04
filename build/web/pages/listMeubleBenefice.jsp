<%-- 
    Document   : listMeubleBenefice
    Created on : 2 févr. 2024, 08:37:13
    Author     : nykan
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="model.*, java.util.List" %>
<%@ include file="header.jsp" %>
        <% List<VBenefice> listvb = (List<VBenefice>) request.getAttribute("listvb"); %>
        <div class="container-fluid">
            <!-- ========== title-wrapper start ========== -->
            <div class="title-wrapper pt-30">
                <div class="row align-items-center">
                <div class="col-md-6">
                    <div class="title">
                    <h2>Liste des Meubles Bénéfices</h2>
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
                    <form action="Benefice" method="post">
                        <div class="input-style-1">
                            <label>Bénéfice minimum</label>
                            <input type="text" placeholder="Bénéfice minimum" name="prix_min" />
                          </div>
                          <div class="input-style-1">
                            <label>Bénéfice maximum</label>
                            <input type="text" placeholder="Bénéfice maximum" name="prix_max" />
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
                                <h6>Prix de Vente</h6>
                            </th>
                            <th class="lead-info">
                                <h6>Prix de Revient</h6>
                            </th>
                            <th class="lead-info">
                                <h6>Bénéfice</h6>
                            </th>
                            </tr>
                            <!-- end table row-->
                        </thead>
                        <tbody>
                            <% for(VBenefice vb : listvb) { %>
                            <tr>
                            <td class="min-width">
                                <div class="lead">
                                <div class="lead-text">
                                    <p><%= vb.getNommeuble() %></p>
                                </div>
                                </div>
                            </td>
                            <td class="min-width">
                                <p><%= vb.getNomvolume() %></p>
                            </td>
                            <td class="min-width">
                                <p><%= vb.getPrixvente() %></p>
                            </td>
                            <td class="min-width">
                                <p><%= vb.getCouttotal() %></p>
                            </td>
                            <td class="min-width">
                                <p><%= vb.getBenefice() %></p>
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