package models;

public class Categorie {
	int categorie_id;
	String nom_categorie;
	
	public Categorie(int pet_category_id, String pet_category_name) {
		super();
		this.categorie_id = pet_category_id;
		this.nom_categorie = pet_category_name;
	}
	
	public int getCategorie_id() {
		return categorie_id;
	}
	public void setCategorie_id(int pet_category_id) {
		this.categorie_id = pet_category_id;
	}
	public Categorie() {
		super();
		// TODO Auto-generated constructor stub
	}

	public String getNom_categorie() {
		return nom_categorie;
	}
	public void setNom_categorie(String pet_category_name) {
		this.nom_categorie = pet_category_name;
	}
	
}
