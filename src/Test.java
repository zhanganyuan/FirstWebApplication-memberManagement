import control.CustomerAction;
import module.Customer;

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
//        String name = "";
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
//        SupervisorDao.query();
        /**
         * 测试修改客户信息
         */
        CustomerAction customerAction=new CustomerAction();
        Customer customer =new Customer();
        customer.setC_password("123344");
        customer.setPhone("12345678901");

        customer.setMoney(243324.35);
        customer.setName("小美");
        customer.setIdCard("421127198709211267");
        customerAction.editCustomer(customer);


    }
}
