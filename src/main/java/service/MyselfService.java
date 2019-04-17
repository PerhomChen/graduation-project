package service;

import entity.user.Myself;

public interface MyselfService {

    Myself getMyselfInfo(Integer uid)throws Exception;

    boolean updateMyselfInfo(Myself myself)throws Exception;
}
