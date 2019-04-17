package service;

import entity.user.Goods;
import entity.user.queryVo.GoodsCustom;

public interface GoodsService {

    //根据名字查询id
    public Integer getGoodsId(String goodName) throws Exception;

    //根据Id查询
    public Goods getGoods(Integer goodsId)throws Exception;
}
