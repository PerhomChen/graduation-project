package entity.user.queryVo;

import entity.user.Cart;
import entity.user.Goods;

public class CartCustom extends Cart {

    //加入物品的信息
    private Goods goods;

    public Goods getGoods() {
        return goods;
    }

    public void setGoods(Goods goods) {
        this.goods = goods;
    }



    public String toString() {
        return super.toString();
    }

}
