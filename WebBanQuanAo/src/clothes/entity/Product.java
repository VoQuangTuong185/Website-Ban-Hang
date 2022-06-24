package clothes.entity;

import java.util.Collection;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.OneToMany;
import javax.persistence.Table;

@Entity
@Table(name = "PRODUCT")
public class Product {
	@Id
	@GeneratedValue
	@Column(name = "productid")
	private int productId;
	
	@Column(name = "productname")
	private String productname;

	@Column(name = "price")
	private int price;

	@Column(name = "review")
	private String review;
	
	@Column(name = "discount")
	private int discount;
	
	public int getDiscount() {
		return discount;
	}
	@Column(name = "images")
	private String images;
	public String getImages() {
		return images;
	}

	public void setImages(String images) {
		this.images = images;
	}

	public void setDiscount(int discount) {
		this.discount = discount;
	}

	@Column(name = "status")
	private int status;
	
	@ManyToOne
	@JoinColumn(name = "categoryid")
	private Category category;

	public int getStatus() {
		return status;
	}

	public void setStatus(int status) {
		this.status = status;
	}
	
	@Column(name = "available")
	private int available;

	@OneToMany(mappedBy = "product", fetch = FetchType.EAGER)
	private Collection<OrderDetail> orderDetails;

	public int getAvailable() {
		return available;
	}

	public void setAvailable(int available) {
		this.available = available;
	}

	@OneToMany(mappedBy = "product", fetch = FetchType.EAGER)
	private Collection<Carts> carts;

	public int getProductId() {
		return productId;
	}

	public void setProductId(int productId) {
		this.productId = productId;
	}

	public String getProductname() {
		return productname;
	}

	public void setProductname(String productname) {
		this.productname = productname;
	}

	public int getPrice() {
		return price;
	}

	public void setPrice(int price) {
		this.price = price;
	}

	public String getReview() {
		return review;
	}

	public void setReview(String review) {
		this.review = review;
	}

	public Category getCategory() {
		return category;
	}

	public void setCategory(Category category) {
		this.category = category;
	}

	public Collection<OrderDetail> getOrderDetails() {
		return orderDetails;
	}

	public void setOrderDetails(Collection<OrderDetail> orderDetails) {
		this.orderDetails = orderDetails;
	}

	public Collection<Carts> getCarts() {
		return carts;
	}

	public void setCarts(Collection<Carts> carts) {
		this.carts = carts;
	}
	
}
