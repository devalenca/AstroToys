<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="java.util.ArrayList"%>
<%@ page import="java.util.List"%>
<%@ page import="br.edu.astrotoystore.model.Produto"%>
<%@ page import="br.edu.astrotoystore.model.Categoria"%>
<%@ page import="br.edu.astrotoystore.dao.CategoriaDAO"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>


<!DOCTYPE html>
<html>
	<head>
	<meta charset="UTF-8">
	<title>AstroToys Store</title>
	<meta name="viewport" content="width=device-width, initial-scale=1.0">
	
	
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
				color: black;
				margin-left: 20%;
				padding-top: 20px;
			}
			
			/* Conteúdo principal da tela */
			.conteudo {
				margin-left: auto;
				padding: 3%;
				font-size: 16px;
				align-items: center;
				text-align: center; /* Centralizar horizontalmente */
    			display: flex;
    			justify-content: center; /* Centralizar horizontalmente */
			}
			
			/* Botões */
			.btnset{
				font-family: sans-serif;
				border: none;
				padding: 3px 30px;
				font-size: 20px;
				outline: none;
				-webkit-transition-duration: 1s;
				transition-duration: 1s;
				background-color: rgb(23,52,89);
				color: white;
				box-shadow: .4px ,4px 1px 2px #000000;0
				text-align: center; /* Centralizar horizontalmente */
    			display: flex;
    			justify-content: center; /* Centralizar horizontalmente */
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
		
		
			/* Estilo pro card das categorias */
			.card > img{
			display: inline-block;;
			max-width: 100%;
			margin: 0px;
			box-shadow: 0 0px 10px rgba(0,0,0, 0.30), 0 1px 11px rgba(0,0,0,0.22)
			}
			
			/* Animação quando passar por cima da categoria */
			.card:hover img {
				-moz-transform: scale(1.1);
				-webkit-transform: scale(1.1);
				transform: scale(1.1);
			}
			
    	</style>
	</head>


	<body>

		<!-- Cabeçalho/Banner -->
		<div class="header">
			<a href="index.jsp"> <img src="./imgs/AstroToys.png" style="width: 130px; margin-left:250px; margin-top:25px"> </a>
			<span style="font-size: 80px; color: white; width: 100px; margin:15%;"> AstroToys Store</span>
		</div>
		
		<!-- Menu Sidebar -->
		<div class="sidebar">
			<div class="menuTitle"> 
			MENU PRINCIPAL</div><hr>
		    <a href="index.jsp">Home</a>
		    <a href="ServletCategoria?cmd=mostrarCategorias">Catálogo de brinquedos</a>
		    <a href="jsp/integrantes.jsp">Sobre a equipe</a>
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
		<br><h1 class="titulo">Categorias</h1>
		
		<div class="conteudo">
					<div style="width: 900px;">
						<div style="padding-left: 220px; ">
							<%
								CategoriaDAO dao;
								Categoria categoria = new Categoria();
								dao = new CategoriaDAO();
		
								List<Categoria> listaCad = new ArrayList<Categoria>();
								listaCad = (ArrayList) dao.todasCategorias();
								for (Categoria c : listaCad) {
								%>
		
							<div style="margin: 10px; padding-top: 20px; display: inline-block; ">
								
									<p style="width: 180px; height: 150px;" class="card"><img src="<%=c.getImgCategoria()%>"></p>
									<br><br>
									<p><a class="btnset" href="http://localhost:8080/SistemaAcademico-web/ServletProduto?cmd=listarCategoria&idCategoria=<%=c.getIdCategoria()%>"><%=c.getNomeCategoria()%></a></p>
								
							</div>
							<%
							}
							%>
		
						</div>
					</div>
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