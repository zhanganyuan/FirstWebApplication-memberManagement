import Dao.SupervisorDao;

import java.sql.SQLException;

/**
 * Created by zay19 on 5/18/2016.
 */
public class Test {
    public static void main(String[] args) throws SQLException {
        /**
         * 测试customer
         */
//        Map<String, Object> map = new HashMap<String, Object>();
//        List<Map<String, Object>> params = new ArrayList<Map<String, Object>>();
//
//        String name = "name";
//        String relation = "like";
//        String value = "1";
//        map.put("name", "phone");
//        map.put("relation", "like");
//        String phoneValue = "\'%" + value + "%\'";
//        map.put("value", phoneValue);
//
//        params.add(map);
//        CustomerAction customerAction = new CustomerAction();
//        List<Customer> customers= customerAction.query(params);
        /**
         * 测试supervisor
         */
        SupervisorDao.query();
    }
}
