package br.edu.astrotoystore.controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import br.edu.astrotoystore.model.Categoria;
import br.edu.astrotoystore.dao.CategoriaDAO;

@WebServlet("/ServletCategoria")
public class ServletCategoria extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    protected void processRequest(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
    	response.setContentType("text/html; charset=UTF-8");
		
		String cmd = request.getParameter("cmd");
		CategoriaDAO dao;
		Categoria categoria = new Categoria();
				
		try {
			dao = new CategoriaDAO();
			RequestDispatcher rd = null;
			 
			if (cmd.equalsIgnoreCase("mostrar")) {
				List<Categoria> categoriaList = dao.todasCategorias();
				request.setAttribute("categoriaList", categoriaList);
				rd = request.getRequestDispatcher("./jsp/listCategoria.jsp");
			}
						
			else if (cmd.equalsIgnoreCase("incluir")) {
				categoria.setNomeCategoria(request.getParameter("nomeCategoria"));
				categoria.setFaixa_etaria(request.getParameter("faixa_etaria"));
				categoria.setImgCategoria(request.getParameter("imgCategoria"));
				dao.salvar(categoria);
				rd = request.getRequestDispatcher("ServletCategoria?cmd=mostrar");
			}
			else if (cmd.equalsIgnoreCase("mostrarCategorias")) {
				List<Categoria> categoriaList = dao.todasCategorias();
				request.setAttribute("categoriaList", categoriaList);
				rd = request.getRequestDispatcher("./jsp/categorias.jsp");
			}
				
			else if (cmd.equalsIgnoreCase("exc")) {
				categoria = dao.procurarCategoria(Integer.parseInt(request.getParameter("id")));
				HttpSession session = request.getSession(true);
				session.setAttribute("categoria", categoria);
				rd = request.getRequestDispatcher("./jsp/excCategoria.jsp");
			} 
			
			else if (cmd.equalsIgnoreCase("excluir")) {	
				categoria.setIdCategoria(Integer.parseInt(request.getParameter("idCategoria")));
				dao.excluir(categoria);
				rd = request.getRequestDispatcher("ServletCategoria?cmd=mostrar");
				
			} 
			
			else if (cmd.equalsIgnoreCase("atu")) {
				categoria = dao.procurarCategoria(Integer.parseInt(request.getParameter("id")));
				HttpSession session = request.getSession(true);
				session.setAttribute("categoria", categoria);
				rd = request.getRequestDispatcher("./jsp/altCategoria.jsp");
				
			} 
			
			else if (cmd.equalsIgnoreCase("atualizar")) {
				categoria.setIdCategoria(Integer.parseInt(request.getParameter("idCategoria")));
				categoria.setNomeCategoria(request.getParameter("nomeCategoria"));
				categoria.setFaixa_etaria(request.getParameter("faixa_etaria"));
				categoria.setImgCategoria(request.getParameter("imgCategoria"));
				dao.atualizar(categoria);
				rd = request.getRequestDispatcher("ServletCategoria?cmd=mostrar");
				
			} 
						
			rd.forward(request, response);
			
		} catch (Exception e) {
			e.printStackTrace();
			throw new ServletException(e);
		}
	}
	

    @Override
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		processRequest(request, response);
	}

	@Override
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		processRequest(request, response);
	}

}
