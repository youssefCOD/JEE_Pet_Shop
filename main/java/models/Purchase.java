package models;

public class Purchase {

	private int purchase_id;
	private int quantity;
	private int client_id;
	private Article article;
	
	public Purchase(){
		super();
	}

	public int getQuantity() {
		return quantity;
	}
	public void setQuantity(int quantity) {
		this.quantity = quantity;
	}
	public int getPurchase_id() {
		return purchase_id;
	}
	public void setPurchase_id(int order_id) {
		this.purchase_id = order_id;
	}
	public int getClient_id() {
		return client_id;
	}
	public void setClient_id(int user_id) {
		this.client_id = user_id;
	}
	public Article getArticle() {
		return article;
	}
	public void setArticle(Article article) {
		this.article = article;
	}
	public Purchase(int order_id, int user_id, Article article, int quantity) {
		this.purchase_id = order_id;
		this.client_id = user_id;
		this.article = article;
		this.quantity = quantity;
	}


}
