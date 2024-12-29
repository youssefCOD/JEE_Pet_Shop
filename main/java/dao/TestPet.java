package dao;

import java.util.List;

import models.Purchase;

public class TestPet {
	
	
	public static void main(String[] args) {
		PurchaseDao dao =new PurchaseDao();
				
		List<Purchase> produits= dao.getPurchases();
		
		for (Purchase p : produits) {
			System.out.println(p.getPurchase_id());
			
		}
	}

}
