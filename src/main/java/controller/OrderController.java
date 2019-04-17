package controller;

import entity.user.Cart;
import entity.user.Detail;
import entity.user.Order;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import service.CartService;
import service.OrderService;

import javax.servlet.http.HttpSession;
import java.util.ArrayList;
import java.util.List;

@Controller
@RequestMapping("/order")
public class OrderController {

    @Autowired
    private CartService cartService;
    @Autowired
    private OrderService orderService;



    @RequestMapping("/buyNowMiddle")
    @ResponseBody
    public String buyNowMiddle(Cart cart) throws Exception{

        //自动加入购物车然后返回购物车的id，
       Integer cartId = cartService.insertCart(cart);

        return ""+cartId;
    }

    /*确认订单页面*/
    @RequestMapping("/buyNow")

    public String buyNow (HttpSession httpSession) throws Exception{



        return "buyNow";
    }

    @RequestMapping("/checkOutMiddle")
    @ResponseBody
    public String checkOutMiddle(@RequestBody List<Integer> checkout_list, HttpSession httpSession)throws Exception{

        //拿到用户的uid
       Integer uid = (Integer) httpSession.getAttribute("uid");

        System.out.println(checkout_list.toString());
        //调用serivce层添加订单
         Integer res = orderService.insertOrder(checkout_list ,uid);

        System.out.println(res);
     //把orderId存储到session里面

        httpSession.setAttribute("orderId",res);

      if(res==-1){
          return  "ex-checkOut";
      }else{

          return "ok-checkOut";
      }
    }


    @RequestMapping("/orderDetail")
    @ResponseBody
    public List<Detail> orderDetail (HttpSession httpSession)throws Exception{

        //获得orderId
       Integer orderId = (Integer) httpSession.getAttribute("orderId");

        System.out.println(orderId);

        List<Detail> detailList = new ArrayList<>();
       //调用service层查询出list detail
       detailList =  orderService.selectOrderDetail(orderId);

        System.out.println(detailList.toString());

        //返回

        return detailList;
    }

    //提交订单
    @RequestMapping("/checkOut")
    @ResponseBody
    public String checkOut (HttpSession httpSession ,@RequestBody String addressId) throws Exception{

        Integer addressIdReal = Integer.parseInt(addressId);

        System.out.println(addressIdReal);

        Integer orderId =(Integer) httpSession.getAttribute("orderId");

        System.out.println(orderId);

        //调用service修改order的addressId 和address 和 status
       boolean flag = orderService.checkOutOrder(orderId,addressIdReal);

       //移除session的orderId
        httpSession.removeAttribute("orderId");

       if(flag){
           return  "ok-checkOut";
       }else{
           return  "ex-checkOut";
       }
    }



    @RequestMapping("/myOrder")

    public String myOrder()throws Exception{


        return "myOrder";
    }


    @RequestMapping("/myOrderList")
    @ResponseBody
    public List<Order> myOrderList (HttpSession httpSession) throws Exception{


      Integer uid = (Integer)  httpSession.getAttribute("uid");
        //调用service层查询出用户的产生的订单列表


        return  orderService.selectOrder(uid);
    }

    @RequestMapping("/myOrderListDetail")
    @ResponseBody
    public List<Detail> myOrderListDetail(@RequestBody String orderId)throws Exception{

        Integer orderIdReal = Integer.parseInt(orderId);

        System.out.println(orderIdReal);

        //
        List<Detail> detailList = new ArrayList<>();

       detailList =  orderService.selectOrderDetail(orderIdReal);

        return detailList;
    }


}
