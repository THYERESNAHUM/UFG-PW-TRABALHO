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
import javax.servlet.http.HttpSession;

import model.FuncionarioDAO;
import model.Funcionario;

@WebServlet(name="ServletAutenticaUsuario", urlPatterns = "/autentica")
public class ServletAutenticaUsuario extends HttpServlet {
	
	private static final long serialVersionUID = 1L;
	private String usuario;
	private String senha;
	private String destino = "";

	
	protected void doGet(HttpServletRequest request,
			HttpServletResponse response) throws ServletException, IOException {
					
	}

	protected void doPost(HttpServletRequest request,
			HttpServletResponse response) throws ServletException, IOException {	
			FuncionarioDAO funcionarioDAO = new FuncionarioDAO();
			Funcionario funcionario = new Funcionario();
			HttpSession sessao = request.getSession();			
			usuario = request.getParameter("usuario");
			senha = request.getParameter("senha");			
			
			if ((usuario!= "" && usuario!=null) && (senha!= "" && senha!=null)) {
				
				funcionario.setMatricula(usuario);
				funcionario.setSenha(senha);
				funcionario = funcionarioDAO.consulta_autentica(funcionario);
				System.out.println(funcionario.getNome());
				System.out.println(funcionario.getFuncao());			
				System.out.println(funcionario.getMatricula());
				System.out.println(funcionario.getSenha());
				System.out.println(sessao.getAttribute("statuslogin"));
					
				try {
					if (!funcionario.getNome().equals("") || !funcionario.getNome().equals(null)){
						        sessao.setAttribute("statuslogin", true);					      
						      	destino = "/pagina_inicial.jsp";
								//response.sendRedirect(destino);
						    } else {
						      sessao.setAttribute("statuslogin", false);
						      destino = "/index.jsp";
						     
						    }
				}catch(NullPointerException n){					  	
				}
					
			}
			RequestDispatcher rd = request.getRequestDispatcher(destino);
		    rd.forward(request, response);
	}

}
