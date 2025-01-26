package dao;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import models.Article;
import models.Purchase;

public class PurchaseDao {
  public List <Purchase> getPurchases() {
    List <Purchase> purchases = new ArrayList<>();

    Connection connection = Database.getConnection();
    try {
    	PreparedStatement ps = connection.prepareStatement("SELECT purchase.*, articles.* FROM purchase JOIN articles ON articles.article_id = purchase.article_id");
    	ResultSet rs = ps.executeQuery();

      while (rs.next()) {
        Purchase purchase = new Purchase();
        purchase.setClient_id(rs.getInt("client_id"));
        Article a = new Article();
        a.setCategorie_id(rs.getInt("categorie_id"));
        a.setArticle_id(rs.getInt("article_id"));
        a.setDescription(rs.getString("description"));
        a.setPhoto(rs.getString("photo"));
        a.setStatus(rs.getNString("status"));
        a.setPrix(rs.getDouble("prix"));
        a.setNom(rs.getString("nom"));
        
        purchase.setPurchase_id(rs.getInt("purchase_id"));
        purchase.setArticle(a);
        purchase.setQuantity(rs.getInt("quantity"));
        purchases.add(purchase);

      }
      ps.close();

    } catch (SQLException e) {
      e.printStackTrace();
    }
    return purchases;
  }

  public void insertPurchase(int user_id, int pet_id) {
    Connection connection = Database.getConnection();
    try {
      PreparedStatement ps = connection.prepareStatement("INSERT INTO `purchase` ( `client_id`, `article_id`) VALUES (?,?)");

      ps.setInt(1, user_id);
      ps.setInt(2, pet_id);
      ps.executeUpdate();
      System.out.println("insert");
      ps.close();

    } catch (SQLException e) {
      e.printStackTrace();
    }

  }

}