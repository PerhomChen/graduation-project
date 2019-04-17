package interceptor;


import org.springframework.web.servlet.HandlerInterceptor;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 * 登陆拦截器
 */
public class LoginInterceptor implements HandlerInterceptor {

    @Override
    public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler) throws Exception {
       //获取请求的url
        String url = request.getRequestURI();
        //判断url是否为公开地址
        if(url.indexOf("user")>=0 || url.indexOf("goods")>=0 ||url.indexOf("page")>=0){
            return true;
        }

        Integer uid = (Integer)request.getSession().getAttribute("uid");
         if(uid != null && uid != 0){

         return true;
         }

        request.getRequestDispatcher("/user/login").forward(request,response);

        return false;
    }
}
