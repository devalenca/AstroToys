package br.edu.astrotoystore.dao;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;

import br.edu.astrotoystore.model.Categoria;
import br.edu.astrotoystore.util.ConnectionFactory;


public class CategoriaDAO {
	private Connection conn;
	private PreparedStatement ps;
	private ResultSet rs;
	private Categoria categoria;

	public CategoriaDAO() throws Exception {
		try {
			this.conn = br.edu.astrotoystore.util.ConnectionFactory.getConnection();
		} catch (Exception e) {
			throw new Exception("erro: \n" + e.getMessage());
		}
	}

	// método de salvar
	public void salvar(Categoria categoria) throws Exception {
		
		if (categoria == null)
			throw new Exception("O valor passado nao pode ser nulo");
		
		try {
			
			String SQL = "INSERT INTO categoria (nomeCategoria, faixa_etaria, imgCategoria) values (?, ?, ?)";
			conn = this.conn;			
			ps = conn.prepareStatement(SQL);
			
			ps.setString(1, categoria.getNomeCategoria());
			ps.setString(2, categoria.getFaixa_etaria());
			ps.setString(3, categoria.getImgCategoria());
			
			
			ps.executeUpdate();
			
		} catch (SQLException sqle) {
			throw new Exception("Erro ao inserir dados " + sqle);
			
		} finally {
			br.edu.astrotoystore.util.ConnectionFactory.closeConnection(conn, ps);
		}
	}

	// método de atualizar
	public void atualizar(Categoria categoria) throws Exception {
		if (categoria == null)
			throw new Exception("O valor passado nao pode ser nulo");
		
		try {
			String SQL = "UPDATE categoria SET nomeCategoria=?, faixa_etaria=?, imgCategoria=? WHERE idCategoria = ?";						
			conn = this.conn;			
			ps = conn.prepareStatement(SQL);
			
			ps.setString(1, categoria.getNomeCategoria());
			ps.setString(2, categoria.getFaixa_etaria());
			ps.setString(3, categoria.getImgCategoria());
			ps.setInt(4, categoria.getIdCategoria());
			ps.executeUpdate();
			
		} catch (SQLException sqle) {
			throw new Exception("Erro ao alterar dados " + sqle);
		} finally {
			ConnectionFactory.closeConnection(conn, ps);
		}
	}

	// método de excluir
	public void excluir(Categoria categoria) throws Exception {
		if (categoria == null)
			throw new Exception("O valor passado nao pode ser nulo");
		
		try {
			String SQL = "DELETE FROM categoria WHERE idCategoria = ?";
			conn = this.conn;			
			ps = conn.prepareStatement(SQL);
			
			ps.setInt(1, categoria.getIdCategoria());
			ps.executeUpdate();
			
		} catch (SQLException sqle) {
			throw new Exception("Erro ao excluir dados " + sqle);
			
		} finally {
			ConnectionFactory.closeConnection(conn, ps);
		}
	}	

	public Categoria procurarCategoria(int idCategoria) throws Exception {
		try {
			String SQL = "SELECT * FROM categoria WHERE idCategoria = ?";
			conn = this.conn;
			ps = conn.prepareStatement(SQL);
			ps.setInt(1, idCategoria);
			rs = ps.executeQuery();
						
			if (rs.next()) {				
				int idCategoria_ms = rs.getInt("idCategoria");
				String nomeCategoria = rs.getString("nomeCategoria");
				String faixa_etaria = rs.getString("faixa_etaria");
				String imgCategoria = rs.getString("imgCategoria");
				categoria = new Categoria(idCategoria_ms,nomeCategoria,faixa_etaria, imgCategoria);
			}
			
			return categoria;
			
		} catch (SQLException sqle) {
			throw new Exception(sqle);
			
		} finally {
			ConnectionFactory.closeConnection(conn, ps, rs);
		}
	}
	
	// listar todos os produtos
	public List todasCategorias() throws Exception {
		try {
			conn = this.conn;
			ps = conn.prepareStatement("SELECT * FROM categoria");
			rs = ps.executeQuery();
			List<Categoria> list = new ArrayList<Categoria>();
			
			while (rs.next()) {
				int idCategoria = rs.getInt("idCategoria");
				String nomeCategoria = rs.getString("nomeCategoria");
				String faixa_etaria = rs.getString("faixa_etaria");
				String imgCategoria = rs.getString("imgCategoria");
				list.add(new Categoria(idCategoria, nomeCategoria,faixa_etaria, imgCategoria));
			}			
			return list;
			
		} catch (SQLException sqle) {
			throw new Exception(sqle);
		} finally {
			ConnectionFactory.closeConnection(conn, ps, rs);
		}
	}
	
}
