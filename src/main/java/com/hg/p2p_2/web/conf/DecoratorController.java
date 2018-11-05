package com.hg.p2p_2.web.conf;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/decorator")
public class DecoratorController {
    @RequestMapping("default")
    public String defaultDecorator() {
        return "/decorator/default";
    }
}
