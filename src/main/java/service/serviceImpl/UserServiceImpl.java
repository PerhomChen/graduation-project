package service.serviceImpl;

import entity.user.Address;
import entity.user.User;
import entity.user.queryVo.UserCustom;
import mapper.user.AddressMapper;
import mapper.user.UserMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import service.UserService;
import utils.MD5Util;

import java.util.List;


@Service
public class UserServiceImpl implements UserService {
    //UserMapper
    @Autowired
    private UserMapper userMapper;

    @Autowired
    private AddressMapper addressMapper;

    /**
     * check phone
     * @param userCustom
     * @return
     * @throws Exception
     */
    @Override
    @Transactional
    public int checkLogin(UserCustom userCustom) throws Exception {

        String phone = userCustom.getPhone();
        String password = userCustom.getPassword();

         User user =  userMapper.selectByPhone(phone);

         //获得用户id
        System.out.println(user.getUid());
        int uid = user.getUid();
         //校验是否正确的标志位
         boolean flag = false;

         if(user ==null){
             return 0;
         }else {

             String usalt = user.getUsalt();
             String realPassword = user.getPassword();
             flag =  checkPassword(password,usalt,realPassword);

            return   flag? uid : 0;
         }


    }

    /**
     * check password
     * @param password
     * @param usalt
     * @param realPassword
     * @return
     * @throws Exception
     */
    @Override
    @Transactional
    public boolean checkPassword(String password ,String usalt,String realPassword) throws Exception {

        boolean flag = false;
        System.out.println(realPassword);
        String userPwd = MD5Util.md5Hex(password+usalt);

        System.out.println(userPwd);

        return userPwd.equals(realPassword);
    }

    /**
     * register user (用户注册)
     * @param userCustom
     * @return
     * @throws Exception
     */
    @Override
    @Transactional
    public boolean registerUser(UserCustom userCustom) throws Exception {

        boolean flag = false;

        try {
            //查询手机号是否存在
            User user = userMapper.selectByPhone(userCustom.getPhone());
            if(user == null){
                String password = userCustom.getPassword();
                String usalt = MD5Util.getSaltMD5(password);
                userCustom.setUsalt(usalt);
                //test
                String realPwd = MD5Util.md5Hex(usalt+password);
                userCustom.setPassword(realPwd);
                userMapper.insertSelective(userCustom);
                flag = true;
            }

        } catch (Exception e) {
            e.printStackTrace();
        }

        return flag;
    }

    /**
     * select user address
     * @param uid
     * @return
     * @throws Exception
     */
    @Override
    public List<Address> getUserAddressList(Integer uid) throws Exception {

        //调用addressMapper查询地址

        return addressMapper.selectByUid(uid);
    }

    /**
     * add address
     * @param address
     * @return
     * @throws Exception
     */
    @Override
    public boolean addUserAddress(Address address) throws Exception {

       Integer addressId =  addressMapper.insert(address);

        System.out.println(addressId);

       if(address!=null){
           return true;
       }
       else{
           return false;
       }
    }

    /**
     * update address
     * @param address
     * @return
     * @throws Exception
     */
    @Override
    public boolean updateUserAddress(Address address) throws Exception {

       Integer addressId =  addressMapper.updateByPrimaryKeySelective(address);

        System.out.println(addressId);

        if(address!=null){
            return true;
        }
       else{
            return false;
        }
    }

    /**
     * 删除
     * @param
     * @return
     * @throws Exception
     */
    @Override
    public boolean deleteUserAddress(Integer addressId) throws Exception {

         Integer flag =   addressMapper.deleteByPrimaryKey(addressId);

        System.out.println(flag);

        if(flag!=null){
            return true;
        }
        else{
            return false;
        }
    }

    /**
     * 请求用户订单的地址信息
     * @param addressId
     * @return
     * @throws Exception
     */
    @Override
    public Address getUserAddress(Integer addressId) throws Exception {

        return  addressMapper.selectByPrimaryKey(addressId);
    }
}
