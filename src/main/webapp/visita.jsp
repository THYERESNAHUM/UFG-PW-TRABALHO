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

    <title>Sistema de Controle de Endemias</title>

    <!-- Bootstrap -->
    <link href="vendors/bootstrap/dist/css/bootstrap.min.css" rel="stylesheet">
    <!-- Bootstrap select -->
  	<link href="css/bootstrap-select.min.css" rel="stylesheet">
    <!-- Font Awesome -->
    <link href="vendors/font-awesome/css/font-awesome.min.css" rel="stylesheet">    
    <!-- iCheck -->
    <link href="vendors/iCheck/skins/flat/green.css" rel="stylesheet">      
    <!-- bootstrap-daterangepicker -->
    <link href="vendors/bootstrap-daterangepicker/daterangepicker.css" rel="stylesheet">
    <!-- Custom Theme Style -->
    <link href="css/custom.min.css" rel="stylesheet">	       
     
  </head>
  <body class="nav-md">
    <div class="container body">
      <div class="main_container">
  <c:import url="menu.jsp" /> 
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
                      <h2>Visita</h2>
                      <ul class="nav navbar-right panel_toolbox">
                        <li><a class="collapse-link"><i class="fa fa-chevron-up"></i></a>
                        </li>
                        <li><a class="close-link"><i class="fa fa-close"></i></a>
                        </li>
                      </ul>
                      <div class="clearfix"></div>
                    </div>
                    <div class="x_content">
                   <form class="form-horizontal form-label-left" data-toggle="validator" method="get">				 
                            <p>Atenção aos campos requeridos<code>*</code></p>
                                    <!-- <span class="section">Dados do Agente</span>-->					  
                           <!--IDbanco Input-->
                              <div class="form-group">
                                        <div class="col-md-2 col-xs-12">
                                            <input  type="hidden" readonly="readonly" type="text" id="idvisita" name="idfuncionario" value="${denuncia.iddenuncia}" class="form-control input-md">
                                        </div>
                              </div>
                          <!--Nome Input-->
                                    <div class="form-group">
                                      <label class="control-label col-md-3" for="nome">Agente <span class="required">*</span></label>
                                      <div class="col-lg-6 col-xs-12">
                                        <input type="text" id="nome" name="nome" placeholder="ex: Joao da Silva" required="required" class="form-control input-md">                                        
                                        <div class="help-block with-errors"></div>
                                      </div>
                                    </div>
                          <!--data Input-->
                                    <div class="form-group">
                                      <label class="control-label col-md-3" for="data">Data da visita <span class="required">*</span></label>
                                      <div class="col-lg-2 col-xs-12">
                                        <input type="text" id="data" name="data" required="required" class="form-control input-md">
                                         <div class="help-block with-errors"></div>
                                      </div>
                                    </div>
                        <!--Rua Input-->
                                    <div class="form-group">
                                      <label class="control-label col-md-3" for="rua">Rua <span class="required">*</span></label>
                                      <div class="col-lg-5 col-xs-12">
                                        <input type="text" id="rua" name="rua" required="required" class="form-control input-md">
                                        <div class="help-block with-errors"></div>
                                      </div>
                                    </div>
                          <!--Quadra Lote Numero Input-->
                                    <div class="form-group">
                                      <label class="control-label col-md-3" for="quadra">Quadra <span class="required">*</span></label>
                                      <div class="col-lg-1 col-xs-12">
                                        <input type="text" id="quadra" name="quadra" required="required" class="form-control input-md">
                                        <div class="help-block with-errors"></div>
                                      </div>
                                      <label class="control-label col-md-1" for="lote">Lote* <span class="required">*</span></label>
                                      <div class="col-lg-1 col-xs-12">
                                        <input type="text" id="lote" name="lote" required="required" class="form-control input-md">
                                      </div>
                                      <label class="control-label col-md-1" for="numero">Nº <span class="required">*</span></label>
                                      <div class="col-lg-1 col-xs-12">
                                        <input type="text" id="numero" name="numero" required="required" class="form-control input-md">
                                      </div>
                                    </div>            
                            <!--Bairro Input-->
                                    <div class="form-group">
                                      <label class="control-label col-md-3" for="bairro">Bairro/Setor <span class="required">*</span></label>
                                      <div class="col-lg-3 col-xs-12">
                                        <input type="text" id="bairro" name="bairro" required="required" class="form-control input-md">
                                         <div class="help-block with-errors"></div>
                                      </div>
                                    </div>
                            <!--Cep Input-->
                                    <div class="form-group">
                                      <label class="control-label col-md-3" for="cep">CEP <span class="required">*</span></label>
                                      <div class="col-lg-2 col-xs-12">
                                        <input type="tel" id="cep" name="cep" required="required" class="form-control input-md" pattern="[0-9]+$" 
                                         data-error="Informe um CEP somente com numeros.">
                                         <div class="help-block with-errors"></div>
                                      </div>
                                    </div>
                        <!--Cidade select-->
                          <div class="form-group">
                          <label class="control-label col-md-3" for="cidade">Cidade <span class="required">*</span></label>
                            <div class="col-lg-3 col-xs-12">
                            <select required id="cidade" name="cidades"  title="Selecione item" class="form-control input-md selectpicker" data-live-search="true">
                              <option value="goiania">Goiânia</option>
                              <option value="aparecida">Aparecida de Goiânia</option>
                              <option value="senadorcanedo">Senador Canedo</option>
                              <option value="trindade">Trindade</option>
                            </select>
                             <div class="help-block with-errors"></div>
                            </div>
                          </div> 
                        <!--Coordenadas-->
                                    <div class="form-group">
                                      <label class="control-label col-md-3" for="coordenadas">Coordenadas <span class="required">*</span></label>
                                      <div class="col-lg-2 col-xs-12">
                                        <input type="text" id="latitude" name="latitude" required="required" class="form-control input-md">
                                        <div class="help-block with-errors"></div>
                                        <div class="help">Latitude</div>
                                      </div>
                                      <div class="col-lg-2 col-xs-12">
                                        <input type="text" id="longitude" name="longitude" required="required" class="form-control input-md">
                                        <div class="help-block with-errors"></div>
                                        <div class="help">Longitude</div>
                                      </div>                     
                                    </div>                        
                        <!--Tipo_Imovel select-->
                          <div class="form-group">
                          <label class="control-label col-md-3" for="tipo">Tipo do Imovel <span class="required">*</span></label>
                            <div class="col-lg-3 col-xs-12">
                            <select required id="tipo" name="tipo" title="Selecione item" class="form-control input-md selectpicker" data-live-search="true">
                              <option value="lote">Lote</option>
                              <option value="casa">Casa</option>
                              <option value="apartamento">Apartamento</option>
                              <option value="deposito">Depósito</option>
                              <option value="loja">Loja</option>
                              <option value="sala">Sala comercial</option>
                            </select>
                            <div class="help-block with-errors"></div>
                            </div>
                          </div>
                        <!--Estagio select-->
                          <div class="form-group">
                          <label class="control-label col-md-3" for="estagio">Estagio do Ciclo </label>
                            <div class="col-lg-3 col-xs-12">
                            <select  id="estagio" name="estagio" title="Selecione item" class="form-control input-md selectpicker" data-live-search="true">
                              <option value="ovo">Ovo</option>
                              <option value="larva">Larva</option>
                              <option value="pupa">Pupa</option>
                              <option value="mosquito">Mosquito</option>							  
                            </select>
                            </div>
                          </div>	
                          <!--Larvicida select-->
                          <div class="form-group">
                          <label class="control-label col-md-3" for="larvicida">Larvicida </label>
                            <div class="col-lg-3 col-xs-12">
                            <select  id="larvicida" name="larvicida"  title="Selecione item" class="form-control input-md selectpicker" data-live-search="true">
                              <option value="tipo1">Tipo 1</option>
                              <option value="tipo2">Tipo 2</option>
                              <option value="tipo3">Tipo 3</option>
                            </select>
                            </div>
                          </div>
                          <!--Ação select-->
                          <div class="form-group">
                          <label class="control-label col-md-3" for="acao">Ação Corretiva </label>
                            <div class="col-lg-3 col-xs-12">
                            <select  id="acao" name="acao" title="Selecione item" class="form-control input-md selectpicker" data-live-search="true">            
                              <option value="nebolizacao">Nebolização</option>
                              <option value="borrifacao">Borrifação</option>
                            </select>
                            </div>
                          </div>						  
                          <!--Local input-->
                                    <div class="form-group">
                                      <label class="control-label col-md-3" for="local">Local do Foco </label>
                                      <div class="col-lg-6 col-xs-12">
                                        <input type="text" id="local" name="local" placeholder="ex: caixa d'agua,vaso sanitário" class="form-control input-md">
                                      </div>
                                    </div>				 
                        <!--Botões-->    
                            <div class="ln_solid"></div>
                            <div class="form-group">
                              <div class="col-md-6 col-md-offset-3">
                                <!-- <button id="send" type="submit" class="btn btn-info" data-toggle="modal" data-target="#confirma">Gravar</button> -->
                                <button id="send" type="submit" class="btn btn-info">Gravar</button>
                                <button type="reset" class="btn btn-warning">Limpar</button>                             
                                      </div>
                                    </div>
                      </form>

                    <!-- Modal botao ok -->
                    <div class="modal fade" id="confirma" role="dialog">
                      <div class="modal-dialog">
                         <div class="modal-dialog modal-sm">
                            <!-- Modal conteudo-->
                            <div class="modal-content">
                              <div class="modal-header">
                                <button type="button" class="close" data-dismiss="modal">&times;</button>
                                <h4 class="modal-title">Informação</h4>
                              </div>
                              <div class="modal-body">
                                <h5>Dados gravados com sucesso.</h5>
                              </div>
                              <div class="modal-footer">
                                <button type="button" class="btn btn-primary" data-dismiss="modal">Fechar</button>
                              </div>
                            </div>
                        </div>
                      </div>
                    </div>
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
    <!-- bootstrap-daterangepicker -->
    <script src="vendors/moment/min/moment.min.js"></script>
    <script src="vendors/bootstrap-daterangepicker/daterangepicker.js"></script>
    <!-- bootstrap-VALIDATOR -->
    <script src="js/validator.min.js"></script>
    
    <script type="text/javascript">
    $(function() {
        $('input[name="data"]').daterangepicker({
            singleDatePicker: true,
            timePicker: true,
            timePickerIncrement: 1,
            locale: {
                format: 'DD/MM/YYYY h:mm A'
            }
        });
    });
    </script>
  </body>
</html>
