package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import models.Client;

public class ClientDao {

	public Client register(Client u) {
		Connection connection = SingletonConnection.getConnection();
		try {
			PreparedStatement ps = connection.prepareStatement(
					"INSERT INTO clients (pseudo, mot_de_passe, email, telephone, societe, adresse) VALUES (?,?,?,?,?,?)");
			ps.setString(1, u.getPseudonom());
			ps.setString(2, u.getMot_de_pass());
			ps.setString(3, u.getEmail());
			ps.setString(4, u.getTelephone());
			ps.setString(5, u.getSociete());
			ps.setString(6, u.getAddresse());
			ps.executeUpdate();
			PreparedStatement ps2 = connection.prepareStatement("SELECT MAX(client_id) AS MAX_ID FROM clients");
			ResultSet rs = ps2.executeQuery();
			if (rs.next()) {
				u.setClient_id(rs.getInt("MAX_ID"));
			}
			ps.close();

		} catch (SQLException e) {
			e.printStackTrace();
		}
		return u;
	}

	public int login(String user, String pass) {
		int id = -1;
		Connection connection = SingletonConnection.getConnection();
		try {
			PreparedStatement ps = connection.prepareStatement(
					"SELECT client_id AS MAX_ID FROM clients where pseudo like ? and  mot_de_passe like ?");
			ps.setString(1, user);
			ps.setString(2, pass);

			ResultSet rs = ps.executeQuery();
			if (rs.next()) {
				id = rs.getInt("MAX_ID");
			}
			ps.close();

		} catch (SQLException e) {
			e.printStackTrace();
		}

		return id;
	}

	public String getUser(int id) {
		String name = "";
		Connection connection = SingletonConnection.getConnection();
		try {
			PreparedStatement ps = connection.prepareStatement("SELECT  username FROM clients where client_id = ?");
			ps.setInt(1, id);

			ResultSet rs = ps.executeQuery();
			if (rs.next()) {
				name = rs.getString("pseudo");
			}
			ps.close();

		} catch (SQLException e) {
			e.printStackTrace();
		}

		return name;
	}

}
