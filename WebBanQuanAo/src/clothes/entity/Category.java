package clothes.entity;

import java.util.Collection;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.OneToMany;
import javax.persistence.Table;

@Entity
@Table(name = "CATEGORY")
public class Category {
	@Id
	@GeneratedValue
	@Column(name="categoryid")
	private int categoryId;
	
	@Column(name="categoryname")
	private String categoryname;
	
	public Collection<Product> getProducts() {
		return Products;
	}

	public void setProducts(Collection<Product> products) {
		Products = products;
	}

	@OneToMany(mappedBy = "category", fetch=FetchType.EAGER)
	private Collection<Product> Products;

	public int getCategoryId() {
		return categoryId;
	}

	public void setCategoryId(int categoryId) {
		this.categoryId = categoryId;
	}

	public String getCategoryname() {
		return categoryname;
	}

	public void setCategoryname(String categoryname) {
		this.categoryname = categoryname;
	}

	public Collection<Product> getProductids() {
		return Products;
	}

	public void setProductids(Collection<Product> productids) {
		this.Products = productids;
	}
}
