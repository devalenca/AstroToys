package br.edu.astrotoystore.model;

public class Categoria {
	private int idCategoria;
	private String nomeCategoria;
	private String faixa_etaria;
	private String imgCategoria;
	
	public Categoria(int idCategoria, String nomeCategoria,String faixa_etaria,String imgCategoria ) {
		this.idCategoria = idCategoria;
		this.nomeCategoria = nomeCategoria;
		this.faixa_etaria = faixa_etaria;
		this.imgCategoria = imgCategoria;
	}
	
	public Categoria() {

	}

	public int getIdCategoria() {
		return idCategoria;
	}

	public void setIdCategoria(int idCategoria) {
		this.idCategoria = idCategoria;
	}

	public String getNomeCategoria() {
		return nomeCategoria;
	}

	public void setNomeCategoria(String nomeCategoria) {
		this.nomeCategoria = nomeCategoria;
	}


	public String getFaixa_etaria() {
		return faixa_etaria;
	}

	public void setFaixa_etaria(String faixa_etaria) {
		this.faixa_etaria = faixa_etaria;
	}
	
	public String getImgCategoria() {
		return imgCategoria;
	}

	public void setImgCategoria(String imgCategoria) {
		this.imgCategoria = imgCategoria;
	}

	
	
}
