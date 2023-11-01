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
				background-image: url(../imgs/bannerUniverso.jpg);
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
			
			

        	/* Estilo para a imagem dos integrantes */
	        .integrantes {
	        	font-family: Arial, Helvetica, sans-serif;
	            font-size: 20px;
	        	text-align: center;
	        	margin-left: 25%;
	            padding: 20px;
	            display: inline-block;
			}
        
	        .integrantes img{
	        	border-radius: 50%;
	        	width: 200px;
	        	height: 200px;
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
		    padding: 0px; /* Espaçamento interno no rodapé */
		    text-align: center; /* Centraliza o conteúdo do rodapé */
			}

    	</style>
</head>

	<body>

		<!-- Cabeçalho/Banner -->
		<div class="header">
			<a href="../index.jsp"> <img src="../imgs/AstroToys.png" style="width: 130px; margin-left:250px; margin-top:25px"> </a>
			<span style="font-size: 80px; color: white; width: 100px; margin:15%;"> AstroToys Store</span>
		</div>
		
		<!-- Menu Sidebar -->
		<div class="sidebar">
			<div class="menuTitle"> 
			MENU PRINCIPAL</div><hr>
		    <a href="../index.jsp">Home</a>
		    <a href="../ServletCategoria?cmd=mostrarCategorias">Catálogo de brinquedos</a>
		    <a href="integrantes.jsp">Sobre a equipe</a>
		    <br><br><hr>
	    
	    	<!-- Menu: Area do adm -->
		    <div class="admArea">
		    <div class="menuTitle">ÁREA ADMINISTRATIVA</div><br>
		    		<c:if test="${not empty username}">
						<p style="margin: 0px;" >
							Olá, <strong>${username}</strong>!  
							<br><a href="ServletLogin?cmd=logout">Sair</a>
						</p>
					</c:if>
	
					<c:if test="${empty username}">
						<p>
							<a href="http://localhost:8080/SistemaAcademico-web/ServletLogin?cmd=logar">Fazer Login</a>
						</p>
					</c:if>
					
					<c:if test="${not empty username}">
						<ul>
							<a href="../ServletProduto?cmd=mostrar">Administrar Produtos</a>
							<a href="../ServletCategoria?cmd=mostrar">Administrar Categorias</a>
							<a href="../ServletUsuario?cmd=mostrar">Administrar Usuários</a>
						</ul>
					</c:if>
			</div>
		</div>
				
		<!-- Conteúdo da página-->		
		<h1 class= "titulo">Conheça os integrantes da nossa equipe!</h1>
		
		<div class="integrantes">
							  <table>
							    <tr>
						      	<td class="integrantes" ><img  src="../imgIntegrantes/elizeu.jpeg"></td>
							      <td colspan="3"  width="500"><b>Elizeu Antunes de Oliveira Araujo</b></td>
							      <td> RGM:30053081</td>
							    </tr >
							     <tr>
							      <td class="integrantes" ><img src="../imgIntegrantes/alencar.jpg"></td>
							      <td colspan="3" width="300"><b>Gabriel Alencar Nunes Ferreira</b></td>
							      <td>RGM:30078369</td>
							    </tr>
							    <tr>
							      <td class="integrantes" > <img src="../imgIntegrantes/jeff.jpg"></td>
							      <td colspan="3"  width="300"><b>Jefferson Apolinário Araújo Silva  </b></td>
							      <td>RGM:30081068</td>
							    </tr>
								<tr>
							      <td  class="integrantes" ><img src="../imgIntegrantes/luiza.jpg"></td>
							      <td colspan="3"  width="300"><b>Luiza Caroline Carvalho Ribeiro</b></td>
							      <td>RGM:29319137</td>
							    </tr>
							    <tr >
							      <td  class="integrantes" ><img src="../imgIntegrantes/cerroni.jpg"></td>
							      <td colspan="3"  width="300"><b>Gabriel Cerroni Fabiani de Oliveira</b></td>
							      <td>RGM:30124379</td>
							    </tr>
							</table>
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