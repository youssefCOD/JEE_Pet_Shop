package dao;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import models.Purchase;

public class PurchaseDao {
  public List < Purchase > getPurchases() {
    List < Purchase > purchases = new ArrayList < Purchase > ();

    Connection connection = SingletonConnection.getConnection();
    try {
      PreparedStatement ps = connection.prepareStatement("SELECT * FROM `purchase`");
      ResultSet rs = ps.executeQuery();

      while (rs.next()) {
        Purchase purchase = new Purchase();
        purchase.setClient_id(rs.getInt("client_id"));
        purchase.setArticle_id(rs.getInt("article_id"));
        purchase.setPurchase_id(rs.getInt("purchase_id"));

        purchases.add(purchase);

      }
      ps.close();

    } catch (SQLException e) {
      e.printStackTrace();
    }
    return purchases;
  }

  public void insertPurchase(int user_id, int pet_id) {
    Connection connection = SingletonConnection.getConnection();
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