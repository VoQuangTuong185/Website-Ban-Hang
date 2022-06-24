package clothes.entity;

import java.util.Date;
import java.util.Collection;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.OneToMany;
import javax.persistence.Table;
import javax.persistence.Temporal;
import javax.persistence.TemporalType;

@Entity
@Table(name="ACCOUNT")
public class Account {
	@Id
	@GeneratedValue
	@Column(name="accountid")
	private int accountId;
	
	@Column(name="fullname")
	private String fullname;
	
	@Column(name="password")
	private String password;
	
	@Column(name="phone")
	private String phone;
	
	@Column(name="email")
	private String email;
	
	@Column(name="address")
	private String address;
	
	@Column(name="type")
	private String type;
	
	public String getType() {
		return type;
	}

	public void setType(String type) {
		this.type = type;
	}

	public Date getNgayTao() {
		return ngayTao;
	}

	public void setNgayTao(Date ngayTao) {
		this.ngayTao = ngayTao;
	}

	@Column(name="status")
	private int status;
	
	@Temporal(TemporalType.DATE)
	@Column(name="ngaytao")
	private Date ngayTao;

	
	@OneToMany(mappedBy = "account", fetch = FetchType.EAGER)
	private Collection<Order> orders;
	
	@OneToMany(mappedBy = "account", fetch = FetchType.EAGER)
	private Collection<Carts> carts;
	
	public int getAccountId() {
		return accountId;
	}

	public void setAccountId(int accountId) {
		this.accountId = accountId;
	}

	public String getFullname() {
		return fullname;
	}

	public void setFullname(String fullname) {
		this.fullname = fullname;
	}

	public String getPassword() {
		return password;
	}

	public void setPassword(String password) {
		this.password = password;
	}

	public String getPhone() {
		return phone;
	}

	public void setPhone(String phone) {
		this.phone = phone;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public String getAddress() {
		return address;
	}

	public void setAddress(String address) {
		this.address = address;
	}

	public int getStatus() {
		return status;
	}

	public void setStatus(int status) {
		this.status = status;
	}

	public Date getNgaytao() {
		return ngayTao;
	}

	public void setNgaytao(Date ngaytao) {
		this.ngayTao = ngaytao;
	}

	public Collection<Order> getOrders() {
		return orders;
	}

	public void setOrders(Collection<Order> orders) {
		this.orders = orders;
	}

	public Collection<Carts> getCarts() {
		return carts;
	}

	public void setCarts(Collection<Carts> carts) {
		this.carts = carts;
	}
	
}
