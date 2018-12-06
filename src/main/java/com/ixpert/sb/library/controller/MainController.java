package com.ixpert.sb.library.controller;

import com.ixpert.sb.library.model.Book;
import com.ixpert.sb.library.respository.BookRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.propertyeditors.CustomDateEditor;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.WebDataBinder;
import org.springframework.web.bind.annotation.*;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.Date;

@Controller
public class MainController {

    @Autowired
    BookRepository bookRepository;


    @InitBinder
    public void initBinder(WebDataBinder binder){
        binder.registerCustomEditor(Date.class, new CustomDateEditor(new SimpleDateFormat("yyyy-MM-dd"),false));
    }

    @GetMapping("/")
    public String init(HttpServletRequest request){
        request.setAttribute("allBooks", bookRepository.findAll());
        request.setAttribute("mode","BOOK_VIEW");
        return "index";
    }



    @GetMapping("/updateBook")
    public String update(@RequestParam long id, HttpServletRequest request){
        System.out.println("\n ## Inside updateBook .. Passed id: "+id);
        request.setAttribute("book", bookRepository.getOne(id));
        //request.setAttribute("book", bookRepository.findById(id));
        request.setAttribute("mode", "BOOK_EDIT");
        return "index";
    }


    @PostMapping("/save")
    public void saveBook(@ModelAttribute Book book, HttpServletRequest request, HttpServletResponse response) throws IOException {
        System.out.println("\n ## Inside saveBook .. ## Purchase date: "+book.getPurchaseDate());
        request.setAttribute("allBooks", bookRepository.findAll());
        request.setAttribute("mode", "BOOK_VIEW");
        bookRepository.save(book);

        response.sendRedirect("/");
    }


    @GetMapping("/newBook")
    public String newBook(HttpServletRequest request){

        System.out.println("\n ## Inside newBook .. ##");
        request.setAttribute("mode","BOOK_NEW");
        return "index";
    }








}
