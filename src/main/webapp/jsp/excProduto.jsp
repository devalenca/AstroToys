<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.util.ArrayList"%>
<%@ page import="java.util.List"%>
<%@ page import="br.edu.astrotoystore.model.Produto"%>
<%@ page import="br.edu.astrotoystore.model.Categoria"%>
<%@ page import="br.edu.astrotoystore.dao.CategoriaDAO"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>


<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>AstroToys Store</title>
		<meta name="viewport" content="width=device-width, initial-scale=1.0">
    	<meta name="description" content="">
    	<meta name="author" content="">
		
	<style type="text/css">
			*  {
		    margin:0;
		    padding:0;
		}
		
			body {
				font-family: Arial, Helvetica, sans-serif;
				padding-bottom: 100px;
			}
			
			/* Cabeçalho com banner */
			.header {
				height: 180px;
				background-image: url(./imgs/bannerUniverso.jpg);
				padding-bottom: 15px;
				align-content: center;
				text-align: center;
			}
			
			
			/* Menu sidebar */
			.sidebar {
				height: 100%;
				width: 220px;
				position: fixed;
				top: 0;
				left: 0;
				background-color: navy;
				padding-top: 30px;
				overflow-y: auto;
			}
			
			/* Menu: Titulo */
			.menuTitle {
				padding: 15px;
				font-size: 16px;
				color: #c234ea;
				font-weight: bold;
				display: block;
				text-align: center;
			}
			
			/* Menu: Links */
			.sidebar a {
				padding: 15px 25px;
				text-decoration: none;
				font-size: 16px;
				color: #fff;
				display: block;
			}
				
			/* Menu: Mudança de cor quando passar por cima dos links*/
			.sidebar a:hover {
				background-color: #9b26bb;
			}
			
			
			/* Menu: Area administrativa */
			.admArea {
				padding: 15px 25px;
				font-size: 16px;
				color: #fff;
				display: block;
				text-align: center;
			}
			
			/* Titulo principal da tela */
			.titulo {
				text-align: center;
				font-size: 40px;
				margin-left: 20%;
				padding-top: 20px;
			}
			
			/* Conteúdo principal da tela */
			.conteudo {
				margin-left: auto;
				padding: 3%;
				font-size: 16px;
				align-items: center;
				text-align: center;
				padding-top: 30px;
			}
			

			/* Botão */
			.btnset{
				font-family: sans-serif;
				border: none;
				padding: 1px 30px;
				font-size: 20px;
				outline: none;
				-webkit-transition-duration: 1s;
				transition-duration: 1s;
				background-color: rgb(23,52,89);
				color: white;
				box-shadow: .4px ,4px 1px 2px #000000;
			}
			
			/* Botão - hover */
			.btnset:hover{
				background-color: transparent;
				color: rgb(23,52,89);
				box-shadow: 1px 1px 2px 3px #000000;
			}
			
			/* Remover sublinhado dos links da tela */
			a:link {
				text-decoration: none;
			}
			
			/* Rodapé */
			.foot{	
				position: fixed;
			    bottom: 0;
			    left: 0;
			    width: 100%;
			    background-color: black; /* Cor de fundo do rodapé */
			    color: white; /* Cor do texto no rodapé */
			    padding: 1px; /* Espaçamento interno no rodapé */
			    text-align: center; /* Centraliza o conteúdo do rodapé */
				}
			

		    	/* Estilos para o form */
		       table {
		            width: 100%;
		            max-width: 700px; /* Define a largura máxima do formulário */
		            margin: 0 auto; /* Centralize o formulário horizontalmente */
		            border-collapse: collapse;
		            text-align: right;
		        }
		        
		        table th,
		        table td {
		            padding: 4px;
		            text-align: right;
		        }
		
		        table td input[type="text"],
		        table td input[type="email"],
		        table td input[type="password"],
		        table td textarea {
		            width: 100%;
		            padding: 8px;
		            border: 1px solid #7138c8; /* Cor da borda dos campos de entrada */
		            border-radius: 10px; /* Bordas arredondadas para campos de entrada */
		        }
			        
		</style>


	</head>

	<body>
		
		<!-- Cabeçalho/Banner -->
		<div class="header">
			<a href="./index.jsp"> <img src="./imgs/AstroToys.png" style="width: 130px; margin-left:250px; margin-top:25px"> </a>
			<span style="font-size: 80px; color: white; width: 100px; margin:15%;"> AstroToys Store</span>
		</div>
	
		<!-- Menu Sidebar -->
		<div class="sidebar">
			<div class="menuTitle"> 
			MENU PRINCIPAL</div><hr>
		    <a href="./index.jsp">Home</a>
		    <a href="./ServletCategoria?cmd=mostrarCategorias">Catálogo de brinquedos</a>
		    <a href="./jsp/integrantes.jsp">Sobre a equipe</a>
		    <br><br><hr>
	    
	    	<!-- Menu: Area do adm -->
		<div class="admArea">
		<div class="menuTitle">ÁREA ADMINISTRATIVA</div><br>
		    		<c:if test="${not empty username}">
						<p style="margin: 0px;" >
							Olá, <strong>${username}</strong>!  <br><a href="ServletLogin?cmd=logout">Sair</a>
						</p>
					</c:if>
	
					<c:if test="${empty username}">
						<p>
							<a href="http://localhost:8080/SistemaAcademico-web/ServletLogin?cmd=logar">Fazer Login</a>
						</p>
					</c:if>
					
					<c:if test="${not empty username}">
						<ul>
							<a href="./ServletProduto?cmd=mostrar">Administrar Produtos</a>
							<a href="./ServletCategoria?cmd=mostrar">Administrar Categorias</a>
							<a href="./ServletUsuario?cmd=mostrar">Administrar Usuários</a>
						</ul>
					</c:if>
			</div>
		</div>
	
	
			<!-- Conteúdo da página-->	
		<br><h1 class="titulo">Excluir produto</h1>
		<div class="conteudo">
		<br>
	          
	          <jsp:useBean id="produto" scope="session" class="br.edu.astrotoystore.model.Produto" />
	          
	          	<form action="ServletProduto?cmd=excluir" method="post">
					 <table>

						<tr>
						 	<input type="hidden" name="idProduto" value="<%=produto.getIdProduto()%>"/>
						 	<th><h4>Nome do produto:</h4></th>
							<td><input type="text" name="nomeProduto" size="10" maxlenght="10" value="<%=produto.getNomeProduto()%>" readonly="readonly"/></td>
						</tr>
							
						<tr>
							<th><h4>Código da categoria do produto:</h4></th>
							<td><input type="text" name="idCategoria" size="10" maxlenght="10" value="<%=produto.getIdCategoria()%>" readonly="readonly"/></td>
						</tr>
						
						<tr>
							<th><h4>Preço unitário:</h4></th>
							<td><input type="text" name="precoUnitario" size="10" maxlenght="10" value="<%=produto.getPrecoUnitario()%>" readonly="readonly"/></td>
						</tr>
							
						<tr>
							<th><h4>URL da imagem:</h4></th>
							<td><input type="text" name="imgProduto" size="10" maxlenght="10" value="<%=produto.getImgProduto()%>" readonly="readonly"/></td>
						</tr>
						
						<tr>	 
							<th><h4>Descrição do produto:</h4></th>
							<td><textarea name="descricao" style="width: 100%; height: 60px;" readonly="readonly"><%=produto.getDescricao()%></textarea></td>
						</tr>
						 
						 <tr>
							<td colspan="2" align="center"><br />
							<input type="submit" value="Excluir" class="btnset"></td>
						 </tr>
					</table>
				</form>
	          	
	          		          
	        </div>
	        
		<!-- Rodapé -->
		<footer class="foot">
			<p>
				&copy; Copyright 2023 |<a href="http://localhost:8080/SistemaAcademico-web/jsp/integrantes.jsp">
					Clique aqui </a>para conhecer a equipe AstroToys!
			</p>
		</footer>
	    
	</body>
</html>