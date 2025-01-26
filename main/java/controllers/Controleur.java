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
        HttpSession session = request.getSession();

        loadCommonData(request);

        switch (path) {
            case "/index.do":
                request.getRequestDispatcher("home.jsp").forward(request, response);
                break;
            case "/about.do":
                request.getRequestDispatcher("about.jsp").forward(request, response);
                break;
            case "/register.do":
                request.getRequestDispatcher("register.jsp").forward(request, response);
                break;
            case "/myaccount.do":
                request.getRequestDispatcher("login.jsp").forward(request, response);
                break;
            case "/specials.do":
                request.getRequestDispatcher("specials.jsp").forward(request, response);
                break;
            case "/articles.do":
                request.getRequestDispatcher("articles.jsp").forward(request, response);
                break;
            case "/contact.do":
                request.getRequestDispatcher("contact.jsp").forward(request, response);
                break;
            case "/logout.do":
                session.invalidate();
                request.getRequestDispatcher("home.jsp").forward(request, response);
                break;
            case "/details.do":
                handleDetails(request, response);
                break;
            case "/order.do":
                handleOrder(request, response);
                break;
            case "/category.do":
                handleCategory(request, response);
                break;
            case "/cart.do":
                handleCart(request, response);
                break;
            default:
                response.sendError(HttpServletResponse.SC_NOT_FOUND, "Page not found");
                break;
        }
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String path = request.getServletPath();
        HttpSession session = request.getSession();

        switch (path) {
            case "/reg.do":
                handleRegistration(request, response, session);
                break;
            case "/login.do":
                handleLogin(request, response, session);
                break;
            case "/order.do":
                handleOrder(request, response);
                break;
            default:
                doGet(request, response);
                break;
        }
    }

    // Load categories and articles for all pages
    private void loadCommonData(HttpServletRequest request) {
        List<Categorie> categories = metierCategorie.getCategories();
        List<Article> articles = metierArticle.getArticles();
        request.setAttribute("modelCategories", categories);
        request.setAttribute("modelArticles", articles);
    }

    // Handle details page
    private void handleDetails(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        int articleId = Integer.parseInt(request.getParameter("id"));
        List<Article> articles = metierArticle.getArticles();
        Article selectedArticle = null;

        for (Article article : articles) {
            if (article.getArticle_id() == articleId) {
                selectedArticle = article;
                break;
            }
        }

        request.setAttribute("article_selected", selectedArticle);
        request.getRequestDispatcher("detail.jsp").forward(request, response);
    }

    // Handle category page
    private void handleCategory(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        int categoryId = Integer.parseInt(request.getParameter("id"));
        List<Article> articles = metierArticle.getArticles();
        List<Article> articlesByCategory = new ArrayList<>();

        for (Article article : articles) {
            if (article.getCategorie_id() == categoryId) {
                articlesByCategory.add(article);
            }
        }

        request.setAttribute("cat_selected", articlesByCategory);
        request.getRequestDispatcher("category.jsp").forward(request, response);
    }

    private void handleCart(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        int clientId = Integer.parseInt(request.getParameter("userid"));
        List<Purchase> purshases = metierPurchase.getPurchases();


        request.setAttribute("purshases", purshases);
        int totalCount = 0;
        double total = 0;
        
        for(Purchase p : purshases) {
        	int quantity = p.getQuantity();
        	total += p.getArticle().getPrix() * quantity;
        	totalCount += quantity;
        }
        request.setAttribute("totalCount", totalCount);
        request.setAttribute("total", total);
        request.getRequestDispatcher("cart.jsp").forward(request, response);
    }

    private void handleRegistration(HttpServletRequest request, HttpServletResponse response, HttpSession session) throws ServletException, IOException {
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
    }

    private void handleLogin(HttpServletRequest request, HttpServletResponse response, HttpSession session) throws ServletException, IOException {
        String pseudo = request.getParameter("username");
        String motDePasse = request.getParameter("password");
        int id = metierClient.login(pseudo, motDePasse);

        if (id == -1) {
            request.getRequestDispatcher("myaccount.do").forward(request, response);
        } else {
            String name = metierClient.getUser(id);
            session.setAttribute("userid", id);
            session.setAttribute("username", name);
            request.getRequestDispatcher("/index.do").forward(request, response);
        }
    }

    private void handleOrder(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        int clientId = Integer.parseInt(request.getParameter("userid"));
        int articleId = Integer.parseInt(request.getParameter("article_id"));
        metierPurchase.insertPurchase(clientId, articleId);
        handleCart(request, response);
    }
}