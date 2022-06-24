package clothes.entity;

import javax.persistence.Column;
import javax.persistence.EmbeddedId;
import javax.persistence.Entity;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.MapsId;
import javax.persistence.Table;

@Entity
@Table(name="ORDER_DETAIL")
public class OrderDetail {
	@EmbeddedId
	private OrderDetailKey orderDetailId;
	
	@Column(name="quantity")
	private int quantity;
	
	@Column(name="price")
	private int price;
	
	@ManyToOne
	@MapsId("productid")
	@JoinColumn(name="productid")
	private Product product;
	
	@ManyToOne
	@MapsId("ordersid")
	@JoinColumn(name="ordersid")
	private Order order;

	// Setter and getter
	public OrderDetailKey getOrderDetailId() {
		return orderDetailId;
	}

	public void setOrderDetailId(OrderDetailKey orderDetailId) {
		this.orderDetailId = orderDetailId;
	}

	public int getQuantity() {
		return quantity;
	}

	public void setQuantity(int quantity) {
		this.quantity = quantity;
	}

	public int getPrice() {
		return price;
	}

	public void setPrice(int price) {
		this.price = price;
	}

	public Product getProduct() {
		return product;
	}

	public void setProduct(Product product) {
		this.product = product;
	}

	public Order getOrder() {
		return order;
	}

	public void setOrder(Order order) {
		this.order = order;
	}
	
}
