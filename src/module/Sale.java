package module;

/**
 * Created by zay19 on 5/16/2016.
 */
public class Sale {
    private int level;
    private float discount;
    private  int incPoints;
    private double totalDiscount;
    /**
     * 构造方法
     */
    public Sale(){
        level=0;
        discount=1;
        incPoints=100;
        totalDiscount=0;
    }

    /**
     * set get 方法
     */
    public int getLevel() {
        return level;
    }

    public void setLevel(int level) {
        this.level = level;
    }

    public float getDiscount() {
        return discount;
    }

    public void setDiscount(float discount) {
        this.discount = discount;
    }

    public int getIncPoints() {
        return incPoints;
    }

    public void setIncPoints(int incPoints) {
        this.incPoints = incPoints;
    }

    public double getTotalDiscount() {
        return totalDiscount;
    }

    public void setTotalDiscount(double totalDiscount) {
        this.totalDiscount = totalDiscount;
    }
}
