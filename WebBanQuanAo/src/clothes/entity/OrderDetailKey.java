package clothes.entity;

import java.io.Serializable;

import javax.persistence.Column;

public class OrderDetailKey implements Serializable{
	private static final long serialVersionUID = 1L;
	@Column(name="ordersid")
	private int ordersId;
	
	@Column(name="productid")
	private int productId;
	
	public OrderDetailKey() {
		
	}
	
	public OrderDetailKey(int ordersId, int productId) {
		super();
		this.ordersId = ordersId;
		this.productId = productId;
	}
}
