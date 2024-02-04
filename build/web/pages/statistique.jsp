<%-- 
    Document   : statistique
    Created on : 25 janv. 2024, 15:20:16
    Author     : nykan
--%>

<%@page contentType="text/html" pageEncoding="UTF-8" %>
<%@page import="model.*, java.util.List, com.google.gson.Gson" %>
<%@ include file="header.jsp" %>
        <% List<VStatistique> listvs = (List<VStatistique>) request.getAttribute("listvs");
            List<Volume> listv = (List<Volume>) request.getAttribute("listv");
            List<Meuble> listm = (List<Meuble>) request.getAttribute("listm");
            int totalRecords = listvs.size(); %>
        <!-- ========== section start ========== -->
        <style>
          .red-bg {
            background-color: red;
        }        
        </style>
      <section class="section">
        <div class="container-fluid">
          <!-- ========== title-wrapper start ========== -->
          <div class="title-wrapper pt-30">
            <div class="row align-items-center">
              <div class="col-md-6">
                <div class="title">
                  <h2>Statistique de Vente</h2>
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
                        Stats
                      </li>
                    </ol>
                  </nav>
                </div>
              </div>
              <!-- end col -->
            </div>
            <!-- end row -->
          </div>
                    <div class="col-lg-0">
                        <div class="card-style mb-30">
                          <div class="title d-flex flex-wrap align-items-center justify-content-between">
                            <div class="left">
                              <h6 class="text-medium mb-2">Stats des Ventes</h6>
                            </div>
                            <div class="right">
                              <!-- end select -->
                            </div>
                          </div>
                          <!-- End Title -->
                          <div class="chart">
                            <div id="legend3">
                              <ul class="legend3 d-flex flex-wrap align-items-center mb-30">
                                <li>
                                  <div class="d-flex">
                                    <span class="bg-color primary-bg"> </span>
                                    <div class="text">
                                      <p class="text-sm text-success">
                                        <span class="text-dark">Homme</span>
                                      </p>
                                    </div>
                                  </div>
                                </li>
                                <li>
                                  <div class="d-flex">
                                    <span class="bg-color red-bg"></span>
                                    <div class="text">
                                      <p class="text-sm text-success">
                                        <span class="text-dark">Femme</span>
                                      </p>
                                    </div>
                                  </div>
                                </li>
                              </ul>
                            </div>
                            <canvas id="Chart3" style="width: 100%; height: 450px; margin-left: -35px;"></canvas>
                          </div>
                        </div>
                    </div>
                    <div class="tables-wrapper">
                        <div class="row">
                          <div class="col-lg-12">
                            <div class="card-style mb-30">
                            <form action="Statistique" method="post">
                                <div class="input-style-1">
                                    <label>Année*</label>
                                    <input type="text" placeholder="Année" name="annee" required/>
                                  </div>
                                <div class="select-style-1">
                                    <label>Meuble</label>
                                    <div class="select-position">
                                      <select name="meuble">
                                        <option value="">Sélectionnez une Meuble</option>
                                        <% for(Meuble m : listm) { %>
                                            <option value="<%= m.getId() %>"><%= m.getNom() %></option>
                                            <% } %>
                                      </select>
                                    </div>
                                </div>
                                <div class="select-style-1">
                                    <label>Volume*</label>
                                    <div class="select-position">
                                      <select name="volume" required>
                                        <option value="">Selectionnez une Volume</option>
                                        <% for(Volume v : listv) { %>
                                          <option value="<%= v.getId() %>"><%= v.getNom() %></option>
                                        <% } %>
                                      </select>
                                    </div>
                                </div>
                                <div class="mb-4">
                                    <button class="btn btn-primary" type="submit">Filtrer</button>
                                </div>
                            </form>
                            <div class="mb-5" id="results">
                            </div>
                            <div class="col-md-6 justify-content-center">
                                <div class="mt-4 mb-4 mt-sm-0">
                                    <h4 class="h6 font-weight-bold">Pagination with text-nav</h4>
                                </div>
                                <nav aria-label="Products page navigation" class="text-center justify-content-center">
                                    <ul class="pagination" id="pagination">
                                    </ul>
                                </nav>
                            </div>
                            </div>
                          </div>
                        </div>
                    </div>
                </div>
                </div>
            </div>
        </div>

        <script>
            function showPage(pageNumber) {
                var resultsDiv = document.getElementById('results');
                var paginationDiv = document.getElementById('pagination');
                
                var listvsjson = <%= new Gson().toJson(listvs) %>;
                var totalRecords = listvsjson.length;

                // Calculer le nombre total de pages
                var recordsPerPage = 6;
                var totalPages = Math.ceil(totalRecords / recordsPerPage);

                var startIndex = (pageNumber - 1) * recordsPerPage;
                var endIndex = Math.min(startIndex + recordsPerPage, totalRecords);

                var paginatedList = listvsjson.slice(startIndex, endIndex);

                // Construction de la chaîne HTML
                var htmlContent = '<h3 class="mb-10">Liste des employés</h3>';
                htmlContent += '<div class="table-wrapper table-responsive"><table class="table"><thead>';
                htmlContent += '<tr><th class="lead-info"><h6>Meuble</h6></th><th class="lead-email"><h6>Volume</h6></th><th class="lead-info"><h6>Quantité Homme</h6></th><th class="lead-email"><h6>Quantité Femme</h6></th><th class="lead-email"><h6>Mois</h6></th></tr></thead><tbody>';
                for (var i = 0; i < paginatedList.length; i++) {
                    console.log(paginatedList[i]);
                    htmlContent += '<tr>';
                    htmlContent += '<td class="min-width"><div class="lead"><div class="lead-text"><p>' + paginatedList[i].nommeuble + '</p></div></div></td>';
                    htmlContent += '<td class="min-width">' + paginatedList[i].nomvolume + '</td>';
                    htmlContent += '<td class="min-width">' + paginatedList[i].quantiteHomme + '</td>';
                    htmlContent += '<td class="min-width">' + paginatedList[i].quantiteFemme + '</td>';
                    htmlContent += '<td class="min-width">' + getNomMois(paginatedList[i].datevente) + '</td>';
                    htmlContent += '</tr>';
                }

                htmlContent += '</tbody></table></div>';
                resultsDiv.innerHTML = htmlContent;

                generatePagination(totalPages, pageNumber);
            }
            
            function getNomMois(numeroMois) {
                var nomsMois = ["Janvier", "Février", "Mars", "Avril", "Mai", "Juin", "Juillet", "Août", "Septembre", "Octobre", "Novembre", "Décembre"];
                
                if (numeroMois >= 1 && numeroMois <= 12) {
                    return nomsMois[numeroMois - 1];
                } else {
                    return "Mois invalide";
                }
            }

            function getGenre(codeGenre) {
                if (codeGenre == 1) {
                    return "Homme";
                } else if (codeGenre == 11) {
                    return "Femme";
                } else {
                    return "Genre invalide";
                }
            }

            var currentPage = 1;
            var recordsPerPage = 6;

            function previousPage() {
                if (currentPage > 1) {
                    currentPage--;
                    showPage(currentPage);
                }
            }

            function nextPage() {
                var totalRecords = <%= totalRecords %>;
                var totalPages = Math.ceil(totalRecords / recordsPerPage);

                if (currentPage < totalPages) {
                    currentPage++;
                    showPage(currentPage);
                }
            }

            function generatePagination(totalPages, currentPage) {
                var paginationDiv = document.getElementById('pagination');
                paginationDiv.innerHTML = '';

                paginationDiv.innerHTML += '<li class="page-item ' + (currentPage === 1 ? 'disabled' : '') + '">';
                paginationDiv.innerHTML += '<a class="page-link text-dark" href="#" onclick="previousPage()">Previous</a>';
                paginationDiv.innerHTML += '</li>';

                for (var i = 1; i <= totalPages; i++) {
                    paginationDiv.innerHTML += '<li class="page-item ' + (i === currentPage ? 'active' : '') + '">';
                    paginationDiv.innerHTML += '<a class="page-link text-dark" href="#" onclick="showPage(' + i + ')">' + i + '</a>';
                    paginationDiv.innerHTML += '</li>';
                }

                paginationDiv.innerHTML += '<li class="page-item ' + (currentPage === totalPages ? 'disabled' : '') + '">';
                paginationDiv.innerHTML += '<a class="page-link text-dark" href="#" onclick="nextPage()">Next</a>';
                paginationDiv.innerHTML += '</li>';
            }

            showPage(1);
        </script>
        <script src="assets/js/Chart.min.js"></script>
        <script>
            var listvsjson = <%= new Gson().toJson(listvs) %>;
            const ctx3 = document.getElementById("Chart3");
            const chart3 = new Chart(ctx3, {
                type: "line",
                data: {
                labels: [
                    "Jan",
                    "Fév",
                    "Mar",
                    "Avr",
                    "Mai",
                    "Jun",
                    "Jul",
                    "Aoû",
                    "Sep",
                    "Oct",
                    "Nov",
                    "Déc",
                ],
                datasets: [
                    {
                    label: "Homme",
                    backgroundColor: "transparent",
                    borderColor: "#365CF5",
                    data: [80, 120, 110, 100, 130, 150, 115, 145, 140, 130, 160, 210],
                    pointBackgroundColor: "transparent",
                    pointHoverBackgroundColor: "#365CF5",
                    pointBorderColor: "transparent",
                    pointHoverBorderColor: "#365CF5",
                    pointHoverBorderWidth: 3,
                    pointBorderWidth: 5,
                    pointRadius: 5,
                    pointHoverRadius: 8,
                    fill: false,
                    tension: 0.4,
                    },
                    {
                    label: "Femme",
                    backgroundColor: "transparent",
                    borderColor: "#FF0000",
                    data: [
                        120, 160, 150, 140, 165, 210, 135, 155, 170, 140, 130, 200,
                    ],
                    pointBackgroundColor: "transparent",
                    pointHoverBackgroundColor: "#FF0000",
                    pointBorderColor: "transparent",
                    pointHoverBorderColor: "#FF0000",
                    pointHoverBorderWidth: 3,
                    pointBorderWidth: 5,
                    pointRadius: 5,
                    pointHoverRadius: 8,
                    fill: false,
                    tension: 0.4,
                    },
                ],
                },
                options: {
                plugins: {
                    tooltip: {
                    intersect: false,
                    backgroundColor: "#fbfbfb",
                    titleColor: "#8F92A1",
                    bodyColor: "#272727",
                    titleFont: {
                        size: 16,
                        family: "Plus Jakarta Sans",
                        weight: "400",
                    },
                    bodyFont: {
                        family: "Plus Jakarta Sans",
                        size: 16,
                    },
                    multiKeyBackground: "transparent",
                    displayColors: false,
                    padding: {
                        x: 30,
                        y: 15,
                    },
                    borderColor: "rgba(143, 146, 161, .1)",
                    borderWidth: 1,
                    enabled: true,
                    },
                    title: {
                    display: false,
                    },
                    legend: {
                    display: false,
                    },
                },
                layout: {
                    padding: {
                    top: 0,
                    },
                },
                responsive: true,
                // maintainAspectRatio: false,
                legend: {
                    display: false,
                },
                scales: {
                    y: {
                        grid: {
                        display: false,
                        drawTicks: false,
                        drawBorder: false,
                        },
                        ticks: {
                        padding: 35,
                        },
                        max: 350,
                        min: 0,
                    },
                    x: {
                        grid: {
                        drawBorder: false,
                        color: "rgba(143, 146, 161, .1)",
                        drawTicks: false,
                        zeroLineColor: "rgba(143, 146, 161, .1)",
                        },
                        ticks: {
                        padding: 20,
                        },
                    },
                },
                },
            });
            // Supprimer les données existantes
            chart3.data.datasets[0].data = [];
            chart3.data.datasets[1].data = [];
          
            // Filtrer et mapper les données pour chaque genre
            const hommesData = listvsjson.map(item => item.quantiteHomme);
            const femmesData = listvsjson.map(item => item.quantiteFemme);

            // Ajouter les nouvelles données
            chart3.data.datasets[0].data = hommesData;
            chart3.data.datasets[1].data = femmesData;

            // Mettre à jour le graphe
            chart3.update();
</script>
<%@ include file="footer.jsp" %>

