package com.zzh.controller.backend;

import com.zzh.entity.Customization;
import com.zzh.entity.Product;
import com.zzh.entity.ProductOrder;
import com.zzh.entity.User;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

/**
 * Created by lenovo on 2019/2/22.
 */
@Controller
@RequestMapping("/admin")
public class BackendController {



    @RequestMapping("/index")
    public String indexView(Model model){

        int usernum=new User().selectCount(null);
        int pnum=new  Product().selectCount(null);
        int onum= new ProductOrder().selectCount(null);
        int cusnum= new Customization().selectCount(null);
        model.addAttribute("usernum",usernum);
        model.addAttribute("pnum",pnum);
        model.addAttribute("onum",onum);
        model.addAttribute("cusnum",cusnum);
        return "backend/index";
    }

    @RequestMapping("/userlist")
    public String userlist(){
        return "backend/user_list";
    }

    @RequestMapping("/nav")
    public String navigation(){
        return "backend/nav";
    }

    @RequestMapping("userupdate")
    public String userupdate(){
        return "backend/user_update";
    }

    @RequestMapping("cuslist")
    public String cuslist(){
        return "backend/customization_list";
    }

    @RequestMapping("/themelist")
    public String thememlist(){
        return "backend/theme_list";
    }

    @RequestMapping("/fileupload")
    public String fileupload(){
        return "backend/fileupload";
    }


}
