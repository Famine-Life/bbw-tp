package com.wsk.aspect;

import org.aspectj.lang.annotation.Aspect;
import org.aspectj.lang.annotation.Before;

@Aspect
public class OnlyOneUser {
    @Before(value = "execution(* com.wsk.controller.UserController.login(..))")
    public void isExit(){

    }
}
