package clothes.dao.impl;

import java.util.List;

import javax.transaction.Transactional;
import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;

import clothes.dao.AccountDAO;
import clothes.dao.CartDAO;
import clothes.dao.ProductDAO;
import clothes.entity.Carts;
import clothes.entity.Product;
import clothes.entity.Account;
import clothes.entity.CartKey;

@Transactional
@Qualifier("cartDAO")
public class CartDAOImpl implements CartDAO {
	@Autowired
	private AccountDAO accountDAO;
	
	@Autowired
	private ProductDAO productDAO;
	
	private SessionFactory sessionFactory;
	
	public void setSessionFactory(SessionFactory sessionFactory) {
		this.sessionFactory = sessionFactory;
	}
	
	@Override
	public List<Carts> getCarts(String mail) {
		Account acc = accountDAO.findByEmail(mail); 
		int id = acc.getAccountId(); 
		Session session = sessionFactory.getCurrentSession(); 
		String hql = "FROM Carts WHERE account = :id";
		Query query = session.createQuery(hql);
		query.setInteger("id", id);
		@SuppressWarnings("unchecked")
		List<Carts> list = query.list();
		return list;
	}
	
	@Override
	public Carts getCartProduct(int id_pro, String mail) {
		List<Carts> list = this.getCarts(mail);
		for (Carts cart : list) {
			if (cart.getProduct().getProductId() == id_pro) {
				return cart;
			}
		}
		return null;
	}

	@Override
	public boolean insert(Carts cart) {
		Session session = sessionFactory.openSession();
		Transaction t = session.beginTransaction();
		try {
			session.save(cart);
			t.commit();
			return true;
		} catch (Exception e) {
			e.printStackTrace();
			t.rollback();
		} finally {
			session.close();
		}
		return false;
	}

	@Override
	public boolean delete(Carts cart) {
		Session session = sessionFactory.openSession();
		Transaction t = session.beginTransaction();
		try {
			session.delete(cart);
			t.commit();
			return true;
		} catch (Exception e) {
			e.printStackTrace();
			t.rollback();
		} finally {
			session.close();
		}
		return false;
	}

	@Override
	public boolean update(Carts cart) {
		Session session = sessionFactory.openSession();
		Transaction t = session.beginTransaction();
		try {
			session.update(cart);
			t.commit();
			return true;
		} catch (Exception e) {
			e.printStackTrace();
			t.rollback();
		} finally {
			session.close();
		}
		return false;
	}

	@Override
	public boolean addCart(int id_pro, String mail, int quantity) {
		List<Carts> list = this.getCarts(mail);
		for (Carts cart : list) {
			if (cart.getProduct().getProductId() == id_pro) {
				cart.setQuantity(cart.getQuantity()+quantity);
				return true;
			}
		}
		Product prod = productDAO.getProductId(id_pro);
		Account acc = accountDAO.findByEmail(mail);
		CartKey key = new CartKey(acc.getAccountId(),id_pro);
		Carts cart = new Carts();
		cart.setAccount(acc);
		cart.setProduct(prod);
		cart.setQuantity(quantity);
		cart.setCartId(key);
		boolean add = this.insert(cart);
		return add;
	}

	@Override
	public boolean deleteCart(int id_pro, String mail) {
		Carts cart = this.getCartProduct(id_pro, mail);
		if (cart == null) {
			return false;
		}
		boolean delete = this.delete(cart);
		return delete;
	}
	
	@Override
	public boolean deleteALLCart(String mail) {//xoá lúc khách hàng bấm thanh toán
		List<Carts> list = this.getCarts(mail);//chuyển dữ liệu sang table order và xoá ở cart 
		for (Carts cart : list) {
			boolean delete = this.delete(cart);
			if (delete==false) {
				return false;
			}
		}
		return true;
	}

	@Override
	public boolean editCart(int id_pro, String mail, int quantity) {
		List<Carts> list = this.getCarts(mail);
		for (Carts cart : list) {
			if (cart.getProduct().getProductId() == id_pro) {
				cart.setQuantity(quantity);
				return true;
			}
		}
		return false;
	}
	@Override
	public int updateSL(int productId, int sl) {
		Session session = sessionFactory.getCurrentSession();
		String hql = "UPDATE Carts set quantity = :sl " + "WHERE product.productId = :productId";
		Query query = session.createQuery(hql);
		query.setParameter("productId", productId);
		query.setParameter("sl", sl);
		int result = query.executeUpdate();
		return result;
	}
	@Override
	public Carts get(int accountId, int productId) {
		Session session = sessionFactory.getCurrentSession();
		String hql = "FROM Carts WHERE account.accountId = :accountId AND product.productId = :productId";
		Query query = session.createQuery(hql);
		query.setInteger("accountId", accountId);
		query.setInteger("productId", productId);
		Carts cart = (Carts) query.uniqueResult();
		return cart;
	}
}
