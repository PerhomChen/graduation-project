package entity.user.queryVo;

import testMapper.pojo.Goods;
import java.util.List;

/**
 * 商品的包装对象
 */
public class GoodsQueryVo {
    //商品信息
    private Goods goods;
    private GoodsCustom goodsCustom;

    //批量商品信息
    private List<GoodsCustom> goodsCustomList;

    public Goods getGoods() {
        return goods;
    }

    public void setGoods(Goods goods) {
        this.goods = goods;
    }

    public GoodsCustom getGoodsCustom() {
        return goodsCustom;
    }

    public void setGoodsCustom(GoodsCustom goodsCustom) {
        this.goodsCustom = goodsCustom;
    }
}
