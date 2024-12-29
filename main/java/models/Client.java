package models;

import java.io.Serializable;

public class Client implements Serializable {
	private static final long serialVersionUID = 1L;
	private int client_id;
	private String pseudonom;
	private String mot_de_pass;
	private String email;
	private String telephone;
	private String societe;
	private String addresse;

	
	public Client( String username, String password, String email, String phone, String company,
			String adrres) {
		super();
		this.pseudonom = username;
		this.mot_de_pass = password;
		this.email = email;
		this.telephone = phone;
		societe = company;
		addresse = adrres;
	}

	public Client() {
		super();
		// TODO Auto-generated constructor stub
	}

	public int getClient_id() {
		return client_id;
	}

	public void setClient_id(int user_id) {
		this.client_id = user_id;
	}

	public String getPseudonom() {
		return pseudonom;
	}

	public void setPseudonom(String username) {
		this.pseudonom = username;
	}

	public String getMot_de_pass() {
		return mot_de_pass;
	}

	public void setMot_de_pass(String password) {
		this.mot_de_pass = password;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public String getTelephone() {
		return telephone;
	}

	public void setTelephone(String phone) {
		this.telephone = phone;
	}

	public String getSociete() {
		return societe;
	}

	public void setSociete(String company) {
		societe = company;
	}

	public String getAddresse() {
		return addresse;
	}

	public void setAddresse(String adrres) {
		addresse = adrres;
	}
    
	
	
}
