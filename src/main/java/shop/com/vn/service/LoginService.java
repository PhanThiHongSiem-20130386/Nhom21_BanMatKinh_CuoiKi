package shop.com.vn.service;




import shop.com.vn.db.JDBiConnector;
import shop.com.vn.model.Account;

import java.util.List;
import java.util.stream.Collectors;

public class LoginService {
    public static Account getAccout(String user, String pass){
        List<Account> accounts = JDBiConnector.me().withHandle(h ->
                h.createQuery("SELECT * FROM account WHERE user = ? and pass =?")
                        .bind(0, user).bind(1,pass)
                        .mapToBean(Account.class)
                        .stream()
                        .collect(Collectors.toList())
        );
        if (accounts.size()==0) return null;
        return accounts.get(0);
    }
    // lấy tài khoản bằng id
    public static Account getAccoutById(String idUser){
        List<Account> accounts = JDBiConnector.me().withHandle(h ->
                h.createQuery("SELECT * FROM account WHERE id = ? ")
                        .bind(0, idUser)
                        .mapToBean(Account.class)
                        .stream()
                        .collect(Collectors.toList())
        );
        if (accounts.size()==0) return null;
        return accounts.get(0);
    }

// kiểm tra tài khoản
public static Account checkAccount(String user){
    List<Account> accounts = JDBiConnector.me().withHandle(h ->
            h.createQuery("SELECT * FROM account WHERE user = ?")
                    .bind(0, user)
                    .mapToBean(Account.class)
                    .stream()
                    .collect(Collectors.toList())
    );
    if(accounts.size() ==0) return  null;
    return accounts.get(0);
}
//
    public static void signUpA(String user, String pass){
       JDBiConnector.me().withHandle(h ->
                h.createUpdate("insert into account(user,email,phone,pass,img,managerAccount,managerProduct" +
                                ",managerBog,managerHome,assistant)"  +
                                "VALUES (?,null,null,?,null,0,0,0,0,0)")
                        .bind(0,user)
                        .bind(1,pass)
                        .execute()
        );
    }

    public static void main(String[] args){
    }


}
