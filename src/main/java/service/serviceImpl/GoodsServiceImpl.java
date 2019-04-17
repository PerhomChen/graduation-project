package service.serviceImpl;

import entity.user.Goods;
import mapper.user.GoodsMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import service.GoodsService;

@Service
public class GoodsServiceImpl implements GoodsService {

    @Autowired
    private GoodsMapper goodsMapper;

    /**
     * getGoodIdBygoodName
     * @param goodName
     * @return
     * @throws Exception
     */
    @Override
    @Transactional
    public Integer getGoodsId(String goodName) throws Exception {

        Integer goodid = goodsMapper.selectByGoodsName(goodName);

        System.out.println(goodid);

       return goodid ;
    }

    /**
     * getGoodsBygoodId
     * @param goodId
     * @return
     * @throws Exception
     */
    @Override
    @Transactional
    public Goods getGoods(Integer goodId) throws Exception {

        Goods goods = null;
        if(goodId != 0){
             goods = goodsMapper.selectByPrimaryKey(goodId);
        }
        return goods;
    }


}
