package clothes.dao.impl;

import java.util.ArrayList;
import java.util.List;

import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;
import org.springframework.transaction.annotation.Transactional;

import clothes.dao.OrderDAO;
import clothes.entity.Order;
import clothes.entity.OrderDetail;

@Transactional
public class OrderDAOImpl implements OrderDAO{

	private SessionFactory sessionFactory;

	public void setSessionFactory(SessionFactory sessionFactory) {
		this.sessionFactory = sessionFactory;
	}

	@Override
	public List<Order> getOrders(){
		Session session = sessionFactory.getCurrentSession();
		String hql = "FROM Order WHERE status != 3 ORDER BY orderTime DESC";
		Query query = session.createQuery(hql);
		List<Order> list = new ArrayList<Order>();
		for(Object q:query.list()) {
			list.add((Order) q);
		}
		return list;
	}
	
	@Override
	public List<Order> getOrder(int accountId){
		Session session = sessionFactory.getCurrentSession();
		String hql = "FROM Order WHERE account.accountId = :accountId ORDER BY orderTime DESC";
		Query query = session.createQuery(hql);
		query.setParameter("accountId", accountId);
		List<Order> list = new ArrayList<Order>();
		for(Object q:query.list()) {
			list.add((Order) q);
		}
		return list;
	}
	
	@Override
	public List<OrderDetail> getOrdersDetail(int ordersId){
		Session session = sessionFactory.getCurrentSession();
		String hql = "FROM OrderDetail WHERE order.ordersId = :ordersId";
		Query query = session.createQuery(hql);
		query.setInteger("ordersId", ordersId);
		List<OrderDetail> list = new ArrayList<OrderDetail>();
		for(Object q:query.list()) {
			list.add((OrderDetail) q);
		}
		return list;
	}
	@Override
	public boolean insertOrder(Order order) {
		Session session = sessionFactory.openSession();
		Transaction t = session.beginTransaction();
		try {
			session.save(order);
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
	public boolean insertOrderDetail(OrderDetail orderDetail) {
		Session session = sessionFactory.openSession();
		System.out.println(orderDetail.getPrice()+"-"+orderDetail.getQuantity()+"-"+orderDetail.getOrder()+"-"+orderDetail.getPrice()+"-"+orderDetail.getPrice()+"-");
		Transaction t = session.beginTransaction();
		try {
			session.save(orderDetail);
			t.commit();
			return true;
		} catch (Exception e) {
			System.out.println("err "+e);
			e.printStackTrace();
			t.rollback();
		} finally {
			session.close();
		}
		return false;
	}
	
	@Override
	public int updateStatus(int ordersId, int status) {
		Session session = sessionFactory.getCurrentSession();
		String hql = "UPDATE Order set status = :status "  + 
	             "WHERE ordersId = :ordersId";
		Query query = session.createQuery(hql);
		query.setParameter("ordersId", ordersId);
		query.setParameter("status", status);
		int result = query.executeUpdate();
		return result;
	}

	@Override
	public List<Order> getOrderAll() {
		Session session = sessionFactory.getCurrentSession();
		String hql = "FROM Order ORDER BY orderTime DESC";
		Query query = session.createQuery(hql);
		List<Order> list = new ArrayList<Order>();
		for(Object q:query.list()) {
			list.add((Order) q);
		}
		return list;
	}
}

