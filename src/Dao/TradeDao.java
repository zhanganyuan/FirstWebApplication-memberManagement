package Dao;

import DB.DBUtil;
import module.Trade;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

/**
 * Created by zay19 on 5/22/2016.
 */
public class TradeDao {
    /**
     * add
     */
    public static void addTrade(Trade trade) throws SQLException {
        Connection connection = DBUtil.getConnection();
        String sql = "" +
                " INSERT INTO trade " +
                " (t_id, t_name, t_price) " +
                " VALUES(DELETE,?,?) ";
        PreparedStatement preparedStatement = connection.prepareStatement(sql);
        preparedStatement.setString(1, trade.getT_name());
        preparedStatement.setDouble(2, trade.getT_price());
        preparedStatement.execute();
    }

    /**
     * update
     */
    public static void updateTrade(Trade trade) throws SQLException {
        Connection connection = DBUtil.getConnection();
        String sql = "" +
                " UPDATE trade " +
                " SET t_name=?,t_price=? " +
                " WHERE t_id=? ";
        PreparedStatement preparedStatement = connection.prepareStatement(sql);
        preparedStatement.setString(1, trade.getT_name());
        preparedStatement.setDouble(2, trade.getT_price());
        preparedStatement.setInt(3, trade.getT_id());
        preparedStatement.execute();
    }

    /**
     * delete
     */
    public static void deleteTrade(Integer t_id) throws SQLException {
        Connection connection = DBUtil.getConnection();
        String sql = "" +
                " DELETE FROM trade " +
                " WHERE t_id=? ";
        PreparedStatement preparedStatement = connection.prepareStatement(sql);
        preparedStatement.setInt(1, t_id);
        preparedStatement.execute();
    }
    /**
     * query
     */
    public static List<Trade> query() throws SQLException {
        Connection connection=DBUtil.getConnection();
        String sql=""+
                " SELECT * FROM trade ";
        PreparedStatement preparedStatement=connection.prepareStatement(sql);
        List<Trade> trades=new ArrayList<Trade>();
        ResultSet resultSet=preparedStatement.executeQuery();
        Trade trade=null;
        while(resultSet.next()){
            trade=new Trade();
            trade.setT_id(resultSet.getInt("t_id"));
            trade.setT_name(resultSet.getString("t_name"));
            trade.setT_price(resultSet.getDouble("t_price"));
            trades.add(trade);
        }
        return trades;
    }


}

