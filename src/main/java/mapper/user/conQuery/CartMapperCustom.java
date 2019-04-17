package mapper.user.conQuery;

import entity.user.queryVo.CartCustom;

import java.util.List;

public interface CartMapperCustom {

    List<CartCustom> selectUserCart (Integer uid) throws Exception;

    //查询购物车的good_goodNum和good de ex_num
    CartCustom selectUserCartByCartId (Integer cartId) throws Exception;
}
