<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="UTF-8"%>
	<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
	
	
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>AstroToys Store</title>

		<script type="text/javascript">
			function validarLogin() {
				if (document.formLogin.username.value == "") {
					swal("Usuário não informado. Tente novamente");
					return false;
				}
				if (document.formLogin.senha.value == "") {
					swal("Senha não informada. Tente novamente");
					return false;
				}
				document.formLogin.submit();
			}
		</script>

	<style type="text/css">
			*  {
		    margin:0;
		    padding:0;
		}
			
			body {
				font-family: Arial, Helvetica, sans-serif;
				padding-bottom: 100px;
				align-content: center;
			}
			
			/* Cabeçalho com banner */
			.header {
				height: 180px;
				background-image: url(imgs/bannerUniverso.jpg);
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
				margin-left: 15%;
				padding: 3%;
				font-size: 16px;
				align-items: center;
			}
			
			
			/* Botões */
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
		
		
			/* Formulário de login */
       		form{
			    margin: 0 auto;
	            max-width: 500px;
	            text-align: center;
	            background-color: white;
	            padding: 10px;
	            border-radius: 10px;
	            box-shadow: 0 0 20px rgba(0, 0, 0, 0.1);
			}
		
			form input[type="submit"]{
				cursor:pointer;
			}
			
			form a {
				font-size: 15px;
				color: navy;
				font-weight: bold;
			}
		
			
			.login{
				outline: none;
				padding: 10px;
				border: none;
				border-bottom: 2px solid #0076ff;
				border-radius: 10px;
				margin: 5px;
			}
			
		


	</style>

</head>
<body>

		<!-- Cabeçalho/Banner -->
		<div class="header">
			<a href="http://localhost:8080/SistemaAcademico-web/index.jsp"> <img src="imgs/AstroToys.png" style="width: 130px; margin-left:250px; margin-top:25px"> </a>
			<span style="font-size: 80px; color: white; width: 100px; margin:15%;"> AstroToys Store</span>
		</div>
		
		<!-- Menu Sidebar -->
		<div class="sidebar">
			<div class="menuTitle"> 
			MENU PRINCIPAL</div><hr>
		    <a href="index.jsp">Home</a>
		    <a href="http://localhost:8080/SistemaAcademico-web/ServletCategoria?cmd=mostrarCategorias">Catálogo de brinquedos</a>
		    <a href="http://localhost:8080/SistemaAcademico-web/jsp/integrantes.jsp">Sobre a equipe</a>
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
							<a href="../ServletProduto?cmd=mostrar">Administrar Produtos</a>
							<a href="../ServletCategoria?cmd=mostrar">Administrar Categorias</a>
							<a href="../ServletUsuario?cmd=mostrar">Administrar Usuários</a>
						</ul>
					</c:if>
			</div>
		</div>

		<!-- Conteúdo da página-->
		<br><h2 class="titulo">Entre com a sua conta administrativa</h2>
		<div class="conteudo">
		
		<!-- Formulário de login-->	
		<form action="http://localhost:8080/SistemaAcademico-web/ServletLogin?cmd=logar" method="post" name="formLogin">
			Usuário:<input type="text" name="username" placeholder="Usuário" class="login" required><br>
			Senha:<input type="password" name="senha" placeholder="Senha" class="login"  required><br> 
			<br><input type="submit" value="Entrar" class="btn" onclick="validarLogin()"> 
			<br><br><a href="http://localhost:8080/SistemaAcademico-web/ServletProduto?cmd=listar" ><img border="0" src="icon/ico_login.png" width="25" height="20">  <br>VOLTAR</a>
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



