package testMapper;

import testMapper.pojo.User;

public interface UserMapper {
     User findAllUserById (int uid)throws Exception;
     void insertUser (User user) throws Exception;
    void deleteUser (int uid) throws  Exception;
}
