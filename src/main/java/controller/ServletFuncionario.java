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
	private String acao;

	
	protected void doGet(HttpServletRequest request,
			HttpServletResponse response) throws ServletException, IOException {		
				
	}

	protected void doPost(HttpServletRequest request,
			HttpServletResponse response) throws ServletException, IOException {		
		acao = request.getParameter("acao");
		buscarfuncionario(request, response);
		
		System.out.println("VARIAVEL ACAO: " + acao);  
			
	    if(acao!=null){
	    	
			if(acao.equalsIgnoreCase("Consultar")){
					consultareditarfuncionario(request, response);
			}		
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
			}finally{			
				message = "Funcionario inserido com sucessso";   			
	       }
		
		request.setAttribute("message", message);
		destino = "/c_funcionario.jsp";		 
		
	}	
	
	protected void editarfuncionario(HttpServletRequest request,
		    HttpServletResponse response,int idfuncionario) throws ServletException, IOException {
		
		
		 nome = request.getParameter("nome");
		 funcao = request.getParameter("funcao");
		 matricula = request.getParameter("matricula");	
		 email = request.getParameter("email");
		 senha = request.getParameter("senha");	
		
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
			}finally{			
				message = "Funcionario alterado com sucessso";   			
	       }
		
		request.setAttribute("message", message);
		destino = "/c_funcionario.jsp";	
	}
	
	protected void buscarfuncionario(HttpServletRequest request,
			HttpServletResponse response) throws ServletException, IOException {

		String textopesquisa1 = request.getParameter("txtpesquisa1");
		String textopesquisa2 = request.getParameter("txtpesquisa2");		
		String textopesquisa3 = request.getParameter("txtpesquisa3");	
	
		
		List<Funcionario> listafuncionario = new ArrayList<Funcionario>();			
		System.out.println("txtpesquisa1 = " + textopesquisa1);
		System.out.println("txtpesquisa2 = " + textopesquisa2);
		System.out.println("txtpesquisa3 = " + textopesquisa3);	

		
        if((textopesquisa1!="" && textopesquisa1!=null)  || (textopesquisa2!="" && textopesquisa2!=null) ||(textopesquisa3!="" && textopesquisa3!=null)){
        				
        	for(int i=0;i<parametropesquisa.length;i++){					
    			parametropesquisa[i]="";					
    		}        	
        		 parametropesquisa[0] = textopesquisa1;
				 parametropesquisa[1] = textopesquisa2;
				 parametropesquisa[2] = textopesquisa3;
				 
			for(int i=0;i<parametropesquisa.length;i++){					
				System.out.println("No parametro " + parametropesquisa[i]);					
			}		   	 
			listafuncionario = funcionarioDAO.listar(textopesquisa1, textopesquisa2, textopesquisa3);
			request.setAttribute("listafuncionario", listafuncionario);			
			destino = "/c_funcionario.jsp";	
			
        	}   
	}
	 protected void consultareditarfuncionario(HttpServletRequest request,
 		    HttpServletResponse response) throws ServletException, IOException {

     	 idfuncionario = Integer.parseInt(request.getParameter("idfuncionario"));
     	 nome = request.getParameter("nome");
 		 funcao = request.getParameter("funcao");
 		 matricula = request.getParameter("matricula");	
 		 email = request.getParameter("email");
 		 senha = request.getParameter("senha");
 		
  			
			funcionario.setIdfuncionario(idfuncionario);
			funcionario.setMatricula(matricula);
			funcionario.setNome(nome);
			funcionario.setFuncao(funcao);
			funcionario.setEmail(email);
			funcionario.setSenha(senha);

			System.out.println("nome = " + nome);
			
		
		request.setAttribute("funcionario", funcionario);
		funcionario = funcionarioDAO.consultar_editar(funcionario);		
		destino = "/funcionario.jsp";	
		}
}