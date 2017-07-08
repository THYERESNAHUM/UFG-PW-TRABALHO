package controller;


import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import model.FuncionarioDAO;
import model.Funcionario;

@WebServlet(name="ServletBuscaFuncionario", urlPatterns = "/buscafuncionario")
public class ServletBuscaFuncionario extends HttpServlet {
	
	private static final long serialVersionUID = 1L;
	
	private FuncionarioDAO funcionarioDAO = new FuncionarioDAO();
	private Funcionario funcionario = new Funcionario();
	private String[] parametropesquisa = new String[3];
	private int idfuncionario;
	private String destino = "";
	private String acao;
	private String message;
	private String textopesquisa1; 
	private String textopesquisa2; 
	private String textopesquisa3; 

	
	protected void doGet(HttpServletRequest request,
			HttpServletResponse response) throws ServletException, IOException {
		
			acao = request.getParameter("acao");	
			if(acao!=null){
				if(acao.equalsIgnoreCase("Consultar")){
					consultareditarfuncionario(request, response);
					RequestDispatcher rd = request.getRequestDispatcher(destino);
				    rd.forward(request, response); 
				}else if(acao.equalsIgnoreCase("Excluir")){
					excluirfuncionario(request,response);
					RequestDispatcher rd = request.getRequestDispatcher(destino);
				    rd.forward(request, response); 
				}
			}					
	}

	protected void doPost(HttpServletRequest request,
			HttpServletResponse response) throws ServletException, IOException {	
			
			request.setCharacterEncoding("UTF8");
			buscarfuncionario(request, response);
			RequestDispatcher rd = request.getRequestDispatcher(destino);
	     	rd.forward(request, response);
		
	}
	protected void buscarfuncionario(HttpServletRequest request,
		    HttpServletResponse response) throws ServletException, IOException {

			textopesquisa1 = request.getParameter("txtpesquisa1");
			textopesquisa2 = request.getParameter("txtpesquisa2");		
			textopesquisa3 = request.getParameter("txtpesquisa3");		
			
	        if((textopesquisa1!="" && textopesquisa1!=null)  || (textopesquisa2!="" && textopesquisa2!=null) ||(textopesquisa3!="" && textopesquisa3!=null)){
	        	for(int i=0;i<parametropesquisa.length;i++){					
	    			parametropesquisa[i]="";					
	    		}        	
	        		 parametropesquisa[0] = textopesquisa1;
					 parametropesquisa[1] = textopesquisa2;
					 parametropesquisa[2] = textopesquisa3;
					 
				List<Funcionario> listafuncionario = new ArrayList<Funcionario>();    		
				listafuncionario = funcionarioDAO.listar(textopesquisa1, textopesquisa2, textopesquisa3);
				request.setAttribute("listafuncionario", listafuncionario);
				destino = "/c_funcionario.jsp";
		     }else{
				message = "Informe um parametro para pesquisa";				
				request.setAttribute("message", message);
				destino = "/c_funcionario.jsp";		    	 
		     }	 
	}  
	 protected void consultareditarfuncionario(HttpServletRequest request,
	 		    HttpServletResponse response) throws ServletException, IOException {
			 
			 	idfuncionario = Integer.parseInt(request.getParameter("idfuncionario")); 			
				funcionario.setIdfuncionario(idfuncionario);				
				funcionario = funcionarioDAO.consultar_editar(funcionario);
				request.setAttribute("funcionario", funcionario);
				destino = "/funcionario.jsp";	
		}
	 
	 protected void excluirfuncionario(HttpServletRequest request,
	 		    HttpServletResponse response) throws ServletException, IOException {

		 		idfuncionario = Integer.parseInt(request.getParameter("idfuncionario"));
				funcionario.setIdfuncionario(idfuncionario);			
				request.setAttribute("funcionario", funcionario);
				funcionarioDAO.excluir(funcionario);
				List<Funcionario> listafuncionario = new ArrayList<Funcionario>();    		
	        	listafuncionario = funcionarioDAO.listar(textopesquisa1, textopesquisa2, textopesquisa3);
				request.setAttribute("listafuncionario", listafuncionario);				
				destino = "/c_funcionario.jsp";	
		}
}