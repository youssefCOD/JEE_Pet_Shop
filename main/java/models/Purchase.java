package models;

public class Purchase {

	private int purchase_id;
	private int client_id;
	private int article_id;
	
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
	public int getArticle_id() {
		return article_id;
	}
	public void setArticle_id(int pet_id) {
		this.article_id = pet_id;
	}
	public Purchase() {
		super();
		// TODO Auto-generated constructor stub
	}
	public Purchase(int order_id, int user_id, int pet_id) {
		super();
		this.purchase_id = order_id;
		this.client_id = user_id;
		this.article_id = pet_id;
	}

	
}
