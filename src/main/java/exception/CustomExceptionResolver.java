package exception;

import org.springframework.web.servlet.HandlerExceptionResolver;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * 全局异常处理器
 */
public class CustomExceptionResolver implements HandlerExceptionResolver {
    /**
     * e:系统抛出的异常；
     * @param httpServletRequest
     * @param httpServletResponse
     * @param o
     * @param e
     * @return
     */
    @Override
    public ModelAndView resolveException(HttpServletRequest httpServletRequest,
                                         HttpServletResponse httpServletResponse,
                                         Object o, Exception e) {

        CustomException customException = null;
        if(e instanceof CustomException){
            // --如果该异常类型是系统 自定义异常，直接取出异常信息，在错误页面显示
            customException = (CustomException)e;
        }else{
            // --如果该异常类型不是系统的自定义异常，构造一个自定义的异常类型（信息为：“未知错误”）
            customException = new CustomException("未知错误");
        }

        String message = customException.getMessage();

        ModelAndView modelAndView = new ModelAndView();

        //将错误信息添加到ModelAndView
        modelAndView.addObject("message",message);

        //指向错误的页面
        modelAndView.setViewName("error");


        return modelAndView;
    }
}
