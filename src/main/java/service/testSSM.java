package service;

import entity.user.queryVo.GoodsCustom;
import entity.user.queryVo.GoodsQueryVo;

import java.util.List;

public interface testSSM {

    //商品查询列表
    public List<GoodsCustom> findGoodsList(GoodsQueryVo goodsQueryVo)throws  Exception;
    //根据id查询商品
    public GoodsCustom findGoodsListById(Integer id)throws  Exception;

    //根据id更新商品

    public void updateGoods(Integer id ,GoodsCustom goodsCustom)throws  Exception;
}
