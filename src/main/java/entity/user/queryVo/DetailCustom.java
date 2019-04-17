package entity.user.queryVo;

import entity.user.Detail;
import entity.user.Goods;

public class DetailCustom extends Detail {

    //goods
    private Goods goods;

    public Goods getGoods() {
        return goods;
    }

    public void setGoods(Goods goods) {
        this.goods = goods;
    }
}
