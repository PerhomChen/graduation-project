package test;


import entity.user.Address;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.redis.core.RedisTemplate;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;
import redis.clients.jedis.HostAndPort;
import redis.clients.jedis.Jedis;
import redis.clients.jedis.JedisPool;
import utils.RedisUtil;

import java.util.HashSet;
import java.util.Set;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration("classpath:applicationContext.xml")
public class JedisTest {

    @Autowired
    private RedisTemplate<String,Object> redisTemplate;


    @Test
    public void testJedis()throws Exception{
        //创建一个连接Jedis对象，参数：host、port
        Jedis jedis = new Jedis("127.0.0.1",6379);

        //直接使用jedis操作redis，所有jedis的命令都对应一个方法。
        jedis.set("test123","my frist jedis test");
        String str = jedis.get("test123");
        System.out.println(str);
        //关闭连接
        jedis.close();

    }

    public void testJedisPool() throws Exception{
        //创建一个连接池对象，两个参数host，pool
        JedisPool jedisPool = new JedisPool("127.0.0.1",6379);
        //从连接池获得一个连接，就是一个jedis对象。
        Jedis jedis = jedisPool.getResource();

        //使用jedis操作redis
        jedis.set("test123","my frist jedis test");
        String str = jedis.get("test123");
        System.out.println(str);
        //关闭连接
        jedis.close();
        //关闭连接
        jedisPool.close();
    }

    /**
     *
     * @throws Exception
     */
    public void testJedisCluster() throws Exception{
        //创建一个JedisCluster对象，有一个参数nodes是一个set类型，set中有若干个HostAndPost对象，
        Set<HostAndPort> nodes = new HashSet<>();
        //直接使用JedisCluster对象操作redis
    }


    @Test
    public void redisTest() {
        Address address = new Address();
        address.setuid(1);
        address.setAddress("dfsjkl");
        address.setPhone("37483");
        address.setUsername("dfdfhjk");
     this.redisTemplate.opsForValue().set("address",address);
      address =(Address) this.redisTemplate.opsForValue().get("address");
        System.out.println(address.toString());
    }

    @Test
    public void redisUtilTest(){
        Address address = new Address();
        address.setuid(2);
        address.setAddress("dfsjkl");
        address.setPhone("37483");
        address.setUsername("dfdfhjk");
        RedisUtil.set("address1",address);
        address = (Address)RedisUtil.get("address1");
        System.out.println(address.toString());

    }



}
