package service;

import entity.user.Address;
import entity.user.queryVo.UserCustom;

import java.util.EmptyStackException;
import java.util.List;

public interface UserService {
    /**
     * 检查登录
     * @param userCustom
     * @return
     * @throws Exception
     */
    public int checkLogin(UserCustom userCustom)throws Exception;

    /**
     * 检查密码是否正确
     * @param password
     * @param usalt
     * @param realPassword
     * @return
     * @throws Exception
     */
    public boolean checkPassword(String password ,String usalt ,String realPassword)throws Exception;

    /**
     * register user
     * @param userCustom
     * @return
     * @throws Exception
     */
    public boolean registerUser(UserCustom userCustom)throws  Exception;

    /**
     * select user address
     * @param uid
     * @return
     * @throws Exception
     */
    public List<Address> getUserAddressList(Integer uid) throws Exception;

    boolean addUserAddress(Address address)throws Exception;

    boolean updateUserAddress(Address address) throws Exception;

    boolean deleteUserAddress(Integer addressId) throws  Exception;

    Address getUserAddress (Integer addressId)throws Exception;
}
