# AstroToys

## Ambiente configurado com:

* JRE 1.8.0_301

* Apache Tomcat v9.0

* Connector mysql 5.1.15-bin

* jstl 1.2

**Obs**: não se esqueça de configurar seu banco de dados no arquivo [ConnectionFactory.java](/java/br/edu/astrotoystore/util/ConnectionFactory.java)

**Obs(2)**: o repositório deve estar dentro de uma pasta nomeada como "SistemaAcademico-web"


Antes de inciar o projeto execute o seguinte código SQL:
```SQL
DROP DATABASE astrotoy;
CREATE DATABASE astrotoy;
use astrotoy;

-- Criação da tabela Categoria
CREATE TABLE Categoria (
    idCategoria INT AUTO_INCREMENT PRIMARY KEY,
    nomeCategoria VARCHAR(300) NOT NULL,
    faixa_etaria VARCHAR(50),
    imgCategoria VARCHAR(255)
);

-- Criação da tabela Produto
-- idCategoria, nomeProduto, precoUnitario, imgProduto, descricao
CREATE TABLE Produto (
    idProduto INT AUTO_INCREMENT PRIMARY KEY,
    idCategoria INT,
    nomeProduto VARCHAR(255) NOT NULL,
    precoUnitario DECIMAL(10, 2) NOT NULL,
    imgProduto VARCHAR(300),
    descricao TEXT,
    FOREIGN KEY (idCategoria) REFERENCES Categoria(idCategoria)
);

-- Criação da tabela Usuario
CREATE TABLE Usuario (
    idUsuario INT AUTO_INCREMENT PRIMARY KEY,
    nome VARCHAR(255) NOT NULL,
    username VARCHAR(50) NOT NULL,
    senha VARCHAR(255) NOT NULL
);

INSERT INTO usuario (nome, username, senha) VALUES ("Admin", "admin", "admin#@123!")
```

### Tela inicial com os produtos cadastrados

![WhatsApp Image 2023-10-31 at 22 54 22](https://github.com/devalenca/AstroToys/assets/117116076/0fafd3e1-352d-4e13-92b1-2b06ff910476)
