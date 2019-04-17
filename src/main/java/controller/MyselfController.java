package controller;

import entity.user.Myself;
import entity.user.Temp;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import service.MyselfService;

import javax.servlet.http.HttpSession;
import java.util.List;

@Controller
@RequestMapping("/myself")
public class MyselfController {

    @Autowired
    private MyselfService myselfService;

    /**跳转个人中心
     * @return
     * @throws Exception
     */
    @RequestMapping("/Myself")
    public String Myself() throws Exception{

        return "self_info";
    }

    @RequestMapping("/MyselfInfo")
    @ResponseBody
    public Myself MyselfInfo(HttpSession httpSession)throws Exception{
        Integer uid = (Integer) httpSession.getAttribute("uid");

        //调用service层根据uid查询出用户的个人信息
        Myself myself  =  myselfService.getMyselfInfo(uid);
        return  myself;
    }

    @RequestMapping("/updateMyself")
    @ResponseBody
    public String updateMyself (@RequestBody Temp temp, HttpSession httpSession)throws Exception{

        Integer uid =(Integer) httpSession.getAttribute("uid");

        Myself myself = new Myself();
        myself.setUid(uid);
        System.out.println(temp.getKey());
        //判断key是哪个
        if(temp.getKey().equals("username")){
           myself.setUsername(temp.getValue());
        }else if(temp.getKey().equals("signature")){
            myself.setSignature(temp.getValue());
        }else{
            myself.setHobby(temp.getValue());
        }

        //调用Service层更新用户修改的个人信息
       boolean flag =   myselfService.updateMyselfInfo(myself);
        if(flag){
            return "ok-updateMyself";
        }
            return "ok-updateMyself";
    }

}
