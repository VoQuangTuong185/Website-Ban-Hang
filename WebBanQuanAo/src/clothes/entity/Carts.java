package clothes.entity;

import javax.persistence.Column;
import javax.persistence.EmbeddedId;
import javax.persistence.Entity;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.MapsId;
import javax.persistence.Table;

@Entity
@Table(name="CART")
public class Carts {

	@EmbeddedId
	private CartKey cartId;	
	
	@Column(name="quantity")
	private int quantity;
	
	@ManyToOne
	@MapsId("productid")
	@JoinColumn(name="productId")
	private Product product;
	
	@ManyToOne
	@MapsId("accountid")
	@JoinColumn(name="accountid")
	private Account account;
	
	// Setter and getter
	public CartKey getCartId() {
		return cartId;
	}

	public void setCartId(CartKey cartId) {
		this.cartId = cartId;
	}

	public int getQuantity() {
		return quantity;
	}

	public void setQuantity(int quantity) {
		this.quantity = quantity;
	}

	public Product getProduct() {
		return product;
	}

	public void setProduct(Product product) {
		this.product = product;
	}

	public Account getAccount() {
		return account;
	}

	public void setAccount(Account account) {
		this.account = account;
	}
}
