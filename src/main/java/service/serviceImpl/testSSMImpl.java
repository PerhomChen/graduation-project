package service.serviceImpl;

import entity.user.Goods;
import entity.user.queryVo.GoodsCustom;
import entity.user.queryVo.GoodsQueryVo;
import mapper.user.conQuery.GoodsMapperCustom;
import mapper.user.GoodsMapper;
import org.springframework.beans.BeanUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import service.testSSM;

import java.util.List;

@Service
public class testSSMImpl implements testSSM {
    //自动注入GOodsCustom
    @Autowired
    private GoodsMapperCustom goodsMapperCustom;
    @Autowired
    private GoodsMapper goodsMapper;

    @Override
    @Transactional
    public List<GoodsCustom> findGoodsList(GoodsQueryVo goodsQueryVo) throws Exception {

        //通过GoodsCustom查询数据库
        return goodsMapperCustom.findGoodsList(goodsQueryVo);
    }

    @Override
    @Transactional
    public GoodsCustom findGoodsListById(Integer id) throws Exception {
        Goods goods = goodsMapper.selectByPrimaryKey(id);
        //中间对商品信息进行业务处理
        //...
        //返回GoodsCustom
        GoodsCustom goodsCustom = new GoodsCustom();
        //将goods的属性值copy到goodsCustom
        BeanUtils.copyProperties(goods,goodsCustom);

        return goodsCustom;
    }

    @Override
    @Transactional
    public void updateGoods(Integer id, GoodsCustom goodsCustom) throws Exception {
        //添加业务检验，通常在service接口对关键字参数进行校验
        //检验 id是否为空，如果为空抛出异常

        //update goods
        goodsCustom.setGoodId(id);
        /*更新所有字段*/
        goodsMapper.updateByPrimaryKey(goodsCustom);
        /*更新一个字段*/
        /*goodsMapper.updateByPrimaryKeySelective(goodsCustom);*/


    }
}
