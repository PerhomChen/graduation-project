package converter;

import org.springframework.core.convert.converter.Converter;

import java.util.Date;
import java.text.ParseException;
import java.text.SimpleDateFormat;

public class CustomDateConverter implements Converter<String, Date> {
    @Override
    public Date convert(String s) {
        //实现将日期串转换成日期类型（）
        SimpleDateFormat simpleDateFormat = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");

        try {
            return simpleDateFormat.parse(s);
        } catch (ParseException e) {
            e.printStackTrace();
        }

     //绑定失败返回null
        System.out.println("日期转换失败！！");
        return null;
    }
}
