package Dao;

import DB.DBUtil;
import module.Customer;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;

/**
 * Created by zay19 on 5/16/2016.
 */
public class CustomerDao {
    /**
     * 会员开卡
     */
    public static void addCustomer(Customer customer) throws SQLException {
        Connection connection = DBUtil.getConnection();
        String sql = "" +
                " INSERT INTO  customer " +
                " (idCard,name,c_password,phone,consumption,points,level,totalDiscount,money) " +
                " VALUES( " +
                " ?,?,?,?,0,0,0,0,?" +
                "); ";
        PreparedStatement preparedStatement = connection.prepareStatement(sql);
        preparedStatement.setString(1, customer.getIdCard());
        preparedStatement.setString(2, customer.getName());
        preparedStatement.setString(3,customer.getC_password());
        preparedStatement.setString(4, customer.getPhone());
        preparedStatement.setDouble(5,customer.getMoney());
        preparedStatement.execute();
    }


    /**
     * 查询会员信息
     */
    public static List<Customer> query() throws SQLException {
        Connection connection = DBUtil.getConnection();
        String sql = " SELECT * FROM customer; ";
        Statement statement = connection.createStatement();
        ResultSet resultSet = statement.executeQuery(sql);
        List<Customer> customers = new ArrayList<Customer>();
        Customer customer = null;
        while (resultSet.next()) {
            customer = new Customer();
            customer.setIdCard(resultSet.getString("idCard"));
            customer.setName(resultSet.getString("name"));
            customer.setPhone(resultSet.getString("phone"));
            customer.setConsumption(resultSet.getDouble("consumption"));
            customer.setLevel(resultSet.getInt("level"));
            customer.setPoints(resultSet.getInt("points"));
            customer.setTotalDiscount(resultSet.getDouble("totalDiscount"));
            customer.setC_password(resultSet.getString("c_password"));
            customer.setMoney(resultSet.getDouble("money"));
            customers.add(customer);
        }
        return customers;
    }

    public static List<Customer> query(List<Map<String, Object>> params) throws SQLException {
        List<Customer> customers = new ArrayList<Customer>();
        Connection connection = DBUtil.getConnection();
        //SQL 里面神奇的StringBuilder!!勿动
        StringBuilder sb = new StringBuilder();
        sb.append(" SELECT * FROM customer WHERE 1=1 ");
        if(params!=null&&params.size()>0){
            for (Map<String,Object> map:
                    params
                    ) {
                sb.append("AND"+" "+map.get("name")+" "+map.get("relation")+" "+map.get("value")+" ");
            }
        }
        /**
         * 测试两个SQL语句
         */
//
//        String sql=" SELECT * FROM customer WHERE 1=1 and phone like '%1%' ";
//        if(sql.equals(sb)){
//            System.out.println("haha");
//        }
        PreparedStatement preparedStatement = connection.prepareStatement(sb.toString());
        ResultSet resultSet = preparedStatement.executeQuery();
        Customer customer = null;
        while (resultSet.next()) {
            customer = new Customer();
            customer.setTotalDiscount(resultSet.getDouble("totalDiscount"));
            customer.setPoints(resultSet.getInt("points"));
            customer.setLevel(resultSet.getInt("level"));
            customer.setConsumption(resultSet.getDouble("consumption"));
            customer.setIdCard(resultSet.getString("idCard"));
            customer.setName(resultSet.getString("name"));
            customer.setPhone(resultSet.getString("phone"));
            customer.setC_password(resultSet.getString("c_password"));
            customer.setMoney(resultSet.getDouble("money"));
            customers.add(customer);
        }
        return customers;
    }

    public static boolean query(String Phone,String password) throws SQLException {
        Connection connection=DBUtil.getConnection();
        String sql=""+
                " SELECT * FROM customer "+
                " WHERE phone=? AND c_password=? ";
        PreparedStatement preparedStatement=connection.prepareStatement(sql);
        preparedStatement.setString(1,Phone);
        preparedStatement.setString(2,password);
        ResultSet resultSet=preparedStatement.executeQuery();
        if(resultSet.next())
            return true;
        return false;
    }

    public static Customer query(String idCard) throws SQLException {
        Connection connection= DBUtil.getConnection();
        String sql=""+
                " SELECT * FROM customer "+
                " WHERE idCard=? ";
        PreparedStatement preparedStatement=connection.prepareStatement(sql);
        preparedStatement.setString(1,idCard);
        ResultSet resultSet=preparedStatement.executeQuery();
        if(resultSet.next()){
            Customer customer=new Customer();
            customer.setTotalDiscount(resultSet.getDouble("totalDiscount"));
            customer.setPoints(resultSet.getInt("points"));
            customer.setLevel(resultSet.getInt("level"));
            customer.setConsumption(resultSet.getDouble("consumption"));
            customer.setIdCard(resultSet.getString("idCard"));
            customer.setName(resultSet.getString("name"));
            customer.setPhone(resultSet.getString("phone"));
            customer.setC_password(resultSet.getString("c_password"));
            customer.setMoney(resultSet.getDouble("money"));
            return customer;
        }
        return null;
    }

    /**
     * update 更新会员信息
     */
    public static void updateCustomer(Customer customer) throws SQLException {
        Connection connection = DBUtil.getConnection();
        String sql = " " +
                " UPDATE customer " +
                " SET idCard=?,name=?,c_password=?,phone=?,consumption=?,level=?,points=?,totalDiscount=?,money=? " +
                " WHERE idCard=? ";
        PreparedStatement preparedStatement = connection.prepareStatement(sql);
        preparedStatement.setString(1, customer.getIdCard());
        preparedStatement.setString(2, customer.getName());
        preparedStatement.setString(3,customer.getC_password());
        preparedStatement.setString(4, customer.getPhone());
        preparedStatement.setDouble(5, customer.getConsumption());
        preparedStatement.setInt(6, customer.getLevel());
        preparedStatement.setInt(7, customer.getPoints());
        preparedStatement.setDouble(8, customer.getTotalDiscount());
        preparedStatement.setDouble(9,customer.getMoney());
        preparedStatement.setString(10, customer.getIdCard());
        preparedStatement.execute();
    }




    /**
     * 会员退卡
     */
    public static void delCustomer(String id) throws SQLException {
        Connection connection = DBUtil.getConnection();
        String sql = "" +
                " DELETE FROM customer " +
                " WHERE idCard=? ";
        PreparedStatement preparedStatement = connection.prepareStatement(sql);
        preparedStatement.setString(1, id);
        preparedStatement.execute();
    }
}
