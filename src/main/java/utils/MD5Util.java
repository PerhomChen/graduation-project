package utils;

import java.security.MessageDigest;
import java.util.Random;

public class MD5Util {

    /**
     * 把要进行加密的str  加密，并返回字符串类型的加密后的密文
     * @param str
     * @return
     */
    public static String md5Hex(String str) {
        try {
            MessageDigest md = MessageDigest.getInstance("MD5");
            byte[] digest = md.digest(str.getBytes());
            return hex(digest);
        } catch (Exception e) {
            e.printStackTrace();
            System.out.println(e.toString());
            return "";
        }
    }

    /**
     * 把加密后的字符数组转换为字符串
     * @param arr
     * @return
     */
    private static String hex(byte[] arr) {
        StringBuffer sb = new StringBuffer();
        for (int i = 0; i < arr.length; ++i) {
            sb.append(Integer.toHexString((arr[i] & 0xFF) | 0x100).substring(1, 3));
        }
        return sb.toString();
    }

    /**
     * 获得salt
     * @param password
     * @return
     */
    public static String getSaltMD5(String password) {
        // 生成一个16位的随机数
        Random random = new Random();
        StringBuilder sBuilder = new StringBuilder(16);
        sBuilder.append(random.nextInt(99999999)).append(random.nextInt(99999999));
        int len = sBuilder.length();
        if (len < 16) {
            for (int i = 0; i < 16 - len; i++) {
                sBuilder.append("0");
            }
        }
        // 生成最终的加密盐
        String salt = sBuilder.toString();

        return  salt;
    }




    public static void main(String[] args) {
        // 原密码
        String plaintext = "hong1314";

       String salt = "7029995924062280";
       String userPwd = MD5Util.md5Hex(plaintext+salt);
        String userPwd1 = MD5Util.md5Hex(plaintext+salt);
        System.out.println(userPwd);
        System.out.println(userPwd1);
       String readPwd = "16b802ee3dbd738679fcebb858b9825f";
        System.out.println(userPwd.equals(readPwd));

    }




}
