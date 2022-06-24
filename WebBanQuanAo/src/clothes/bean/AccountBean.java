package clothes.bean;

import javax.validation.constraints.Size;

import org.hibernate.validator.constraints.Email;
import org.hibernate.validator.constraints.NotBlank;

public class AccountBean {

	@NotBlank(message = "Họ và tên không được bỏ trống!")
	private String fullname;

	@NotBlank(message = "Email không được bỏ trống!")
	@Email(message = "Email không đúng định dạng!")
	private String email;

	@NotBlank(message = "Số điện thoại không được bỏ trống!")
	private String phone;

	@NotBlank(message = "Địa chỉ liên hệ không được bỏ trống!")
	private String address;

	@NotBlank(message = "Mật khẩu không được bỏ trống!")
	@Size(min = 3)
	private String password;

	public String getPassword() {
		return password;
	}

	public void setPassword(String password) {
		this.password = password;
	}

	public String getFullname() {
		return fullname;
	}

	public void setFullname(String fullname) {
		this.fullname = fullname;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public String getPhone() {
		return phone;
	}

	public void setPhone(String phone) {
		this.phone = phone;
	}

	public String getAddress() {
		return address;
	}
	public void setAddress(String address) {
		this.address = address;
	}
}
