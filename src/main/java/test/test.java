package test;



import org.apache.ibatis.io.Resources;
import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;
import org.apache.ibatis.session.SqlSessionFactoryBuilder;
import org.junit.Test;
import testMapper.pojo.User;

import java.io.IOException;
import java.io.InputStream;
import java.util.List;

public class test {
   static SqlSession sqlSession = null;
    static{
        String resource ="SqlMapConfig.xml";
        InputStream inputStream = null;

        {
            try {
                inputStream = Resources.getResourceAsStream(resource);
            } catch (IOException e) {
                e.printStackTrace();
            }
        }

        SqlSessionFactory sqlSessionFactory = new SqlSessionFactoryBuilder().build(inputStream);

        sqlSession = sqlSessionFactory.openSession();
    }

    @Test
    public void findAllUser () throws IOException {



       /*parameter1:statement的id ： namespace+id*/
       User user = sqlSession.selectOne("test.findAllUser",1);

        System.out.println(user);

       sqlSession.close();
    }

    /**
     * 模糊查询
     * @throws IOException
     */
    @Test
    public void findAllUserByName () throws IOException {


        /*parameter1:statement的id ： namespace+id*/
        List<User> list = sqlSession.selectList("test.findAllUserByName","or");

        for(User u :list) {
            System.out.println(u);
        }
        sqlSession.close();
    }

    /**
     * insert user
     * @throws IOException
     */
    @Test
    public void insertUser () throws IOException {
        User user = new User ();
        user.setUsername("lisa");
        user.setAge(50);
        user.setAddress("canada");
        user.setGender(false);
        user.setPassword("1234");
        user.setMail("761732025@qq.com");
        user.setPhone("11111111-1");

        System.out.println(user);
        /*parameter1:statement的id ： namespace+id*/
        sqlSession.insert("test.insertUser",user);
        sqlSession.commit();
        System.out.println(user.getUid());
        sqlSession.close();
    }

    /**
     * delete user
     * @throws IOException
     */
    @Test
    public void deletetUser () throws IOException {

        /*parameter1:statement的id ： namespace+id*/
        sqlSession.insert("test.deleteUserById",6);
        sqlSession.commit();
        sqlSession.close();
    }

    /**
     * update user
     * @throws IOException
     */
    @Test
    public void updatetUser () throws IOException {
        User user = new User ();
        user.setUid(4);
        user.setUsername("lisa");
        user.setAge(50);
        user.setAddress("canada");
        user.setGender(false);
        user.setPassword("1234");
        user.setMail("761732025@qq.com");
        user.setPhone("4444444");

        System.out.println(user);
        /*parameter1:statement的id ： namespace+id*/
        sqlSession.update("test.updateUserById",user);
        sqlSession.commit();
        sqlSession.close();
    }

}
