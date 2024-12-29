package controllers;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import dao.ArticleDao;
import dao.CategorieDao;
import dao.ClientDao;
import dao.PurchaseDao;
import models.Article;
import models.Categorie;
import models.Client;
import models.Purchase;

//@WebServlet("/Controleur")
public class Controleur extends HttpServlet {

   private static final long serialVersionUID = 1L;
private ClientDao metierClient;
   private ArticleDao metierArticle;
   private CategorieDao metierCategorie;
   private PurchaseDao metierPurchase;

   @Override
   public void init() throws ServletException {
      metierClient = new ClientDao();
      metierArticle = new ArticleDao();
      metierCategorie = new CategorieDao();
      metierPurchase = new PurchaseDao();
   }

   @Override
protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
      String path = request.getServletPath();

      // Load categories and articles
      List<Categorie> categories = metierCategorie.getCategories();
      request.setAttribute("modelCategories", categories);

      List<Article> articles = metierArticle.getArticles();
      request.setAttribute("modelArticles", articles);

      HttpSession session = request.getSession();

      if (path.equals("/index.do")) {
         request.getRequestDispatcher("home.jsp").forward(request, response);
      }

      if (path.equals("/about.do")) {
         request.getRequestDispatcher("about.jsp").forward(request, response);
      }

      if (path.equals("/register.do")) {
         request.getRequestDispatcher("register.jsp").forward(request, response);
      } else if (path.equals("/reg.do") && (request.getMethod().equals("POST"))) {
         // Register a new client
         String pseudo = request.getParameter("username");
         String motDePasse = request.getParameter("password");
         String email = request.getParameter("email");
         String telephone = request.getParameter("phone");
         String societe = request.getParameter("company");
         String adresse = request.getParameter("adrres");

         Client client = new Client(pseudo, motDePasse, email, telephone, societe, adresse);
         metierClient.register(client);

         int id = metierClient.login(pseudo, motDePasse);
         String name = metierClient.getUser(id);
         session.setAttribute("userid", id);
         session.setAttribute("username", name);
         request.getRequestDispatcher("home.jsp").forward(request, response);
      } else if (path.equals("/myaccount.do")) {
         request.getRequestDispatcher("login.jsp").forward(request, response);
      } else if (path.equals("/login.do") && (request.getMethod().equals("POST"))) {
         // Handle login
         String pseudo = request.getParameter("username");
         String motDePasse = request.getParameter("password");
         int id = metierClient.login(pseudo, motDePasse);
         String name = metierClient.getUser(id);

         if (id == -1) {
            request.getRequestDispatcher("myaccount.do").forward(request, response);
         } else {
            session.setAttribute("userid", id);
            session.setAttribute("username", name);
            request.getRequestDispatcher("home.jsp").forward(request, response);
         }
      } else if (path.equals("/specials.do")) {
         request.getRequestDispatcher("specials.jsp").forward(request, response);
      } else if (path.equals("/articles.do")) {
         request.getRequestDispatcher("articles.jsp").forward(request, response);
      }

      if (path.equals("/contact.do")) {
         request.getRequestDispatcher("contact.jsp").forward(request, response);
      }

      if (path.equals("/logout.do")) {
         session.invalidate();
         request.getRequestDispatcher("home.jsp").forward(request, response);
      }

      if (path.contains("/details.do")) {
         int articleId = Integer.parseInt(request.getParameter("id"));
         for (Article article : articles) {
            if (article.getArticle_id() == articleId) {
               request.setAttribute("article_selected", article);
            }
         }
         request.getRequestDispatcher("detail.jsp").forward(request, response);
      }

      if (path.contains("/category.do")) {
         int categoryId = Integer.parseInt(request.getParameter("id"));
         List<Article> articlesByCategory = new ArrayList<>();
         for (Article article : articles) {
            if (article.getCategorie_id() == categoryId) {
               articlesByCategory.add(article);
               request.setAttribute("cat_selected", articlesByCategory);
            }
         }
         request.getRequestDispatcher("category.jsp").forward(request, response);
      }

      if (path.equals("/order.do")) {
         int clientId = Integer.parseInt(request.getParameter("userid"));
         int articleId = Integer.parseInt(request.getParameter("article_id"));

         metierPurchase.insertPurchase(clientId, articleId);

         request.getRequestDispatcher("home.jsp").forward(request, response);
      }

      if (path.equals("/cart.do")) {
         double total = 0;
         List<Purchase> purchases = metierPurchase.getPurchases();
         List<Article> articlesInCart = new ArrayList<>();
         int clientId = Integer.parseInt(request.getParameter("userid"));
         for (Purchase purchase : purchases) {
            if (purchase.getClient_id() == clientId) {
               for (Article article : articles) {
                  if (article.getArticle_id() == purchase.getArticle_id()) {
                     articlesInCart.add(article);
                     total += article.getPrix();
                  }
               }
            }
         }
         String formattedTotal = String.format("%.2f", total);
         request.setAttribute("total", formattedTotal);
         request.setAttribute("articlesInCart", articlesInCart);
         request.getRequestDispatcher("cart.jsp").forward(request, response);
      }
   }

   @Override
protected void doPost(HttpServletRequest request, HttpServletResponse response)
         throws ServletException, IOException {
      doGet(request, response);
   }
}
