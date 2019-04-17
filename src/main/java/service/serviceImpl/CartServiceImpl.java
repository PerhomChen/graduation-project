package service.serviceImpl;

import entity.user.Cart;
import entity.user.queryVo.CartCustom;
import mapper.user.CartMapper;
import mapper.user.conQuery.CartMapperCustom;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import service.CartService;

import java.sql.Date;
import java.sql.Timestamp;
import java.util.List;


@Service
public class CartServiceImpl implements CartService {

    @Autowired
    private CartMapper cartMapper;

    @Autowired
    private CartMapperCustom cartMapperCustom;

    /**
     * insert cart
     * @param cart
     * @return
     * @throws Exception
     */
    @Override
    @Transactional
    public Integer insertCart(Cart cart) throws Exception {

        Integer goodId = cart.getGoodId();
        //查询是否已经加入此类的商品
        Integer cartId =0;
        //已经加入的话，那就商品数量+1；

        Integer cart_id = 0;
         cart_id = cartMapper.selectBygoodId(goodId);

       if(cart_id ==null || cart_id==0  )
       {
           //加入购物车的时间
           Timestamp createTime = new Timestamp(System.currentTimeMillis());

           cart.setCreatetime(createTime);
           //返回购物车的id
           cartId = cartMapper.insertSelective(cart);

           System.out.println(cartId);
           return cartId;

       }else {
           //更新cart的goodNum

           cartMapper.updategoodNum(cart_id,1);

           cartId = cart_id;

           return cartId;
       }
    }

    @Override
    @Transactional
    public List<CartCustom> selectUserCart(Integer uid) throws Exception {

        return cartMapperCustom.selectUserCart(uid);
    }

    @Override
    @Transactional
    public void updateGoodNum(Integer cartId, boolean is_add) throws Exception {

        //调用mapper更新数据库信息
        System.out.println(is_add);
        if(is_add){
            cartMapper.updategoodNum(cartId,1);

        }else{
            cartMapper.updategoodNum(cartId,-1);
        }

    }

    @Override
    @Transactional
    public void deleteCartByCartId(Integer cartId) throws Exception {

        //调用mapper删除购物车
        cartMapper.deleteCartByCartId(cartId);

    }
}
