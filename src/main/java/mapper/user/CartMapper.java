package mapper.user;

import entity.user.Cart;
import org.apache.ibatis.annotations.Param;

public interface CartMapper {

    Integer insertSelective(Cart cart);

    Integer selectBygoodId (Integer goodId);

    void updategoodNum(@Param("cartId") Integer cartId,@Param("num") Integer num);

    void deleteCartByCartId(Integer cartId);



}
