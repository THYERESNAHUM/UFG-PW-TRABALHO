package controller;


import java.io.IOException;
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
		String nome = request.getParameter("nome");
		String funcao = request.getParameter("funcao");
		String matricula = request.getParameter("matricula");	
		String email = request.getParameter("email");
		String senha = request.getParameter("senha");	
		
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
		RequestDispatcher rd = request.getRequestDispatcher("/c_funcionario.jsp");
        rd.forward(request, response);
        doGet(request, response);
		
	}				
	
}