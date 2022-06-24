package clothes.entity;
import java.io.Serializable;

import javax.persistence.Column;
import javax.persistence.Embeddable;

@Embeddable
public class CartKey implements Serializable{
	
	private static final long serialVersionUID = 1L;
	
	@Column(name="accountid")	
	private int accountId;
	
	@Column(name="productid")
	private int productId;
	
	public CartKey() {
		super();
	}
	public CartKey(int accountId, int productId) {
		super();
		this.accountId = accountId;
		this.productId = productId;
	}
	public int getAccountId() {
		return accountId;
	}

	public void setAccountId(int accountId) {
		this.accountId = accountId;
	}

	public int getProductId() {
		return productId;
	}

	public void setProductId(int productId) {
		this.productId = productId;
	}
}
