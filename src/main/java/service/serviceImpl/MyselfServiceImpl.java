package service.serviceImpl;

import entity.user.Myself;
import exception.CustomException;
import mapper.user.MyselfMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import service.MyselfService;
import utils.MD5Util;

@Service
public class MyselfServiceImpl implements MyselfService {

    @Autowired
    private MyselfMapper myselfMapper;

    @Override
    public Myself getMyselfInfo(Integer uid) throws Exception {
        Myself myself1 = new Myself();
       Myself myself  = myselfMapper.selectByUid(uid);

        System.out.println(myself);
       if(myself==null){
           /*为空设置默认值*/
           myself1.setMyselfId(0);
           myself1.setUid(uid);
           myself1.setHobby("无");
           myself1.setSignature("无");
          String randomUsername = MD5Util.getSaltMD5("123456");
           System.out.println(randomUsername);
           myself1.setUsername(randomUsername);
           return myself1;
       }else{
           return myself;
       }


    }

    @Override
    public boolean updateMyselfInfo(Myself myself) throws Exception {
        int res = 0 ;
        System.out.println(myself.toString());
        //查询数据库
        Myself myself1  = myselfMapper.selectByUid(myself.getUid());
        if(myself1==null){
          res =   myselfMapper.insertSelective(myself);

        }else{
            res = myselfMapper.updateByPrimaryKeySelective(myself);
        }

        //对res进行检验
        if(res==0){
            throw new CustomException("网络错误，更新失败！");

        }
        return true;
    }
}
