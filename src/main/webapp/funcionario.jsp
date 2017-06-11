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
    <link href="vendors/bootstrap/dist/css/bootstrap.min.css" rel="stylesheet">
    <!-- Bootstrap select -->
  	<link href="css/bootstrap-select.min.css" rel="stylesheet">
    <!-- Font Awesome -->
    <link href="vendors/font-awesome/css/font-awesome.min.css" rel="stylesheet">    
    <!-- Custom Theme Style -->
    <link href="css/custom.min.css" rel="stylesheet">	
  </head>

  <body class="nav-md">
    <div class="container body">
      <div class="main_container">
        <div class="col-md-3 left_col">
          <div class="left_col scroll-view">
            <div class="navbar nav_title" style="border: 0;">
              <a href="pagina_inicial.html" class="site_title"><i class="fa fa-desktop"></i> <span>SysEndemias</span></a>
            </div>

            <div class="clearfix"></div>

            <!-- menu profile quick info -->
            <div class="profile clearfix">
              <div class="profile_pic">
                <img src="images/img.jpg" alt="..." class="img-circle profile_img">
              </div>
              <div class="profile_info">
                <span>Bem-vindo,</span>
                <h2>Administrador</h2>
              </div>
            </div>
            <!-- /menu profile quick info -->

            <br />

            <!-- sidebar menu -->
            <div id="sidebar-menu" class="main_menu_side hidden-print main_menu">
              <div class="menu_section">
                <h3>INFORMAÇÕES</h3>
                <ul class="nav side-menu">
                <li>
                                        <a href="pagina_inicial.html"><i class="fa fa-home"></i> Início</a>
                                    </li>
                  <li><a><i class="fa fa-edit"></i> Cadastros <span class="fa fa-chevron-down"></span></a>
                    <ul class="nav child_menu">
                      <li><a href="funcionario.jsp">Funcionário</a></li>
                      <li><a href="visita.jsp">Visita</a></li>
                      <li><a href="denuncia.jsp">Denúncia</a></li>
                    </ul>
                  </li>
                  <li><a><i class="fa fa-search"></i> Busca <span class="fa fa-chevron-down"></span></a>
                    <ul class="nav child_menu">
                      <li><a href="c_funcionario.html">Funcionários</a></li>
                      <li><a href="c_visita.html">Visitas</a></li>
                      <li><a href="c_denuncia.html">Denúncias</a></li>                      
                    </ul>
                  </li>               
                 </ul>
              </div>
              <div class="menu_section">
                <h3>Visualização</h3>
                <ul class="nav side-menu">
                  <li><a><i class="fa fa-globe"></i> Mapa <span class="fa fa-chevron-down"></span></a>
                    <ul class="nav child_menu">
                      <li><a href="mapa_foco.html">Mapa de focos </a></li>
                    </ul>
                  </li>                                
                </ul>
              </div>

            </div>
            <!-- /sidebar menu -->

            <!-- /menu footer buttons -->
            <div class="sidebar-footer hidden-small">
              <a data-toggle="tooltip" data-placement="top" title="Sair" href="index.html">
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
                    <img src="images/img.jpg" alt="">Administrador
                    <span class=" fa fa-angle-down"></span>
                  </a>
                  <ul class="dropdown-menu dropdown-usermenu pull-right">
                    <li><a href="javascript:;"> Perfil</a></li>
                    <li><a href="index.html"><i class="fa fa-sign-out pull-right"></i> Sair</a></li>
                  </ul>
                </li>          
              </ul>
            </nav>
          </div>
        </div>
        <!-- /top navigation -->

        <!-- page content -->
        <div class="right_col" role="main">
          <!-- top tiles -->
          <div class="row tile_count">
          </div>
          <!-- /top tiles -->

  	<div class="row">             
          <br />		    
              <div class="row">			  
                <!-- Start to do list -->
                <div class="col-md-12 col-sm-12 col-xs-12">
                  <div class="x_panel">
                    <div class="x_title">
                      <h2>Funcionario</h2>
                      <ul class="nav navbar-right panel_toolbox">
                        <li><a class="collapse-link"><i class="fa fa-chevron-up"></i></a>
                        </li>
                        <li><a class="close-link"><i class="fa fa-close"></i></a>
                        </li>
                      </ul>
                      <div class="clearfix"></div>
                    </div>
                    <div class="x_content">					
                <form class="form-horizontal form-label-left" data-toggle="validator" method="get" action="funcionario">				 
                            <p>Atenção aos campos requeridos<code>*</code></p>
                            <!-- <span class="section">Dados do Agente</span>-->
                  
                  <!--IDbanco Input-->
                  <div class="form-group">
                             <div class="col-md-2 col-xs-12">
                                <input  type="hidden" readonly="readonly" type="text" id="idfuncionario" name="idfuncionario" value="${funcionario.idfuncionario}" class="form-control input-md">
                            </div>
                  </div>	
                  <!--Matricula Input-->
                  <div class="form-group">
                              <label class="control-label col-md-3" for="matricula">Matricula <span class="required">*</span></label>
                              <div class="col-md-2 col-xs-12">
                                <input type="text" id="matricula" name="matricula" value="${funcionario.matricula}" placeholder="ex: 710001" required="required" class="form-control input-md"
                                 data-error="Informe um Nº de matricula vlido.">                                
                                <div class="help-block with-errors"></div>
                              </div>
                            </div>			  					  
                  <!--Nome Input-->
                            <div class="form-group">
                              <label class="control-label col-md-3" for="nome">Nome <span class="required">*</span></label>
                              <div class="col-lg-6 col-xs-12">
                                <input type="text" id="nome" name="nome" value="${funcionario.nome}"  placeholder="ex: Joao da Silva" required="required" class="form-control input-md">
                                <div class="help-block with-errors"></div>
                              </div>
                              </div>					  
                    <!--Função select-->
                    <div class="form-group">
                    <label class="control-label col-md-3" for="funcao">Função <span class="required">*</span></label>
                      <div class="col-lg-4 col-xs-12">
                      <select required id="funcao" name="funcao" title="Selecione item" class="form-control input-md selectpicker" data-live-search="true">
                        <option selected="selected">${funcionario.funcao}</option>
                        <option value="atendente">Atendente</option>
                        <option value="agente">Agente</option>
                      </select>
                      <div class="help-block with-errors"></div>
                      </div>
                    </div>
                  <!--Email Input-->
                    <div class="item form-group">
                        <label class="control-label col-md-3" for="email">Email</label>
                      <div class="col-lg-6 col-xs-12">
                        <input type="email" id="email" name="email" value="${funcionario.email}" placeholder="ex: fulano@detal.com" class="form-control input-md">
                      </div>
                    </div>            
                  <!--senha Input-->
                    <div class="item form-group">
                      <label for="senha" class="control-label col-md-3">Senha <span class="required">*</span></label>
                      <div class="col-lg-6 col-xs-12">
                        <input id="senha" type="password" name="senha" value="${funcionario.senha}"  placeholder="ex: #s3nh4*" class="form-control input-md" required="required">                        
                         <div class="help-block with-errors"></div>
                      </div>
                    </div>
                <!--Confirmação senha Input-->  
                    <div class="item form-group">
                      <label for="senha2" class="control-label col-md-3">Confirmar Senha <span class="required">*</span></label>
                      <div class="col-lg-6 col-xs-12">
                        <input id="senha2" type="password" name="senha2" placeholder="ex: #s3nh4*"  class="form-control input-md" required="required">
                        <data-match="#senha" data-match-error="As senhas não são equivalentes!">
                         <div class="help-block with-errors"></div>
                      </div>
                    </div>
                <!--Botões-->    
                      <div class="ln_solid"></div>
                      <div class="form-group">
                        <div class="col-md-6 col-md-offset-3">
                          <button id="send" type="submit" class="btn btn-info">Gravar</button>
                          <button type="reset" class="btn btn-warning">Limpar</button>                          
                        </div>
                      </div>
               </form>
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
