
<%
	// verificando se tem um atributo login na sessao
	// se tiver vai continuar e mostrar o menu
	if (session.getAttribute("nome") != null) {
%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html lang="pt">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<!-- Meta, title, CSS, favicons, etc. -->
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>Sistema de Controle de Endemias</title>

<!-- Bootstrap -->
<link href="vendors/bootstrap/dist/css/bootstrap.min.css"
	rel="stylesheet">
<!-- Bootstrap select -->
<link href="css/bootstrap-select.min.css" rel="stylesheet">
<!-- Font Awesome -->
<link href="vendors/font-awesome/css/font-awesome.min.css"
	rel="stylesheet">
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
			<c:import url="menu.jsp" />
			<!-- page content -->
			<div class="right_col" role="main">
				<div class="row">
					<br />
					<div class="row">
						<div class="col-md-12 col-sm-12 col-xs-12">
							<div class="x_panel">
								<div class="x_title">

									<!-- Mapa-->
									<h2>
										Mapa <small></small>
									</h2>

									<ul class="nav navbar-right panel_toolbox">
										<li><a class="collapse-link"><i
												class="fa fa-chevron-up"></i></a></li>
										<li><a class="close-link"><i class="fa fa-close"></i></a>
										</li>
									</ul>

									<div class="clearfix"></div>
								</div>


								<div class="x_content">
									<form class="form-horizontal form-label-left"
										data-toggle="validator" method="post" action="mapa_foco.jsp">

										<div class="form-group  col-lg-3 col-xs-12">
											<label>Bairro </label> <input type="text" name="txtpesquisa1"
												class="form-control input-md">
										</div>
										<div class="form-group  col-lg-3 col-xs-12">
											<label>Cidade </label> <select name="txtpesquisa2" title=""
												class="form-control input-md selectpicker"
												data-live-search="true">
												<option selected="selected"></option>
												<option value="Goiânia">Goiânia</option>
												<option value="Aparecida de Goiânia">Aparecida de
													Goiânia</option>
												<option value="Senador Canedo">Senador Canedo</option>
												<option value="Trindade">Trindade</option>
											</select>
										</div>

										<div class="form-group  col-lg-3 col-xs-12">
											<label>Tipo de Imovel </label> <select name="txtpesquisa3"
												title="" class="form-control input-md selectpicker"
												data-live-search="true">
												<option selected="selected"></option>
												<option value="Lote">Lote</option>
												<option value="Casa">Casa</option>
												<option value="Apartamento">Apartamento</option>
												<option value="Deposito">Depósito</option>
												<option value="Loja">Loja</option>
												<option value="Sala">Sala comercial</option>
											</select>

										</div>
										<div class="form-group  col-lg-3 col-xs-12">
											<label>Estagio</label> <select name="txtpesquisa4" title=""
												class="form-control input-md selectpicker"
												data-live-search="true">
												<option selected="selected"></option>
												<option value="Ovo">Ovo</option>
												<option value="Larva">Larva</option>
												<option value="Pupa">Pupa</option>
												<option value="Mosquito">Mosquito</option>
											</select>
										</div>


										<div class="x_content">
											<div class="row">
												<c:if test="${not empty message}">
													<div class="col-lg-4 col-xs-12">
														<c:if test="${fn:contains(message, 'Erro')}">
															<div class="alert alert-danger fade in">
																<a href="#" class="close" data-dismiss="alert">&times;</a>
																<p>${message}</p>
															</div>
														</c:if>
														<c:if test="${fn:contains(message, 'pesquisa')}">
															<div class="alert alert-warning fade in">
																<a href="#" class="close" data-dismiss="alert">&times;</a>
																<p>${message}</p>
															</div>

														</c:if>
														<c:if test="${fn:contains(message, 'Sucesso')}">
															<div class="alert alert-info fade in">
																<a href="#" class="close" data-dismiss="alert">&times;</a>
																<p>${message}</p>
															</div>

														</c:if>
													</div>
												</c:if>
											</div>

											<p class="text-muted font-13 m-b-30">

												<a href="mapa_foco.jsp">
													<button type="button" class="btn btn-primary"
														data-container="body" data-toggle="popover"
														data-placement="bottom" title="Limpar Listagem">
														<i class="fa fa-refresh"></i>
													</button>
												</a>
												<button type="submit" class="btn btn-warning"
													data-container="body" data-toggle="popover"
													data-placement="bottom" title="Visualizar no Mapa">
													<i class="fa fa-globe"></i>
												</button>
											</p>
											<table id="datatable-buttons"
												class="table table-striped table-bordered">
												<tbody>
													<c:forEach var="visita" items="${listavisita}">
														<tr>
															<td>${visita.latitude}</td>
															<td>${visita.longitude}</td>
														</tr>
													</c:forEach>
												</tbody>
											</table>
										</div>
									</form>


									<!-- Iniciando o mapa -->

									<div id="map"></div>
									<script>
										function initMap() {

											var map = new google.maps.Map(
													document
															.getElementById('map'),
													{
														zoom : 13,
														center : locations[0]
													});

											// Criar uma matriz de caracteres alfabéticos usados para rotular os marcadores.
											var labels = 'abcdefghijklmnopqrstuvwxyz';

											// Adicione alguns marcadores ao mapa.
											// Nota: O código usa o método JavaScript Array.prototype.map () para
											// cria uma matriz de marcadores com base em um array de "locais".
											// O método map () aqui não tem nada a ver com a API do Google Maps.
											var markers = locations
													.map(function(location, i) {
														return new google.maps.Marker(
																{
																	position : location,
																	label : labels[i
																			% labels.length]
																});
													});

											// Adicione um marcador de cluster para gerenciar os marcadores.
											var markerCluster = new MarkerClusterer(
													map,
													markers,
													{
														imagePath : 'https://developers.google.com/maps/documentation/javascript/examples/markerclusterer/m'
													});
										}

										//pontos /// trocar pelos objetos da lista
										<%@  page 
 												import="model.VisitaDAO , model.Visita, java.util.List, java.util.ArrayList"
 											%>
											<%
												request.setCharacterEncoding("UTF8");											
 												VisitaDAO visitaDAO = new VisitaDAO();
												List<Visita> listavisita = new ArrayList<Visita>();
												String textopesquisa1 = request.getParameter("txtpesquisa1");
												String textopesquisa2 = request.getParameter("txtpesquisa2");
												String textopesquisa3 = request.getParameter("txtpesquisa3");
												String textopesquisa4 = request.getParameter("txtpesquisa4");
												//System.out.println(textopesquisa1);
												//System.out.println(textopesquisa2);
												//System.out.println(textopesquisa3);
												//System.out.println(textopesquisa4);
												listavisita = visitaDAO.listarmapa(textopesquisa1, textopesquisa2, textopesquisa3, textopesquisa4);
												
 											%>
										var locations = [ {
											<%
											for(Visita v : listavisita){
												//System.out.println(v.getLatitude());
												%>
												lat:<%=v.getLatitude()%>,
												lng:<%=v.getLongitude()%>
											},{
												<%
											}
											%>
										}]
										
										/*var locations = [ {
											lat : -16.6086816,
											lng : -49.2591213
										}, {
											lat : -16.6113959,
											lng : -49.2580484
										}, {
											lat : -16.6110669,
											lng : -49.2567181
										}, {
											lat : -16.6108201,
											lng : -49.2404102
										}, {
											lat : -16.6635542,
											lng : -49.2439349
										}, {
											lat : -16.6842329,
											lng : -49.2597278
										}, {
											lat : -16.6828275,
											lng : -49.2579704
										}, {
											lat : -16.6820453,
											lng : -49.2570518
										}, {
											lat : -16.6786720,
											lng : -49.2573070
										}, {
											lat : -16.6936366,
											lng : -49.2745766
										}, {
											lat : -16.6813042,
											lng : -49.2369828
										}, {
											lat : -16.6820441,
											lng : -49.2367253
										}, {
											lat : -16.6864839,
											lng : -49.2348370
										}, {
											lat : -16.6659287,
											lng : -49.2596421
										}, {
											lat : -16.6716843,
											lng : -49.2567238
										}, {
											lat : -16.6720955,
											lng : -49.2563805
										}, {
											lat : -16.6742332,
											lng : -49.2556085
										}, {
											lat : -16.6810575,
											lng : -49.2552647
										}, {
											lat : -16.6859084,
											lng : -49.2532906
										}, {
											lat : -16.6971717,
											lng : -49.2532906
										} ]*/
										
									</script>
									<script
										src="https://developers.google.com/maps/documentation/javascript/examples/markerclusterer/markerclusterer.js">
										
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
					Trabalho PW2017-1 - Sistema de Controle de Endemias <a
						href="https://github.com/dougfalves/UFG-PW-TRABALHO">GitHub</a>
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
<%
	// se não existir um login na sessao, 
		// vai enviar para a página de login novamente
	} else {
%>
<jsp:forward page="index.jsp"></jsp:forward>
<%
	}
%>
