package service.serviceImpl;

import entity.user.Address;
import entity.user.Detail;
import entity.user.Order;
import entity.user.queryVo.CartCustom;
import mapper.user.AddressMapper;
import mapper.user.CartMapper;
import mapper.user.DetailMapper;
import mapper.user.OrderMapper;
import mapper.user.conQuery.CartMapperCustom;
import mapper.user.conQuery.OrderMapperCustom;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import service.OrderService;


import java.sql.Timestamp;
import java.util.ArrayList;
import java.util.List;

@Service
public class OrderServiceImpl implements OrderService {

    @Autowired
    private OrderMapperCustom orderMapperCustom;

    @Autowired
    private CartMapperCustom cartMapperCustom;

    @Autowired
    private OrderMapper orderMapper;

    @Autowired
    private CartMapper cartMapper;

    @Autowired
    private DetailMapper detailMapper;

    @Autowired
    private AddressMapper addressMapper;

    /**
     * insert order and list detail
     * @param checkoutList
     * @param uid
     * @return
     * @throws Exception
     */
    @Override
    @Transactional
    public int insertOrder(List<Integer> checkoutList,Integer uid) throws Exception {

        //记录是否库存不足的个数
        Integer count = 0;

        //记录size
        int total_size = 0;

        //记录price
        double total_price = 0.0;

         /*detail*/
        List<Detail> detailList = new ArrayList<>();
        int i =0 ;
        //查询库存够不够
        for (Integer cartId11 : checkoutList) {
            CartCustom cartCustom = cartMapperCustom.selectUserCartByCartId(cartId11);
            //进货
            Integer ex = cartCustom.getGoods().getExNumber();
            //比较库存
            if (cartCustom.getGoodNum() >= ex) {
                count++;
            }

            //计算size
            total_size += cartCustom.getGoodNum()*cartCustom.getGoods().getSize();

            total_price += cartCustom.getGoods().getPrice()*cartCustom.getGoodNum();
            System.out.println(total_size);

            Detail detailTemp = new Detail();
            detailTemp.setGoodId(cartCustom.getGoodId());
            detailTemp.setGoodNum(cartCustom.getGoodNum());

            detailList.add(detailTemp);
        }
        if (count == 0) {

            //查询出用户的地址

            //新建一个orderCustom
            Order order = new Order();

            //生成创建订单的时间
            Timestamp createTime = new Timestamp(System.currentTimeMillis());
            order.setCreatetime(createTime);

            //setuid
            order.setuid(uid);

            //先手动设定地址
            order.setDestination("上海市浦东新区");

            //设置locationID
            order.setAddressId(1);

            //设置status
            order.setStatus(1);

            //设置size
            order.setSize(total_size);

            //set price
            order.setTotalprice(total_price);

            System.out.println(order.toString());

            /*orderMapperCustom.insertOrder(orderCustom);*/
          orderMapper.insertSelective(order);



         Integer  orderId = order.getOrderId();

            System.out.println(orderId);
            /**
             * insert orderDetail
             */
            for(Detail detail12 : detailList){
                detail12.setOrderId(orderId);
            }

            for(Detail detail2 : detailList ){
                detail2.toString();
            }
            //insertorderDetail
            orderMapperCustom.insertOrderDetail(detailList);

            //删除相应的购物车
            for(int cartId2333 :checkoutList){
                cartMapper.deleteCartByCartId(cartId2333);
            }

            return orderId;
        } else {
            return -1;
        }
    }

    @Override
    @Transactional
    public List<Detail> selectOrderDetail(Integer orderId) throws Exception {


      //调用mapper查询出list-detail

        return   detailMapper.selectOrderDetailByOrderId(orderId);
    }

    /**
     * update order
     * @param orderId
     * @param addressId
     * @return
     */
    @Override
    @Transactional
    public boolean checkOutOrder(Integer orderId, Integer addressId) {

        Order order = new Order();
        order.setOrderId(orderId);
        order.setAddressId(addressId);
        order.setStatus(2);
        //根据addressId 查询出address
       Address address =  addressMapper.selectByPrimaryKey(addressId);

       order.setDestination(address.getAddress());
       Integer res = orderMapper.updateByPrimaryKeySelective(order);

       if(res !=0){
           return true;
       }else{
           return false;
       }

    }

    /**
     * 根据用户id查询order
     * @param uid
     * @return
     * @throws Exception
     */
    @Override
    public List<Order> selectOrder(Integer uid) throws Exception {

        List<Order> orderList = new ArrayList();

        //调用orderMapper查询order
       orderList = orderMapper.selectOrderByUid(uid);
        System.out.println(orderList);

        return orderList;
    }
}
