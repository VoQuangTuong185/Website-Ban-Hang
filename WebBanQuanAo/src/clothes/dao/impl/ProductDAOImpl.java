package clothes.dao.impl;

import java.util.ArrayList;
import java.util.Collections;
import java.util.Comparator;
import java.util.List;

import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;
import org.springframework.transaction.annotation.Transactional;

import clothes.dao.ProductDAO;
import clothes.entity.Product;
import clothes.utils.Constants;

@Transactional
public class ProductDAOImpl implements ProductDAO {

	private SessionFactory sessionFactory;

	public void setSessionFactory(SessionFactory sessionFactory) {
		this.sessionFactory = sessionFactory;
	}

	@Override
	public List<Product> listProducts() {
		Session session = sessionFactory.getCurrentSession();
		@SuppressWarnings("unchecked")
		List<Product> list = session.createQuery("FROM Product ORDER BY productId DESC").list();
		return list;
	}
	
	@Override
	public Product getDiscount(String discount) {
		Session session = sessionFactory.getCurrentSession();
		String hql = "FROM Product"+" WHERE discount = :discount";
		Query query = session.createQuery(hql);
		query.setParameter("discount", discount);
		Product getDiscount = (Product) query.uniqueResult();
		return getDiscount;
	}
	
	@Override
	public List<Product> listProductsGiamGia() {
		Session session = sessionFactory.getCurrentSession();
		@SuppressWarnings("unchecked")
		List<Product> list = session.createQuery("FROM Product WHERE status = 0 ORDER BY discount DESC").list();
		return list;
	}

	@Override
	public List<Product> listProductsInCategory(int category) {
		Session session = sessionFactory.getCurrentSession();
		@SuppressWarnings("unchecked")
		List<Product> list = session.createQuery("FROM Product WHERE status = 0 and categoryId=" + category +" ORDER BY productId DESC").list();
		return list;
	}
	@Override
	public List<Product> listProductsAll(boolean getAll) {
		List<Product> list = new ArrayList<Product>();

		if (!getAll) {
			for (Product f : listProducts()) {
				if (f.getStatus() == 0)
					list.add(f);
			}
		} else {
			list = listProducts();
		}
		return list;
	}

	public List<Product> filterByKeyword(List<Product> allproduct, String keyword) {
		List<Product> list = new ArrayList<Product>();

		for (Product productId : allproduct) {
			if (productId.getProductname().toLowerCase().contains(keyword.toLowerCase())) {
				list.add(productId);
			}
		}
		return list;
	}

	public List<Product> filterByCategory(List<Product> allproduct, int category) {
		List<Product> list = new ArrayList<Product>();

		for (Product productId : allproduct) {
			if (productId.getCategory().getCategoryId() == category) {
				list.add(productId);
			}
		}
		return list;
	}

	@Override
	public Product getProductId(int id) {
		Session session = sessionFactory.getCurrentSession();
		Product productId = (Product) session.createQuery("FROM Product WHERE ProductId=" + id).uniqueResult();
		return productId;
	}

	@Override
	public boolean insert(Product product) {
		Session session = sessionFactory.openSession();
		Transaction t = session.beginTransaction();
		try {
			session.save(product);
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
	public boolean update(Product product) {
		Session session = sessionFactory.openSession();
		Transaction t = session.beginTransaction();
		try {
			session.update(product);
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
	public boolean delete(Product product) {
		Session session = sessionFactory.openSession();
		Transaction t = session.beginTransaction();
		try {
			session.delete(product);
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
}
