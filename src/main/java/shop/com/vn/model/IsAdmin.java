package shop.com.vn.model;

public class IsAdmin {
    private int idAdmin;
    private  String department;

    public IsAdmin() {

    }

    public IsAdmin(int idAdmin, String department) {
        this.idAdmin = idAdmin;
        this.department = department;
    }

    public int getIdAdmin() {
        return idAdmin;
    }

    public void setIdAdmin(int idAdmin) {
        this.idAdmin = idAdmin;
    }

    public String getDepartment() {
        return department;
    }

    public void setDepartment(String department) {
        this.department = department;
    }

    @Override
    public String toString() {
        return "IsAdmin{" +
                "idAdmin=" + idAdmin +
                ", department='" + department + '\'' +
                '}';
    }
}
