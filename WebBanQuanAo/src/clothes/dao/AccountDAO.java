package clothes.dao;

import clothes.entity.Account;
import java.util.List;

public interface AccountDAO {
	List<Account> listAccounts();
	
	List<Account> listAccountsByType(String type);
	
	List<Account> listLockAccounts();
	
	Account getAccount(int id);
	
	Account findByEmail(String email);
	
	boolean insert(Account account);
	
	boolean update(Account account);
	
	boolean delete(Account account);
	
	Account findByPhone(String phone);
}
