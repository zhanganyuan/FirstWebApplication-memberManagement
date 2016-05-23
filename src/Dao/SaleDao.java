package Dao;

import DB.DBUtil;
import module.Sale;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;

/**
 * Created by zay19 on 5/16/2016.
 */
public class SaleDao {
    /**
     * add 增加会员等级上限
     */
    public static void addSale(Sale sale) throws SQLException {
        Connection connection= DBUtil.getConnection();
        String sql=" "+
                " INSERT INTO sale "+
                " (level, discount, incPoints,totaldiscount) "+
                " VALUES(?,?,?,?) ";
        PreparedStatement preparedStatement=connection.prepareStatement(sql);
        preparedStatement.setInt(1,sale.getLevel());
        preparedStatement.setFloat(2,sale.getDiscount());
        preparedStatement.setInt(3,sale.getIncPoints());
        preparedStatement.setDouble(4,sale.getTotalDiscount());
        preparedStatement.execute();
    }
    /**
     * update 修改会员等级权限
     */
    public static void updatesale(Sale sale) throws SQLException {
        Connection connection=DBUtil.getConnection();
        String sql=" "+
                " UPDATE sale "+
                " SET level=?,discount=?,incPoints=?,totalDiscount=? "+
                " WHERE level=? ";
        PreparedStatement preparedStatement=connection.prepareStatement(sql);
        preparedStatement.setInt(1,sale.getLevel());
        preparedStatement.setFloat(2,sale.getDiscount());
        preparedStatement.setInt(3,sale.getIncPoints());
        preparedStatement.setDouble(4,sale.getTotalDiscount());
        preparedStatement.setInt(5,sale.getLevel());
        preparedStatement.execute();
    }
    /**
     * query
     */
    public static Sale query(Integer level) throws SQLException {
        Connection connection=DBUtil.getConnection();
        String sql=" "+
                " SELECT * FROM sale "+
                " WHERE level=? ";
        PreparedStatement preparedStatement=connection.prepareStatement(sql);
        preparedStatement.setInt(1,level);
        ResultSet resultSet=preparedStatement.executeQuery();
        if(resultSet.next()) {
            Sale sale = new Sale();
            sale.setLevel(resultSet.getInt("level"));
            sale.setDiscount(resultSet.getFloat("discount"));
            sale.setIncPoints(resultSet.getInt("incPoints"));
            sale.setTotalDiscount(resultSet.getDouble("totalDiscount"));
            return sale;
        }
        else
            return null;
    }


    public static List<Sale> query() throws SQLException {
        Connection connection=DBUtil.getConnection();
        String sql=""+
                " SELECT * FROM sale ";
        PreparedStatement preparedStatement=connection.prepareStatement(sql);
        ResultSet resultSet=preparedStatement.executeQuery();
        List<Sale> sales=new ArrayList<Sale>();
        Sale sale=null;
        while(resultSet.next()){
            sale=new Sale();
            sale.setLevel(resultSet.getInt("level"));
            sale.setDiscount(resultSet.getFloat("discount"));
            sale.setIncPoints(resultSet.getInt("incPoints"));
            sale.setTotalDiscount(resultSet.getDouble("totalDiscount"));
            sales.add(sale);
        }
        return sales;
    }
    /**
     * delete 删除一个等级
     */
    public static void delSale(Integer level) throws SQLException {
        Connection connection=DBUtil.getConnection();
        String sql=" "+
                " DELETE FROM sale "+
                " WHERE level=? ";
        if(false)/*fuck*/;//只是单纯消除重复代码提示
        PreparedStatement preparedStatement=connection.prepareStatement(sql);
        preparedStatement.setInt(1,level);
        preparedStatement.execute();
    }

}
