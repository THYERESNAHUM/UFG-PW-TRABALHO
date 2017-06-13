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
	private String nome;
	private String funcao;
	private String matricula;
	private String email;
	private String senha;
	private String message = "";

	
	protected void doGet(HttpServletRequest request,
			HttpServletResponse response) throws ServletException, IOException {		
				
	}

	protected void doPost(HttpServletRequest request,
			HttpServletResponse response) throws ServletException, IOException {	

		buscarfuncionario(request, response);
		
		
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
			
			RequestDispatcher rd = request.getRequestDispatcher("/c_funcionario.jsp");
	 	     rd.forward(request, response);
	     }
	}  
        protected void consultareditarfuncionario(HttpServletRequest request,
    		    HttpServletResponse response) throws ServletException, IOException {

        	String nome = request.getParameter("nome");
    		String funcao = request.getParameter("funcao");
    		String matricula = request.getParameter("matricula");	
    		String email = request.getParameter("email");
    		String senha = request.getParameter("senha");	
     			
			funcionario.setIdfuncionario(idfuncionario);
			funcionario.setMatricula(matricula);
			funcionario.setNome(nome);
			funcionario.setFuncao(funcao);
			funcionario.setEmail(email);
			funcionario.setSenha(senha);

		
		request.setAttribute("funcionario", funcionario);
		funcionario = funcionarioDAO.consultar_editar(funcionario);		
		RequestDispatcher rd = request.getRequestDispatcher("/funcionario.jsp");
	     rd.forward(request, response);
		}
}