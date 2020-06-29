package ovh.devnote.ksiegarnia.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;
import ovh.devnote.ksiegarnia.entity.Koszyk;
import ovh.devnote.ksiegarnia.entity.Zamowione;
import ovh.devnote.ksiegarnia.services.CartService;
import ovh.devnote.ksiegarnia.services.OrderService;

import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

@Controller
@RequestMapping(value = "/order", method = { RequestMethod.GET, RequestMethod.POST })
public class OrderController {

    @Autowired
    CartService cartService;
    @Autowired
    OrderService orderService;


    @PreAuthorize("hasRole('ROLE_USER')")
    @PostMapping("/addToOrder")
    public String  addToOrder()
    {
        Object principal = SecurityContextHolder.getContext().getAuthentication().getPrincipal();

        String username;
        if (principal instanceof UserDetails) {
            username = ((UserDetails)principal).getUsername();
        } else {
            username = principal.toString();
        }

        List<Koszyk> products = cartService.getKoszyk(username);
        System.out.println("KOSZTK -----------------------------------------" + products);

        Zamowione zamowione = new Zamowione();

        SimpleDateFormat formatter= new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");

        for (Koszyk kosz: products) {
            Date date = new Date(System.currentTimeMillis());
            zamowione.setCena(kosz.getCena());
            zamowione.setData(formatter.format(date).toString());
            zamowione.setKategoria(kosz.getKategoria());
            zamowione.setNazwa(kosz.getNazwa());
            zamowione.setStatus("zamówione");
            zamowione.setUsername(username);

            orderService.addToOrder(zamowione);

        }

        for (Koszyk kosz: products) {
           cartService.deleteCart(kosz.getId());

        }

        return "redirect:/order/list";


    }

    @PreAuthorize("hasRole('ROLE_USER')")
    @GetMapping("/list")
    public String  orderList(Model model)
    {
        Object principal = SecurityContextHolder.getContext().getAuthentication().getPrincipal();
        String username;
        if (principal instanceof UserDetails) {
            username = ((UserDetails)principal).getUsername();
        } else {
            username = principal.toString();
        }

        List<Zamowione> zamowioneList = orderService.getOrder(username);
        model.addAttribute("orders", zamowioneList);
        return "order";
    }

    @PreAuthorize("hasRole('ROLE_ADMIN')")
    @GetMapping("/listAdmin")
    public String  orderListAdmin(Model model)
    {
        Object principal = SecurityContextHolder.getContext().getAuthentication().getPrincipal();
        String username;
        if (principal instanceof UserDetails) {
            username = ((UserDetails)principal).getUsername();
        } else {
            username = principal.toString();
        }
        List<Zamowione> zamowioneList = orderService.getOrders();
        model.addAttribute("orders", zamowioneList);
        return "orderAdmin";
    }

    @PreAuthorize("hasRole('ROLE_ADMIN')")
    @PostMapping("/done")
    public String  done(@RequestParam("orderId") int orderId)
    {
        Zamowione zamowione = new Zamowione();
       zamowione = orderService.getOrderId(orderId);
        zamowione.setStatus("Zrealizowane");
        orderService.changeStatus(zamowione);

        return "redirect:/order/listAdmin";
    }








}
