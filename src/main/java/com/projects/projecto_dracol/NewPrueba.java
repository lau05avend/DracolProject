package com.projects.projecto_dracol;

import org.springframework.web.bind.annotation.CrossOrigin;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RestController;


@RestController
@CrossOrigin
public class NewPrueba {

    @GetMapping("/")
    public String home() {
        return "hola from spring boot";
    }
}
