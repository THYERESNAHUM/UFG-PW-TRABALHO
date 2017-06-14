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


@WebServlet(name="ServletFuncionario", urlPatterns = "/funcionario")
public class ServletFuncionario extends HttpServlet {
	
	private static final long serialVersionUID = 1L;
	
	private FuncionarioDAO funcionarioDAO = new FuncionarioDAO();
	private Funcionario funcionario = new Funcionario();
	private String[] parametropesquisa = new String[3];
	String destino = "";
	private int idfuncionario;
	private String nome;
	private String funcao;
	private String matricula;
	private String email;
	private String senha;
	private String message = "";
	private boolean acao = false;

	
	protected void doGet(HttpServletRequest request,
			HttpServletResponse response) throws ServletException, IOException {		
		 				
	}

	protected void doPost(HttpServletRequest request,
			HttpServletResponse response) throws ServletException, IOException {		
		 
		try {
			
			idfuncionario = Integer.parseInt(request.getParameter("idfuncionario"));
    		System.out.println("NA VARIAVEL: " + idfuncionario);

			
		 }catch(NumberFormatException number){
			acao = true;
			adicionafuncionario(request, response);
			message = "Funcionario inserido com sucessso"; 		
			request.setAttribute("message", message);
			destino = "/c_funcionario.jsp";
		 }
		
		if (acao==false){
		//	if(funcionarioDAO.existe(funcionario)){
				editarfuncionario(request, response);	    		
	    		message = "Funcionario alterado com sucessso"; 		
				request.setAttribute("message", message);
				destino = "/c_funcionario.jsp";
		//	}	
		}
		
	        /*else{
	            List<Employee> result = employeeService.getAllEmployees();
	            forwardListEmployees(req, resp, result);
	        }
		 */
		/*try {		            
        	
        	idfuncionario = Integer.parseInt(request.getParameter("idfuncionario"));
	        matricula = request.getParameter("matricula");
	        funcionario.setIdfuncionario(idfuncionario);
			funcionario.setMatricula(matricula);
        
        }catch(NumberFormatException number){        
        	if(!funcionarioDAO.existe(funcionario))
        		adicionafuncionario(request, response); 
        		System.out.println("NA VARIAVEL: " + idfuncionario);        	
        }
        
        if(idfuncionario!=0){       	
        	if(funcionarioDAO.existe(funcionario))
	    		editarfuncionario(request, response, idfuncionario);				
        }*/
	    
	    RequestDispatcher rd = request.getRequestDispatcher(destino);
	    rd.forward(request, response);  
	}	
	
	protected void adicionafuncionario(HttpServletRequest request,
	    HttpServletResponse response) throws ServletException, IOException {
		
		 nome = request.getParameter("nome");
		 funcao = request.getParameter("funcao");
		 matricula = request.getParameter("matricula");	
		 email = request.getParameter("email");
		 senha = request.getParameter("senha");	
		
		try {
			
			funcionario.setMatricula(matricula);
			funcionario.setNome(nome);
			funcionario.setFuncao(funcao);
			funcionario.setEmail(email);
			funcionario.setSenha(senha);
			
			/*request.setAttribute("resultado", resultado);*/	        
		}catch(Exception e){
			System.out.println("Parametro incorreto.");
			//this.getServletContext().getRequestDispatcher("/funcionario.jsp").forward(request, response);				
		}
		
		try {			
	   		funcionarioDAO.inserir(funcionario);        		
			} catch (Exception e) {			
				message = "Verifique os dados informados";   			
				System.out.println(e);
				e.printStackTrace();
				//this.getServletContext().getRequestDispatcher("/funcionario.jsp").forward(request, response);
			}		
				message = "Funcionario inserido com sucessso"; 		
				request.setAttribute("message", message);
				destino = "/c_funcionario.jsp";		 
		
	}	
	
	protected void editarfuncionario(HttpServletRequest request,
		    HttpServletResponse response) throws ServletException, IOException {		
		
		 nome = request.getParameter("nome");
		 funcao = request.getParameter("funcao");
		 matricula = request.getParameter("matricula");	
		 email = request.getParameter("email");
		 senha = request.getParameter("senha");		 
		 
		  System.out.println("no EDITAR: " + idfuncionario);
		  System.out.println("no EDITAR: " + nome);
		  System.out.println("no EDITAR: " + matricula);
		  System.out.println("no EDITAR: " + email);
		  System.out.println("no EDITAR: " + funcao);
		  System.out.println("no EDITAR: " + senha);

		
		try {
			
			funcionario.setIdfuncionario(idfuncionario);
			funcionario.setMatricula(matricula);
			funcionario.setNome(nome);
			funcionario.setFuncao(funcao);
			funcionario.setEmail(email);
			funcionario.setSenha(senha);
			
			/*request.setAttribute("resultado", resultado);*/	        
		}catch(Exception e){
			System.out.println("Parametro incorreto.");
			//this.getServletContext().getRequestDispatcher("/funcionario.jsp").forward(request, response);				
		}
		
		try {
			
	   		funcionarioDAO.alterar(funcionario); 
	   		
			} catch (Exception e) {			
				message = "Verifique os dados informados";   			
				System.out.println(e);
				e.printStackTrace();
				//this.getServletContext().getRequestDispatcher("/funcionario.jsp").forward(request, response);
			}		
			message = "Funcionario alterado com sucessso";   			
			request.setAttribute("message", message);
			destino = "/c_funcionario.jsp";	
	}	
}