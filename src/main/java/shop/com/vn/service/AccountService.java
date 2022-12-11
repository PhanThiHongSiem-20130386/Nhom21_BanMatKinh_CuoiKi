package shop.com.vn.service;

import shop.com.vn.db.JDBiConnector;
import shop.com.vn.model.Account;
import shop.com.vn.model.IsAdmin;

import java.util.List;
import java.util.stream.Collectors;

public class AccountService {
    public static List<Account> getAccountById(String idA) {
        return JDBiConnector.me().withHandle(handle -> {
            return handle.createQuery("select * from account a where a.id=?")
                    .bind(0,idA)
                    .mapToBean(Account.class)
                    .stream().collect(Collectors.toList());
        });
    }
    public static List<Account> getAllAccount() {
        return JDBiConnector.me().withHandle(handle -> {
            return handle.createQuery("select * from account")
                    .mapToBean(Account.class)
                    .stream().collect(Collectors.toList());
        });
    }
    public static IsAdmin getDepartment(String idD) {
        return JDBiConnector.me().withHandle(handle -> {
            return handle.createQuery("select * from isadmin  where idAdmin=?")
                    .bind(0,idD)
                    .mapToBean(IsAdmin.class)
                    .stream().collect(Collectors.toList()).get(0);
        });
    }
    public static List<IsAdmin> getAllDepartment() {
        return JDBiConnector.me().withHandle(handle -> {
            return handle.createQuery("select * from isadmin")
                    .mapToBean(IsAdmin.class)
                    .stream().collect(Collectors.toList());
        });
    }


    public static void main(String[] args) {
        System.out.println(getDepartment("2"));
    }
}
