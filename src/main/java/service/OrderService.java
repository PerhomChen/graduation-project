package service;

import entity.user.Detail;
import entity.user.Order;

import java.util.List;

public interface OrderService {

    //传入的订单信息添加订单
    int insertOrder( List<Integer> checkoutList,Integer uid)throws Exception;

    //根据orderId查询出下所有的detail
    List<Detail> selectOrderDetail(Integer orderId)throws Exception;

    //修改order的信息
    boolean checkOutOrder(Integer orderId ,Integer addressId);

    List<Order> selectOrder(Integer uid)throws Exception;

}
