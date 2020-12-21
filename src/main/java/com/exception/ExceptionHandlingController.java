package com.exception;

import org.springframework.web.bind.annotation.ControllerAdvice;
import org.springframework.web.bind.annotation.ExceptionHandler;
import org.springframework.web.servlet.ModelAndView;

@ControllerAdvice
public class ExceptionHandlingController {
    @ExceptionHandler(Exception.class)
    public ModelAndView getAllException(Exception e) {
        String error;
        if (e.getMessage() == null) {
            error = "Technical Error";
            return new ModelAndView("redirect:/index1", "errorMessage", error);
        }
        return new ModelAndView("redirect:/index1", "errorMessage", e.getMessage());
    }
}
