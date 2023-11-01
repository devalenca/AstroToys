<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.util.ArrayList"%>
<%@ page import="java.util.List"%>
<%@ page import="br.edu.astrotoystore.model.Produto"%>
<%@ page import="br.edu.astrotoystore.model.Categoria"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<!DOCTYPE html>
<html>
	<head>
	<meta charset="UTF-8">
			<title>Astro Toys Store</title>
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
				margin-left: center;
				padding: 3%;
				font-size: 16px;
				align-items: center;
				text-align: center; /* Centralizar horizontalmente */
    			display: flex;
    			justify-content: center; /* Centralizar horizontalmente */
			}

			/* Estilo para os produtos */
			.cardProdutos {
				margin-left: 10%;
				padding: 30px;
				text-align: right;
				display: inline-block;
			}
			
			/* Estilo para a imagem dos produtos */
			.cardProdutos img {
				max-width: 400px; /* Redimensionar a largura da imagem */
			}
			
			/* Botão detalhes */
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
			
			/* Botão detalhes - hover */
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
			
			/*TENTATIVA*/
        /* Estilos para a div de detalhes do produto */
        .produto-detalhes {
            background-color: #fff;
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.2);
            display: flex;
            padding: 20px;
            text-align: left;
        }

        /* imagem do produto */
        .produto-imagem img {
            max-width: 400px;
        }

        /* informações do produto */
        .produto-info {
            padding: 10px;
            margin: 30px;
        }

        .produto-info h1 {
            font-size: 30px;
            font-weight: bold;
            color: navy;
            text-align: center;
        }

        .produto-info .descricao {
            font-size: 18px;
            color: #3a3c42;
            max-width: 300px; /* Define a largura máxima para a descrição */
        }

        .produto-info .preco {
            font-size: 45px;
            font-weight: bold;
        }

        .produto-info .codigo {
            font-size: 15px;
        }

        /* botão "voltar" */
        .botao-voltar button {
            background-color: #831d91;
            color: #fff;
            padding: 10px 20px;
            font-size: 20px;
            border: none;
            cursor: pointer;      
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


	<jsp:useBean id="produto" scope="session"
		class="br.edu.astrotoystore.model.Produto" />
		
	<jsp:useBean id="categoria" scope="session"
		class="br.edu.astrotoystore.model.Categoria" />
		
		
		
		<h1 class="titulo">Detalhes do produto</h1>
		<!-- Conteúdo da página-->
		<div class="conteudo">
		
				<!-- Detalhes do produto-->
	<div class="produto-detalhes">
        <div class="produto-imagem">
            <img src="<%=produto.getImgProduto()%>">
        </div>
        <div class="produto-info">
            <h1><%=produto.getNomeProduto()%></h1><br>
            <p class="descricao"><%=produto.getDescricao()%></p><br><br>
            <p class="preco">R$<%=produto.getPrecoUnitario()%>0</p>
            <p class="codigo">Código: <%=produto.getIdProduto()%></p>
            <p class="codigo">Categoria: <%=produto.getIdCategoria()%></p><br><br>
            <div class="botao-voltar">
            <p>
			<a class="btnset" href="http://localhost:8080/SistemaAcademico-web/index.jsp" style="text-decoration: none;"> &laquo; Voltar</a>
			</p>
            </div>
            
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