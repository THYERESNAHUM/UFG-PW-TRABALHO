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

@WebServlet(name = "ServletLogin", urlPatterns = "/login")
public class ServletLogin extends HttpServlet {

	private static final long serialVersionUID = 1L;

	private FuncionarioDAO funcionarioDAO = new FuncionarioDAO();
	private Funcionario funcionario = new Funcionario();
	private int idfuncionario;
	private String destino = "";
	private String acao;
	private String message;

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		login(request, response);

	}

	protected void login(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
			funcionario = funcionarioDAO.buscarPorMatricula(request.getParameter("login"));
			String senha = request.getParameter("senha");

			if (funcionario.getSenha() != null && funcionario.getSenha().equals(senha)) {
				HttpSession sessao = request.getSession();
				// setando um atributo da sessao
				sessao.setAttribute("nome", funcionario.getNome());
				destino = "/pagina_inicial.jsp";
				RequestDispatcher rd = request.getRequestDispatcher(destino);
				rd.forward(request, response);
			} else {
				message = "Falha no login, verifique os dados.";
				request.setAttribute("message", message);
				destino = "/index.jsp";
				RequestDispatcher rd = request.getRequestDispatcher(destino);
				rd.forward(request, response);
			}
		
	}

}
