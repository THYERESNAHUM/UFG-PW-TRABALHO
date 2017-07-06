<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html lang="pt">
  <head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <!-- Meta, title, CSS, favicons, etc. -->
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
      <!-- Bootstrap -->
    <link href="vendors/bootstrap/dist/css/bootstrap.min.css" rel="stylesheet">
    <!-- Bootstrap select -->
  	<link href="css/bootstrap-select.min.css" rel="stylesheet">
    <!-- Font Awesome -->
    <link href="vendors/font-awesome/css/font-awesome.min.css" rel="stylesheet">    
    <!-- Custom Theme Style -->
    <link href="css/custom.min.css" rel="stylesheet">	

  </head>    
   <body>    
        <div class="col-md-3 left_col">
          <div class="left_col scroll-view">
            <div class="navbar nav_title" style="border: 0;">
              <a href="pagina_inicial.jsp" class="site_title"><i class="fa fa-desktop"></i> <span>SysEndemias</span></a>
            </div>
            <div class="clearfix"></div>
            <!-- menu profile quick info -->
            <div class="profile clearfix">
              <div class="profile_pic">
				<img src="images/user.png" alt="..." class="img-circle profile_img">				
              </div>
              <div class="profile_info">
                <span>Bem-vindo,</span>
                <h2><% out.print(session.getAttribute("nome")); %></h2>
              </div>
            </div>
            <!-- /menu profile quick info -->
            <br />
            <!-- sidebar menu -->
            <div id="sidebar-menu" class="main_menu_side hidden-print main_menu">
               <div class="menu_section">
                <h3>Visualização</h3>
                <ul class="nav side-menu">
                  <li><a><i class="fa fa-globe"></i> Mapa <span class="fa fa-chevron-down"></span></a>
                    <ul class="nav child_menu">
                      <li><a href="mapa_foco.jsp">Mapa de focos </a></li>
                    </ul>
                  </li>                                
                </ul>
              </div>
              <div class="menu_section">
                <h3>INFORMAÇÕES</h3>
                <ul class="nav side-menu">
                	<li><a href="pagina_inicial.jsp"><i class="fa fa-home"></i> Início</a></li>
                  <li><a><i class="fa fa-edit"></i> Cadastros <span class="fa fa-chevron-down"></span></a>
                    <ul class="nav child_menu">
                      <li><a href="visita.jsp">Visitas</a></li>
                      <li><a href="denuncia.jsp">Denúncia</a></li>
                    </ul>
                  </li>
                  <li><a><i class="fa fa-search"></i> Busca <span class="fa fa-chevron-down"></span></a>
                    <ul class="nav child_menu">
                      <li><a href="c_visita.jsp">Visitas</a></li>                    
                      <li><a href="c_denuncia.jsp">Denúncias</a></li>                      
                    </ul>
                  </li>               
                 </ul>
              </div>   
            </div>
            <!-- /sidebar menu -->

            <!-- /menu footer buttons -->
            <div class="sidebar-footer hidden-small">
              <a data-toggle="tooltip" data-placement="top" title="Sair" href="index.jsp">
                <span class="glyphicon glyphicon-off" aria-hidden="true"></span>
              </a>
            </div>
            <!-- /menu footer buttons -->
          </div>
        </div>
        <!-- top navigation -->
        <div class="top_nav">
          <div class="nav_menu">
            <nav>
              <div class="nav toggle">
                <a id="menu_toggle"><i class="fa fa-bars"></i></a>
              </div>

              <ul class="nav navbar-nav navbar-right">
                <li class="">
                  <a href="javascript:;" class="user-profile dropdown-toggle" data-toggle="dropdown" aria-expanded="false">
                    <img src="images/user.png" alt=""><% out.print(session.getAttribute("nome")); %>
                    <span class=" fa fa-angle-down"></span>
                  </a>
                  <ul class="dropdown-menu dropdown-usermenu pull-right">
                    <li><a href="index.jsp"><i class="fa fa-sign-out pull-right"></i>Sair</a></li>
                  </ul>
                </li>          
              </ul>
            </nav>
          </div>
        </div>
        <!-- /top navigation -->
</body>
</html>
        
