package br.edu.astrotoystore.controller;

import java.io.IOException;
import java.sql.Date;
import java.text.DateFormat;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.List;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import br.edu.astrotoystore.model.Produto;
import br.edu.astrotoystore.dao.ProdutoDAO;

@WebServlet("/ServletProduto")
public class ServletProduto extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void processRequest(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.setContentType("text/html; charset=UTF-8");
		
		String cmd = request.getParameter("cmd");
		ProdutoDAO dao;
		Produto produto = new Produto();
				
		try {
			dao = new ProdutoDAO();
			RequestDispatcher rd = null;
			 
			if (cmd.equalsIgnoreCase("listar")) {
				List<Produto> produtoList = dao.todosProdutos();
				request.setAttribute("produtoList", produtoList);		// cria uma sessão para encaminhar a lista para uma JSP
				rd = request.getRequestDispatcher("./jsp/produtos.jsp");		// redireciona para a JSP produtos
			}
			
			else if (cmd.equalsIgnoreCase("mostrar")) {
				List<Produto> produtoList = dao.todosProdutos();
				request.setAttribute("produtoList", produtoList);
				rd = request.getRequestDispatcher("./jsp/listProduto.jsp");
			}
			
			else if (cmd.equalsIgnoreCase("incluir")) {
				produto.setNomeProduto(request.getParameter("nomeProduto"));
				produto.setIdCategoria(Integer.parseInt(request.getParameter("idCategoria")));
				produto.setPrecoUnitario(Double.parseDouble(request.getParameter("precoUnitario")));
				produto.setImgProduto(request.getParameter("imgProduto"));
				produto.setDescricao(request.getParameter("descricao"));
				dao.salvar(produto);
				rd = request.getRequestDispatcher("ServletProduto?cmd=mostrar");
			} 
						
			else if (cmd.equalsIgnoreCase("exc")) { 	// consulta produto para exclusão
				produto = dao.procurarProduto(Integer.parseInt(request.getParameter("id")));
				HttpSession session = request.getSession(true);
				session.setAttribute("produto", produto);
				rd = request.getRequestDispatcher("./jsp/excProduto.jsp");
			} 
			
			else if (cmd.equalsIgnoreCase("excluir")) {	// exclui produto
				produto.setIdProduto(Integer.parseInt(request.getParameter("idProduto")));
				dao.excluir(produto);
				rd = request.getRequestDispatcher("ServletProduto?cmd=mostrar");
				
			} 
			
			else if (cmd.equalsIgnoreCase("atu")) {		// consulta produto para alterar
				produto = dao.procurarProduto(Integer.parseInt(request.getParameter("id")));
				HttpSession session = request.getSession(true);
				session.setAttribute("produto", produto);
				rd = request.getRequestDispatcher("./jsp/altProduto.jsp");
				
			} 
			
			else if (cmd.equalsIgnoreCase("atualizar")) {	// altera produto
				produto.setIdProduto(Integer.parseInt(request.getParameter("idProduto")));
				produto.setNomeProduto(request.getParameter("nomeProduto"));
				produto.setIdCategoria(Integer.parseInt(request.getParameter("idCategoria")));
				produto.setPrecoUnitario(Double.parseDouble(request.getParameter("precoUnitario")));
				produto.setImgProduto(request.getParameter("imgProduto"));
				produto.setDescricao(request.getParameter("descricao"));
				dao.atualizar(produto);
				rd = request.getRequestDispatcher("ServletProduto?cmd=mostrar");
				
			} 
			
			else if (cmd.equalsIgnoreCase("consultar")) {	// consulta produto
				String paramValue = request.getParameter("idProduto");
				produto = dao.procurarProduto(Integer.parseInt(paramValue));
				HttpSession session = request.getSession(true);
				session.setAttribute("produto", produto);
				rd = request.getRequestDispatcher("./jsp/detalhes.jsp");				
			}
			
			else if (cmd.equalsIgnoreCase("listarCategoria")) {
				String paramValue = request.getParameter("idCategoria");
				List<Produto> produtoList = dao.listarProdutosCategoriaX(Integer.parseInt(paramValue));
				request.setAttribute("produtoList", produtoList);		// cria uma sessão para encaminhar a lista para uma JSP
				rd = request.getRequestDispatcher("./jsp/produtosCategoriaX.jsp");		// redireciona para a JSP produtos
			}
			
						
			// executa a açao de direcionar para a página JSP
			rd.forward(request, response);
			
		} catch (Exception e) {
			e.printStackTrace();
			throw new ServletException(e);
		}
	}
	

    @Override
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		processRequest(request, response);
	}

	@Override
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		processRequest(request, response);
	}

}
