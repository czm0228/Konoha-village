package cn.kgc.mv.controller.config;


import cn.kgc.mv.constant.CrowdConstant;
import cn.kgc.mv.exception.LoginFailedException;
import cn.kgc.mv.util.CrowdUtil;
import cn.kgc.mv.util.ResultEntity;
import com.google.gson.Gson;
import org.springframework.web.bind.annotation.ControllerAdvice;
import org.springframework.web.bind.annotation.ExceptionHandler;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

/**
 * Created by helloworld on 2020/8/11.
 */

@ControllerAdvice  //表示当前类是一个基础注解的异常处理类
public class CrowdExceptionResolver {


    /*当出现了登录异常  所需要跳转的页面  commonResolver()方法判断是我否是Ajax请求和 要跳转的页面*/
    @ExceptionHandler(value = LoginFailedException.class)  //将一个具体的异常类型和一个方法关联起来
    public  ModelAndView resolverNullException(LoginFailedException exception,HttpServletRequest request,HttpServletResponse response) throws IOException {

        String viewName="login";
        return commonResolver(viewName,exception,request,response);
    }


    /*当出现了数学异常  所需要跳转的页面  commonResolver()方法判断是我否是Ajax请求和 要跳转的页面*/
    @ExceptionHandler(value = ArithmeticException.class)  //将一个具体的异常类型和一个方法关联起来
    public  ModelAndView resolverNullException(ArithmeticException exception,HttpServletRequest request,HttpServletResponse response) throws IOException {

        String viewName="system-error";
        return commonResolver(viewName,exception,request,response);
    }

    /*当出现了空指针异常  所需要跳转的页面  commonResolver()方法判断是我否是Ajax请求和 要跳转的页面*/
    @ExceptionHandler(value = NullPointerException.class)  //将一个具体的异常类型和一个方法关联起来
    public  ModelAndView resolverNullException(NullPointerException exception,HttpServletRequest request,HttpServletResponse response) throws IOException {

        String viewName="system-error";
        return commonResolver(viewName,exception,request,response);
    }


    /*将一个具体的异常类型和方法集合起来*/
    public ModelAndView  commonResolver(
            //异常处理完成后去的页面
            String viewName,
            //实际的异常类型
            Exception exception,
            //当前请求的对象
            HttpServletRequest request,
            //当前响应对象
            HttpServletResponse response
    ) throws IOException {
        // 1.判断当前请求类型(是否为ajax请求)
        boolean judgeResult = CrowdUtil.judgeRequestType(request);

        // 2.如果是Ajax请求
        if(judgeResult) {

            // 3.创建ResultEntity对象
            ResultEntity<Object> resultEntity = ResultEntity.failed(exception.getMessage());

            // 4.创建Gson对象
            Gson gson = new Gson();

            // 5.将ResultEntity对象转换为JSON字符串
            String json = gson.toJson(resultEntity);

            // 6.将JSON字符串作为响应体返回给浏览器
            response.getWriter().write(json);

            // 7.由于上面已经通过原生的response对象返回了响应，所以不提供ModelAndView对象
            return null;
        }

        // 8.如果不是Ajax请求则创建ModelAndView对象
        ModelAndView modelAndView = new ModelAndView();

        // 9.将Exception对象存入模型
        modelAndView.addObject(CrowdConstant.ATTR_NAME_EXCEPTION, exception);

        // 10.设置对应的视图名称
        modelAndView.setViewName(viewName);

        // 11.返回modelAndView对象
        return modelAndView;

    }


}
