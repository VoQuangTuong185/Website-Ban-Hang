package clothes.dao;

import java.util.List;
import clothes.entity.Carts;

public interface CartDAO {
	Carts getCartProduct(int id_pro, String mail);
	List<Carts> getCarts(String mail);
	boolean addCart(int id_pro, String mail, int quantity);
	boolean deleteCart(int id, String mail);
	boolean editCart(int id_pro, String mail, int quantity);
	boolean insert(Carts cart); 
	boolean delete(Carts cart); 
	boolean update(Carts cart);
	int updateSL(int productId, int sl);
	 boolean deleteALLCart(String mail);
	 public Carts get(int accountId, int productId);
}
