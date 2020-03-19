package com.wsk.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

/**
 * 错误处理，跳转到错误提示页面.
 */
@Controller
public class ErrorController {

    @RequestMapping(value = "/error")
    public String error() {
        return "error";
    }

}
