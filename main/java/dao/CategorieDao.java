package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import models.Categorie;

public class CategorieDao {

  public List<Categorie> getCategories() {

    List<Categorie> categories = new ArrayList<>();

    Connection connection = SingletonConnection.getConnection();
    try {
      PreparedStatement ps = connection.prepareStatement("SELECT * FROM categories");
      ResultSet rs = ps.executeQuery();
      while (rs.next()) {
        Categorie categorie = new Categorie();
        categorie.setCategorie_id(rs.getInt("categorie_id"));
        categorie.setNom_categorie(rs.getString("nom_categorie"));
        categories.add(categorie);
      }
      ps.close();

    } catch (SQLException e) {
      e.printStackTrace();
    }
    return categories;
  }
}