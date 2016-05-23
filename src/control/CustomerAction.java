package control;

import DB.DBUtil;
import Dao.CustomerDao;
import Dao.SaleDao;
import module.Customer;
import module.Sale;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

/**
 * Created by zay19 on 5/16/2016.
 */
public class CustomerAction {
    /**
     * 消费者消费一次之后的的折扣和获得的积分
     */
    private Double discountMoney;
    private int pointsGain;

    /**
     * 会员开卡
     */
    public void addCustomer(Customer customer) throws SQLException {
        CustomerDao.addCustomer(customer);
    }

    /**
     * 查询会员信息
     */
    public List<Customer> query() throws SQLException {
        List<Customer> customers=CustomerDao.query();
        return customers;
    }
    public List<Customer> query(List<Map<String,Object>> params) throws SQLException {
        List<Customer> customers=CustomerDao.query(params);
        return  customers;
    }
    /**
     * edit 编辑会员基本信息
     */
    public static void editCUstomer(Customer customer) throws SQLException {
        Connection connection = DBUtil.getConnection();
        String sql = " " +
                " UPDATE customer " +
                " SET phone=?,c_password=? " +
                " WHERE idCard=? ";
        PreparedStatement preparedStatement = connection.prepareStatement(sql);
        preparedStatement.setString(1, customer.getPhone());
        preparedStatement.setString(2,customer.getC_password());
        preparedStatement.setString(3, customer.getIdCard());
        preparedStatement.execute();
    }

    /**
     *会员退卡
     */
    public void delCustomer(String idCard) throws SQLException {
        CustomerDao.delCustomer(idCard);
    }
    /**
     * 消费得积分
     * 注意：此方法只能在consume方法之后使用
     */
    public int getPoints(Customer customer, Sale sale, double nConsume) {
        return pointsGain;
    }

    /**
     * 消费折扣优惠
     * 注意：此方法只能在consume方法之后使用
     */
    public double getDiscount(Customer customer, Sale sale, double nConsume) {
        return discountMoney;
    }
    /**
     * 消费
     */
    public void consume(String idCard,double nConsume) throws SQLException {
        Map<String,Object> map=new HashMap<String, Object>();
        map.put("name","idCard");
        map.put("relation","=");
        map.put("value",idCard);
        List<Map<String,Object>> params=new ArrayList<Map<String, Object>>();
        params.add(map);
        Customer customer= (Customer) CustomerDao.query(params);//查询得到customer
        Sale sale= SaleDao.query(customer.getLevel());//查询得到sale
        Sale upSale=SaleDao.query(customer.getLevel()+1);//上个一个等级
        /**
         * 对customer的改变做出修改
         */
        discountMoney=nConsume*(1-sale.getTotalDiscount());
        pointsGain=(int)(nConsume/sale.getIncPoints());
        customer.setPoints(customer.getPoints()+pointsGain);
        customer.setConsumption(customer.getConsumption()+nConsume*sale.getDiscount());
        customer.setTotalDiscount(customer.getTotalDiscount()+discountMoney);
        if((null!=upSale)&&(customer.getTotalDiscount()>upSale.getTotalDiscount())){//当上一个等级不为空，并且累计消费达到了上限
            customer.setLevel(customer.getLevel()+1);
        }
        //将customer写回数据库
        CustomerDao.updateCustomer(customer);
    }
}
