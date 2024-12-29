package models;

public class Article {
	int article_id;
	private String description;
	private int categorie_id;
	private String photo;
	private String status;
	private double prix;
	private String nom;

	public Article(String pet_name, String pet_description, int pet_category_id, String pet_images, String pet_status,
			double price) {
		super();

		this.description = pet_description;
		this.categorie_id = pet_category_id;
		this.photo = pet_images;
		this.status = pet_status;
		this.nom = pet_name;
		this.prix = price;
	}
	public int getArticle_id() {
		return article_id;
	}
	public String getNom() {
		return nom;
	}
	public void setNom(String pet_name) {
		this.nom = pet_name;
	}
	public void setArticle_id(int pet_id) {
		this.article_id = pet_id;
	}
	public String getDescription() {
		return description;
	}
	public void setDescription(String pet_description) {
		this.description = pet_description;
	}
	public int getCategorie_id() {
		return categorie_id;
	}
	public void setCategorie_id(int pet_category_id) {
		this.categorie_id = pet_category_id;
	}
	public Article() {
		super();
		// TODO Auto-generated constructor stub
	}
	public String getPhoto() {
		return photo;
	}
	public void setPhoto(String pet_images) {
		this.photo = pet_images;
	}
	public String getStatus() {
		return status;
	}
	public void setStatus(String pet_status) {
		this.status = pet_status;
	}
	public double getPrix() {
		return prix;
	}
	public void setPrix(double price) {
		this.prix = price;
	}

}
