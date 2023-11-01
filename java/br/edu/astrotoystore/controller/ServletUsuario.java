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

import br.edu.astrotoystore.model.Usuario;
import br.edu.astrotoystore.dao.UsuarioDAO;

@WebServlet("/ServletUsuario")
public class ServletUsuario extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void processRequest(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.setContentType("text/html; charset=UTF-8");
		
		String cmd = request.getParameter("cmd");		
		UsuarioDAO dao;
		Usuario usuario = new Usuario();
						
		try {
			dao = new UsuarioDAO();
			RequestDispatcher rd = null;
			
			if (cmd.equalsIgnoreCase("mostrar")) {
				List<Usuario> usuarioList = dao.todosUsuarios();
				request.setAttribute("usuarioList", usuarioList);
				rd = request.getRequestDispatcher("./jsp/listUsuario.jsp");
			}
						
			else if (cmd.equalsIgnoreCase("incluir")) {
				usuario.setNome(request.getParameter("nome"));
				usuario.setUsername(request.getParameter("username"));
				usuario.setSenha(request.getParameter("senha"));
				dao.salvar(usuario);
				rd = request.getRequestDispatcher("ServletUsuario?cmd=mostrar");
			} 
				
			else if (cmd.equalsIgnoreCase("exc")) {
				usuario = dao.procurarUsuario(Integer.parseInt(request.getParameter("id")));
				HttpSession session = request.getSession(true);
				session.setAttribute("usuario", usuario);
				rd = request.getRequestDispatcher("./jsp/excUsuario.jsp");
			}
			
			else if (cmd.equalsIgnoreCase("excluir")) {
				usuario.setIdUsuario(Integer.parseInt(request.getParameter("idUsuario")));
				dao.excluir(usuario);
				rd = request.getRequestDispatcher("ServletUsuario?cmd=mostrar");
				
			} 
			
			else if (cmd.equalsIgnoreCase("atu")) {
				usuario = dao.procurarUsuario(Integer.parseInt(request.getParameter("id")));
				HttpSession session = request.getSession(true);
				session.setAttribute("usuario", usuario);
				rd = request.getRequestDispatcher("./jsp/altUsuario.jsp");
				
			} 
			
			else if (cmd.equalsIgnoreCase("atualizar")) {
				usuario.setIdUsuario(Integer.parseInt(request.getParameter("idUsuario")));
				usuario.setNome(request.getParameter("nome"));
				usuario.setUsername(request.getParameter("username"));
				usuario.setSenha(request.getParameter("senha"));				
				dao.atualizar(usuario);
				rd = request.getRequestDispatcher("ServletUsuario?cmd=mostrar");
				
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
