package mapper.user.conQuery;

import entity.user.Detail;
import entity.user.Order;
import entity.user.queryVo.OrderCustom;

import java.util.List;

public interface OrderMapperCustom {

    //插入订单
    int insertOrder(OrderCustom orderCustom);

    void insertOrderDetail(List<Detail> detailList);

    List<Order> selectOrderByUid(Integer uid);

}
