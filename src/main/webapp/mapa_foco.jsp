<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="br">
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <!-- Meta, title, CSS, favicons, etc. -->
        <meta charset="utf-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1">

        <title>Sistema de Controle de Endemias</title>

         <!-- Bootstrap -->
	    <link href="vendors/bootstrap/dist/css/bootstrap.min.css" rel="stylesheet">
	    <!-- Bootstrap select -->
	  	<link href="css/bootstrap-select.min.css" rel="stylesheet">
	    <!-- Font Awesome -->
	    <link href="vendors/font-awesome/css/font-awesome.min.css" rel="stylesheet">    
	    <!-- Custom Theme Style -->
	    <link href="css/custom.min.css" rel="stylesheet">	
        <!-- Mapa Style -->
        <style>
            /* Always set the map height explicitly to define the size of the div
             * element that contains the map. */
            #map {          
                height: 600px;
                width: 100%;
                align-content: center
            }
            /* Optional: Makes the sample page fill the window. */
            html, body {
                height: 100%;
                margin: 0;
                padding: 0;
            }
            
        </style>


    </head>

    <body class="nav-md">
        <div class="container body">
            <div class="main_container">
               <c:import url="menu.jsp"/> 
                <!-- page content -->
                <div class="right_col" role="main">
                    <div class="row">             
                        <br />		    
                        <div class="row">			  
                            <div class="col-md-12 col-sm-12 col-xs-12">
                                <div class="x_panel">
                                    <div class="x_title">

                                        <!-- Mapa-->
                                        <h2>Mapa <small></small></h2>
                                        <ul class="nav navbar-right panel_toolbox">
                                            <li><a class="collapse-link"><i class="fa fa-chevron-up"></i></a>
                                            </li>
                                            <li class="dropdown">
                                                <!--
                                               <a href="#" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-expanded="false"><i class="fa fa-wrench"></i></a>                                               
                                               <ul class="dropdown-menu" role="menu">
                                                   <li><a href="#">Settings 1</a>
                                                   </li>
                                                   <li><a href="#">Settings 2</a>
                                                   </li>
                                               </ul>
                                                -->
                                            </li>
                                            <li><a class="close-link"><i class="fa fa-close"></i></a>
                                            </li>
                                        </ul>
                                        <div class="clearfix"></div>
                                    </div>
                                    <div class="x_content">
                                        <p class="text-muted font-13 m-b-30">
                                            Focos identificados.
                                        </p>

                                        <!-- Iniciando o mapa -->
                                        <div id="map"></div>
                                        <script>
                                            function initMap() {

                                                var map = new google.maps.Map(document.getElementById('map'), {
                                                    zoom: 10,
                                                    center: {lat: -16.689497, lng: -49.266216}
                                                });

                                                // Criar uma matriz de caracteres alfabéticos usados para rotular os marcadores.
                                                var labels = 'abcdefghijklmnopqrstuvwxyz';

                                                // Adicione alguns marcadores ao mapa.
                                                        // Nota: O código usa o método JavaScript Array.prototype.map () para
                                                        // cria uma matriz de marcadores com base em um array de "locais".
                                                        // O método map () aqui não tem nada a ver com a API do Google Maps.
                                                var markers = locations.map(function (location, i) {
                                                    return new google.maps.Marker({
                                                        position: location,
                                                        label: labels[i % labels.length]
                                                    });
                                                });

                                                // Adicione um marcador de cluster para gerenciar os marcadores.
                                                var markerCluster = new MarkerClusterer(map, markers,
                                                        {imagePath: 'https://developers.google.com/maps/documentation/javascript/examples/markerclusterer/m'});
                                            }

                                            //pontos
                                            var locations = [
                                                {lat: -16.6086816, lng: -49.2591213},
                                                {lat: -16.6113959, lng: -49.2580484},
                                                {lat: -16.6110669, lng: -49.2567181},
                                                {lat: -16.6108201, lng: -49.2404102},
                                                {lat: -16.6635542, lng: -49.2439349},
                                                {lat: -16.6842329, lng: -49.2597278},
                                                {lat: -16.6828275, lng: -49.2579704},
                                                {lat: -16.6820453, lng: -49.2570518},
                                                {lat: -16.6786720, lng: -49.2573070},
                                                {lat: -16.6936366, lng: -49.2745766},
                                                {lat: -16.6813042, lng: -49.2369828},
                                                {lat: -16.6820441, lng: -49.2367253},
                                                {lat: -16.6864839, lng: -49.2348370},
                                                {lat: -16.6659287, lng: -49.2596421},
                                                {lat: -16.6716843, lng: -49.2567238},
                                                {lat: -16.6720955, lng: -49.2563805},
                                                {lat: -16.6742332, lng: -49.2556085},
                                                {lat: -16.6810575, lng: -49.2552647},
                                                {lat: -16.6859084, lng: -49.2532906},
                                                {lat: -16.6971717, lng: -49.2532906}
                                            ]
                                        </script>
                                        <script src="https://developers.google.com/maps/documentation/javascript/examples/markerclusterer/markerclusterer.js">
                                        </script>
                                        <script async defer
                                                src="https://maps.googleapis.com/maps/api/js?key=AIzaSyBDMW1J5J0TVAdNSO0CCSutqo29mKSKQ5A&callback=initMap">
                                        </script>       
                                        <!-- Mapa  -->     
                                    </div>
                                </div>
                            </div>
                        </div>  
                    </div>
                </div>
                <footer>
                    <div class="pull-center">
                        Trabalho PW2017-1 - Sistema de Controle de Endemias <a href="https://github.com/dougfalves/UFG-PW-TRABALHO">GitHub</a>
                    </div>
                    <div class="clearfix"></div>
                </footer>
            </div>
        </div>
         <!-- jQuery -->
    <script src="vendors/jquery/dist/jquery.min.js"></script>
    <!-- Bootstrap -->
    <script src="vendors/bootstrap/dist/js/bootstrap.min.js"></script>
    <!-- Bootstrap select -->
    <script src="js/bootstrap-select.min.js"></script>
    <!-- Custom Theme Scripts -->
    <script src="build/js/custom.min.js"></script> 
    <!-- bootstrap-VALIDATOR -->
    <script src="js/validator.min.js"></script>	
    </body>
</html>
