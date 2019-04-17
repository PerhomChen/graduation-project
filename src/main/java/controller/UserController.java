package controller;




import entity.user.Address;
import entity.user.queryVo.UserCustom;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.*;
import service.UserService;
import javax.servlet.http.HttpSession;
import java.util.ArrayList;
import java.util.List;


@Controller
@RequestMapping("/user")
public class UserController {

    @Autowired
    private UserService userService;

    @RequestMapping("/login" )
    public  String login(HttpSession session)throws Exception{

        return "login";
    }
    //登录校验
    @RequestMapping(value = "/loginCheck" ,method = RequestMethod.POST)
    @ResponseBody
    public  String loginCheck(UserCustom userCustom,HttpSession httpSession)throws Exception{
        //返回判断的条件

        int uid = userService.checkLogin(userCustom);
        if(uid !=0){
           httpSession.setAttribute("uid",uid);
          return  "ok";
        }else{
            return "ex";
        }
    }

    @RequestMapping("/ai")
    public String ai(HttpSession httpSession)throws Exception{

        Integer uid = (Integer) httpSession.getAttribute("uid");
        System.out.println(uid);

        return "ai";
    }


    /*注册*/
    @RequestMapping("/register")
    public String register()throws Exception{
        return "register";
    }

    /*注册用户*/
    @RequestMapping(value="/registerUser",method = RequestMethod.POST)
    @ResponseBody
    public String registerUser(UserCustom userCustom)throws Exception{


      boolean flag =   userService.registerUser(userCustom);
        System.out.println(flag);

    if(flag){
        return "ok-register";
    }else {
        return "ex-register";
    }

    }

    /*请求用户地址*/
    @RequestMapping("/addressList")
    @ResponseBody
    public List<Address> addressList(HttpSession httpSession) throws Exception{

        //取得用户id
       Integer uid = (Integer) httpSession.getAttribute("uid");

       //使用uid调用service查询用户的地址
        List<Address> addressList = new ArrayList<>();
        addressList = userService.getUserAddressList(uid);

        return addressList;

        //对addressList进行非空的判断
       /* List<Object> object = new ArrayList<>();
        String flag = "";

        if(addressList ==null){
            flag = "ex-addressList";
            object.add(flag);

            return  object;
        }else{
            flag = "ok-addressList";
            object.add(flag);
            object.add(addressList);
            return  object;
        }*/

    }

    //添加用户地址

    @RequestMapping("/addUserAddress")
    @ResponseBody
    public String addUserAddress(HttpSession httpSession ,@RequestBody Address address)throws Exception{


        System.out.println(address);
        Integer uid =(Integer) httpSession.getAttribute("uid");
        address.setuid(uid);
        //调用service层添加用户地址
       boolean flag =  userService.addUserAddress(address);
       if(flag){
           return "ok-addUserAddress";
       }else{
           return "ex-addUserAddress";
       }

    }

    /*删除用户地址*/
    @RequestMapping("/deleteUserAddress")
    @ResponseBody
    public String deleteAddress(HttpSession httpSession,@RequestBody String addressId)throws Exception{

        Integer addressIdReal = Integer.parseInt(addressId);

        System.out.println(addressIdReal);
        //调用service删除用户地址
      boolean flag =  userService.deleteUserAddress(addressIdReal);

      if(flag){
          return  "ok-deleteAddress";
      }else{
          return  "ex-deleteAddress";
      }

    }

    /*根据addressId请求地址*/
    @RequestMapping("/selectAddress")
    @ResponseBody
    public Address selectAddress (@RequestBody String addressId)throws Exception{

        Integer addressIdReal = Integer.parseInt(addressId);
        System.out.println(addressIdReal);

        Address address = new Address() ;
        address =  userService.getUserAddress(addressIdReal);

        return address;

    }

    /*更新用户地址*/
    @RequestMapping("/updateUserAddress")
    @ResponseBody
    public String updataUserAddress(HttpSession httpSession ,@RequestBody Address address)throws Exception{

        Integer uid =(Integer) httpSession.getAttribute("uid");
        address.setuid(uid);
        System.out.println(address.toString());

        boolean flag = userService.updateUserAddress(address);
        if(flag){
            return "ok-updataUserAddress";
        }else{
            return "ex-updataUserAddress";
        }

    }





    //退出
    @RequestMapping("/logout")
    public String logout(HttpSession session)throws Exception{
        session.invalidate();


        return "login";
    }

}
