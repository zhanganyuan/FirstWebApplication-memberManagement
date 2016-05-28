package Dao;

import DB.DBUtil;
import module.Supervisor;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;

/**
 * Created by zay19 on 5/16/2016.
 */
public class SupervisorDao {
    /**
     * add 增加管理员
     */
    public static void addSupervisor(Supervisor supervisor) throws SQLException {
        Connection connection = DBUtil.getConnection();
        String sql = " " +
                " INSERT INTO supervisor " +
                " (mid, manager, password) " +
                " VALUES(DEFAULT,?,?) ";
        PreparedStatement preparedStatement = connection.prepareStatement(sql);
        preparedStatement.setString(1, supervisor.getManager());
        preparedStatement.setString(2, supervisor.getPassword());
        preparedStatement.execute();
    }

    /**
     * update 更新管理员账号
     */
    public static void updateSupervisor(Supervisor supervisor) throws SQLException {
        Connection connection = DBUtil.getConnection();
        String sql = " " +
                " UPDATE supervisor " +
                " SET mid=?,manager=?,password=? " +
                " WHERE mid=? ";
        PreparedStatement preparedStatement = connection.prepareStatement(sql);
        preparedStatement.setInt(1, supervisor.getMid());
        preparedStatement.setString(2, supervisor.getManager());
        preparedStatement.setString(3, supervisor.getPassword());
        preparedStatement.setInt(4, supervisor.getMid());
        preparedStatement.execute();
    }

    /**
     * delete 删除管理员
     */
    public static void delSupervisor(Integer mid) throws SQLException {
        Connection connection = DBUtil.getConnection();
        String sql = " " +
                " DELETE FROM supervisor " +
                " WHERE mid=? ";
        PreparedStatement preparedStatement = connection.prepareStatement(sql);
        preparedStatement.setInt(1, mid);
        preparedStatement.execute();
    }

    /**
     * query 查询
     */
    public static Boolean query(String username, String password) throws SQLException {
        Connection connection = DBUtil.getConnection();
        String sql = " " +
                " SELECT * FROM supervisor " +
                " WHERE manager=? AND password=? ";
        PreparedStatement preparedStatement = connection.prepareStatement(sql);
        preparedStatement.setString(1, username);
        preparedStatement.setString(2, password);
        ResultSet resultSet = preparedStatement.executeQuery();
        if(resultSet.next()){
            return true;
        }
        return false;
    }

    public static List<Supervisor> query() throws SQLException {
        Connection connection = DBUtil.getConnection();
        String sql = " " +
                " SELECT * FROM supervisor ";
        Statement statement = connection.createStatement();
        ResultSet resultSet = statement.executeQuery(sql);
        List<Supervisor> supervisors=new ArrayList<Supervisor>();
        Supervisor supervisor = null;
        while (resultSet.next()) {
            supervisor=new Supervisor();
            supervisor.setMid(resultSet.getInt("mid"));
            supervisor.setManager(resultSet.getString("manager"));
            supervisor.setPassword(resultSet.getString("password"));
            supervisors.add(supervisor);
        }
        return supervisors;
    }
}

