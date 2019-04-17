package service;

import entity.user.Cart;
import entity.user.queryVo.CartCustom;
import org.springframework.stereotype.Service;

import java.util.List;

/**
 * 购物车的service
 */

public interface CartService {

    /**
     * insert  cart
     * @param cart
     * @return
     * @throws Exception
     */
    public Integer insertCart(Cart cart)throws  Exception;

    /**
     * select cart by userId
     * @param uid
     * @return
     * @throws Exception
     */
    List<CartCustom> selectUserCart(Integer uid) throws Exception;

    /**
     * 修改购物车的商品的数量
     * @param cartId
     * @param is_add
     * @throws Exception
     */
    void updateGoodNum (Integer cartId,boolean is_add)throws Exception;

    void deleteCartByCartId(Integer CartId)throws Exception;


}
