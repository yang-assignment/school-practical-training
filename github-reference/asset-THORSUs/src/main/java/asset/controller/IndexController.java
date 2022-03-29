package asset.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.view.RedirectView;


@Controller
public class IndexController {
    @RequestMapping("/")
    public ModelAndView getLoginView(ModelAndView view){
        view.setView(new RedirectView("/login.html",false));
        return view;
    }
}
