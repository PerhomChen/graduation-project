package controller;

import entity.user.Cart;
import entity.user.queryVo.CartCustom;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import service.CartService;

import javax.servlet.http.HttpSession;
import java.util.ArrayList;
import java.util.List;

@Controller
@RequestMapping("/cart")
public class CartController {

    @Autowired
    private CartService cartService;


    //加入购物车
    @RequestMapping("/addCart")
    @ResponseBody
    public String addCart(HttpSession httpSession,Cart cart) throws Exception{

        //取session里面的uid
        Integer uid = (Integer) httpSession.getAttribute("uid");

        cart.setUid(uid);

      Integer cartId =   cartService.insertCart(cart);

      if(cartId ==0 || cartId == null){
          return "ex-cart";
      }else{
          return "ok-cart";
      }
    }

    @RequestMapping("/myCart")
    public String myCart(HttpSession httpSession)throws Exception {

        //查询出用户的购物车信息
        return "myCart";

    }

    //查询用户的购物车内容
    @RequestMapping("/myCartList")
    @ResponseBody
    public List<CartCustom> myCartList(HttpSession httpSession)throws Exception{

        List<CartCustom> cartCustomList = new ArrayList<>();

        //get uid
       Integer uid = (Integer) httpSession.getAttribute("uid");

       cartCustomList = cartService.selectUserCart(uid);

       for(CartCustom cartCustom : cartCustomList){
           System.out.println(cartCustom.toString());
       }

        return cartCustomList;
    }

    //修改购物车的物品的数量。
    @RequestMapping("/modifyGoodNum")
    @ResponseBody
    public String modifyGoodNum(Integer cartId,boolean is_add)throws Exception{

        //调用service修改购物车物品数量

        cartService.updateGoodNum(cartId,is_add);

        return "ok-modifyGoodNum";

    }

    //删除购物车的商品
    @RequestMapping("/deleteCart")
    @ResponseBody
    public String deleteCart(Integer cartId)throws Exception{

        //调用service删除购物车的商品
        if(cartId==0||cartId==null){
            return "ex-deleteCart";
        }else{
            cartService.deleteCartByCartId(cartId);

            return "ok-deleteCart";
        }
    }
}
