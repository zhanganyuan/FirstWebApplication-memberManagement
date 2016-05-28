package module;

/**
 * Created by zay19 on 5/16/2016.
 */
public class Customer {
    private String idCard;
    private String name;
    private String phone;
    private double consumption;//
    private int points;//
    private int level;//
    private double totalDiscount;//
    private String c_password;
    private double money;

    /**
     * 构造方法
     */
    public Customer() {
        consumption = 0.00;
        points = 0;
        level = 0;
        totalDiscount = 0.00;
    }


    /**
     * set get 方法
     */

    public String getIdCard() {
        return idCard;
    }

    public void setIdCard(String idCard) {
        this.idCard = idCard;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getPhone() {
        return phone;
    }

    public void setPhone(String phone) {
        this.phone = phone;
    }

    public double getConsumption() {
        return consumption;
    }

    public void setConsumption(double consumption) {
        this.consumption = consumption;
    }

    public int getPoints() {
        return points;
    }

    public void setPoints(int points) {
        this.points = points;
    }

    public int getLevel() {
        return level;
    }

    public void setLevel(int level) {
        this.level = level;
    }

    public double getTotalDiscount() {
        return totalDiscount;
    }

    public void setTotalDiscount(double totalDiscount) {
        this.totalDiscount = totalDiscount;
    }

    public String getC_password() {
        return c_password;
    }

    public void setC_password(String c_password) {
        this.c_password = c_password;
    }
    public double getMoney() {
        return money;
    }

    public void setMoney(Double money) {
        this.money = money;
    }

}
