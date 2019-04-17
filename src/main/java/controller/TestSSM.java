package controller;

import entity.user.User;
import entity.user.queryVo.GoodsCustom;
import entity.user.queryVo.GoodsQueryVo;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;
import service.testSSM;

import java.util.List;

/**
 * 商品的Controller
 */
@Controller
//
@RequestMapping("/test")
public class TestSSM {

    //注入service，让它从数据库取
    @Autowired
   private testSSM testSSM;

    @RequestMapping("/queryGood")
    public ModelAndView queryGood(GoodsQueryVo goodsQueryVo)throws Exception{

        ModelAndView modelAndView = new ModelAndView();

        List<GoodsCustom> goodsList = testSSM.findGoodsList(goodsQueryVo);



        modelAndView.addObject("goodsList",goodsList);

        //指定视图
        modelAndView.setViewName("/WEB-INF/ssmTest/goodsList.jsp");

        return modelAndView;
    }
    @RequestMapping("/getUser")
    public void getUser(ModelAndView modelAndView, User user)throws Exception{
        System.out.println(user.getUsername());
    }

    //商品修改页面展示
    @RequestMapping("/editGoods")
   // @RequestParam(value ="id") Integer item_id,绑定，id是传入的参数名，item_id是绑定后的参数名。
    //required = true :指定属性是否必须被传入，
    //通过defaultValue ="",可以设置默认值，如果id没有传入的化，将默认值和参数绑定
    //@RequestParam(value ="id",required = true,defaultValue ="") Integer id
    public String editGoods(Model model,@RequestParam(value ="id",required = true) Integer id)throws  Exception{
        //调用service查询商品信息
       GoodsCustom goodsCustom = testSSM.findGoodsListById(id);
       /*  ModelAndView modelAndView = new ModelAndView();
        //商品信息添加model
        modelAndView.addObject("goodsCustom",goodsCustom);
        modelAndView.setViewName("editGoods");*/
       //通过形参中的model将model数据传到页面
        //相当于上面
        System.out.println(goodsCustom.getGoodName());
      model.addAttribute("goodsCustom",goodsCustom);

        return "/WEB-INF/ssmTest/editGoods.jsp";

    }

    //商品修改提交
    @RequestMapping("/editGoodsSubmit")
    //可以限制http的请求方法
    /*@RequestMapping(value="/editGoodsSubmit",method=(RequestMethod.GET))*/
    public String editGoodsSubmit(Integer id ,GoodsCustom goodsCustom)throws  Exception{
        //调用service更新商品信息，页面需要将商品信息传到此方法
        //....
        System.out.println(id);
        System.out.println(goodsCustom.getGoodName());
        testSSM.updateGoods(id,goodsCustom);

        return "/WEB-INF/ssmTest/sucess.jsp";
    }

    //删除
    @RequestMapping("/deleteGoods")
    public String deleteGoods(Integer[] item_id)throws  Exception{

        return "/WEB-INF/ssmTest/sucess.jsp";
    }

    //批量修改商品信息
    @RequestMapping("/editGoodsQuery")
    public ModelAndView editGoodsQuery(GoodsQueryVo goodsQueryVo)throws Exception{

        ModelAndView modelAndView = new ModelAndView();

        List<GoodsCustom> goodsList = testSSM.findGoodsList(goodsQueryVo);



        modelAndView.addObject("goodsList",goodsList);

        //指定视图
        modelAndView.setViewName("editGoodsQuery");

        return modelAndView;
    }
}
