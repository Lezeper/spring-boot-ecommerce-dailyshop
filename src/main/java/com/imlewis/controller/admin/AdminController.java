package com.imlewis.controller.admin;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/admin")
public class AdminController {


    @RequestMapping
    public String admin(){
        return "admin/admin";
    }


}
