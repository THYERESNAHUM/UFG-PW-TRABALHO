package controller;

import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import model.VisitaDAO;
import model.Visita;

@WebServlet(name="ServletBuscaNoMapa", urlPatterns = "/buscavisitamapa")
public class ServletBuscaNoMapa extends HttpServlet {
	
	private static final long serialVersionUID = 1L;
	
	private VisitaDAO visitaDAO = new VisitaDAO();
	private Visita visita = new Visita();
	private int idvisita;
	private String destino = "";
	private String acao;
	private String message;
	private String textopesquisa1; 
	private String textopesquisa2; 
	private String textopesquisa3;
	private String textopesquisa4;	
		
	protected void doPost(HttpServletRequest request,
			HttpServletResponse response) throws ServletException, IOException {	
			
			request.setCharacterEncoding("UTF8");
			buscarvisitamapa(request, response);
			RequestDispatcher rd = request.getRequestDispatcher(destino);
	     	rd.forward(request, response);
		
	}
	protected void buscarvisitamapa(HttpServletRequest request,
		    HttpServletResponse response) throws ServletException, IOException {

			textopesquisa1 = request.getParameter("txtpesquisa1");
			textopesquisa2 = request.getParameter("txtpesquisa2");		
			textopesquisa3 = request.getParameter("txtpesquisa3");
			textopesquisa4 = request.getParameter("txtpesquisa4");	
			List<Visita> listavisita = new ArrayList<Visita>();
			
	        if((textopesquisa1!="" && textopesquisa1!=null)
	        		|| (textopesquisa2!="" && textopesquisa2!=null)
	        		|| (textopesquisa3!="" && textopesquisa3!=null)
	        		|| (textopesquisa4!="" && textopesquisa4!=null)){

				    		
				listavisita = visitaDAO.listarmapa(textopesquisa1, textopesquisa2, textopesquisa3, textopesquisa4);				
		     }else{
		    	listavisita = visitaDAO.listarmapa();	
		     }	 
	        request.setAttribute("listavisita", listavisita);
			destino = "/mapa_foco.jsp";
	}  
	
}
