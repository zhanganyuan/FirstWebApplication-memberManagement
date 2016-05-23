package module;

/**
 * Created by zay19 on 5/16/2016.
 */
public class Supervisor {
    private int mid;
    private String manager;
    private String password;
    /**
     * 构造方法
     */
    public Supervisor(){

    }

    public Supervisor(String manager, String password) {
        this.manager = manager;
        this.password = password;
    }

    /**
     * set get 方法
     */

    public int getMid() {
        return mid;
    }

    public void setMid(int mid) {
        this.mid = mid;
    }

    public String getManager() {
        return manager;
    }

    public void setManager(String manager) {
        this.manager = manager;
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }
}
