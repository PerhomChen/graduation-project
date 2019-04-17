package controller;

import entity.user.Goods;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import service.GoodsService;

@Controller
@RequestMapping("/goods")
public class GoodsController {

    @Autowired
    private GoodsService goodsService;

    //做为中间跳转的桥梁
    @RequestMapping("/middle")
    @ResponseBody
    public String middle(String goodName)throws  Exception{
        System.out.println(goodName);

        //根据物品名查询物品id
       Integer goodId =  goodsService.getGoodsId(goodName);

        System.out.println(goodId);
        return goodId+"";
    }

    @RequestMapping("/details")
    public String details (Model model ,  String goodId) throws  Exception{

        Integer goodId1 = Integer.parseInt(goodId);

         Goods goods =  goodsService.getGoods(goodId1);

        System.out.println(goods.getDetail());
         model.addAttribute("goodsDetails",goods);

        return "GoodsDetails";
    }

    @RequestMapping("/goodDetail")
    @ResponseBody
    public Goods goodDetail(@RequestBody String goodId)throws Exception{

        //调用service查询good信息
        System.out.println(goodId);
        Integer goodIdReal = Integer.parseInt(goodId);

        Goods goods = goodsService.getGoods(goodIdReal);

        System.out.println(goods);

        return goods;
    }

}
