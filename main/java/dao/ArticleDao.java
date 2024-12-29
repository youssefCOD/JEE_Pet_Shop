package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import models.Article;

public class ArticleDao {
  public List<Article> getArticles() {
    List<Article> pets = new ArrayList<>();

    Connection connection = SingletonConnection.getConnection();
    try {
      PreparedStatement ps = connection.prepareStatement("SELECT * FROM articles");
      ResultSet rs = ps.executeQuery();

      while (rs.next()) {
        Article pet = new Article();
        pet.setNom(rs.getString("nom"));
        pet.setArticle_id(rs.getInt("article_id"));
        pet.setDescription(rs.getString("description"));
        pet.setCategorie_id(rs.getInt("categorie_id"));
        pet.setPhoto(rs.getString("photo"));
        pet.setStatus(rs.getString("status"));
        pet.setPrix(rs.getDouble("prix"));
        pets.add(pet);

      }
      ps.close();

    } catch (SQLException e) {
      e.printStackTrace();
    }
    return pets;
  }

}