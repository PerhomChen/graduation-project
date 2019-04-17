package mapper.user.conQuery;

import entity.user.queryVo.GoodsCustom;
import entity.user.queryVo.GoodsQueryVo;

import java.util.List;

public interface GoodsMapperCustom {
    //简易查询列表
    public List<GoodsCustom> findGoodsList(GoodsQueryVo goodsQueryVo)throws  Exception;


}