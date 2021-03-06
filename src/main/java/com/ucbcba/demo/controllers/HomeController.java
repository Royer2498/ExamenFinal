package com.ucbcba.demo.Controllers;

import com.ucbcba.demo.entities.Category;
import com.ucbcba.demo.entities.City;
import com.ucbcba.demo.entities.Restaurant;
import com.ucbcba.demo.services.CityService;
import com.ucbcba.demo.services.RestaurantService;
import com.ucbcba.demo.services.UserService;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.security.core.userdetails.User;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import java.sql.Struct;
import java.util.*;
import java.util.stream.Collectors;

@Controller
public class HomeController {

    private final UserService userService;
    private final RestaurantService restaurantService;
    private final CityService cityService;

    public HomeController(UserService userService, RestaurantService restaurantService, CityService cityService) {
        this.userService = userService;
        this.restaurantService = restaurantService;
        this.cityService = cityService;
    }

    @RequestMapping(value = {"/", "/home"}, method = RequestMethod.GET)
    public String welcome(Model model, @RequestParam(value = "searchFilter", required = false, defaultValue = "") String searchFilter, @RequestParam(value = "cityDropdown", required = false, defaultValue = "") String cityDropdown, @RequestParam(value = "scoresDropdown", required = false, defaultValue = "") String scoresDropdown, @RequestParam(value = "showContent", required = false, defaultValue = "") String showContent, @RequestParam(value = "firstTime", required = false, defaultValue = "true") String firstTime) {
        Authentication auth = SecurityContextHolder.getContext().getAuthentication();
        Boolean logged = (!getUserRole(auth).equals("notLogged"));
        com.ucbcba.demo.entities.User user = new com.ucbcba.demo.entities.User();
        class Score {
            String n;
            Integer calif;

            public Score(String n, Integer a) {
                this.n = n;
                this.calif = a;
            }

            public String getN() {
                return n;
            }

            public Integer getCalif() {
                return calif;
            }

            public void setN(String n) {
                this.n = n;
            }

            public void setCalif(Integer n) {
                this.calif = n;
            }
        }
        Score[] score = new Score[5];
        score[0] = new Score("Grater than 1 star", 1);
        score[1] = new Score("Grater than 2 star", 2);
        score[2] = new Score("Grater than 3 star", 3);
        score[3] = new Score("Grater than 4 star", 4);
        score[4] = new Score("Grater than 5 star", 5);

        User u;
        Integer city = -1;
        if (logged) {
            u = (org.springframework.security.core.userdetails.User) auth.getPrincipal();
            user = userService.findByUsername(u.getUsername());
            city = user.getCity().getId();
        }
        model.addAttribute("user", user);
        model.addAttribute("role", getUserRole(auth));
        model.addAttribute("logged", logged);
        model.addAttribute("cities", cityService.listAllCities());
        model.addAttribute("scores", score);
        String search = "";
        if (!searchFilter.equals("")) {
            search = searchFilter;
        }
        model.addAttribute("search", search);

        String citySelected = "";
        if (!cityDropdown.equals("All cities")) {
            citySelected = cityDropdown;
        }

        String scoreSelected = "";
        if (!scoresDropdown.equals("All scores")) {
            scoreSelected = scoresDropdown;
        }

        String showTable = "table";
        if (showContent.equals("map")) {
            showTable = showContent;
        }
        model.addAttribute("showTable", showTable);
        List<Restaurant> allRestaurants = new ArrayList<>();
        List<Restaurant> filteredRestaurants = null;
        for (Restaurant restaurant : restaurantService.listAllRestaurants()) {
            allRestaurants.add(restaurant);
        }

        String first = "false";
        Integer scoreInput=0;
        if (!scoresDropdown.equals("") && !scoresDropdown.equals("All scores")) {
            scoreInput = Integer.parseInt(scoresDropdown);
        }
        final Integer compScore=scoreInput;
        if (firstTime.equals("true") && city != -1) {
            filteredRestaurants = (List<Restaurant>) restaurantService.listAllRestaurantsByCity(city);
            citySelected = user.getCity().getName();
        } else {
            if (cityDropdown.equals("All cities") && scoresDropdown.equals("All scores")) {
                filteredRestaurants = allRestaurants.stream().filter(
                        p -> (p.getName().toLowerCase().contains(searchFilter.toLowerCase())
                                || searchCategories(p.getCategories(), searchFilter.toLowerCase())
                        )
                ).collect(Collectors.toList());

            } else {

                if (!cityDropdown.equals("All cities") && scoresDropdown.equals("All scores")) {
                    filteredRestaurants = allRestaurants.stream().filter(
                            p -> (
                                    (p.getName().toLowerCase().contains(searchFilter.toLowerCase())
                                            || searchCategories(p.getCategories(), searchFilter.toLowerCase()))
                                            && p.getCity().getName().toLowerCase().contains(cityDropdown.toLowerCase())
                            )
                    ).collect(Collectors.toList());
                } else {
                    if (cityDropdown.equals("All cities") && !scoresDropdown.equals("All scores")) {
                        filteredRestaurants = allRestaurants.stream().filter(
                                p -> (
                                        (p.getName().toLowerCase().contains(searchFilter.toLowerCase())
                                                || searchCategories(p.getCategories(), searchFilter.toLowerCase()))
                                                && restaurantService.getScore(p.getId()) >= compScore
                                )

                        ).collect(Collectors.toList());
                    } else {
                        if (!cityDropdown.equals("All cities") && !scoresDropdown.equals("All scores")) {
                            filteredRestaurants = allRestaurants.stream().filter(
                                    p -> (
                                            (p.getName().toLowerCase().contains(searchFilter.toLowerCase())
                                                    || searchCategories(p.getCategories(), searchFilter.toLowerCase()))
                                                    && p.getCity().getName().toLowerCase().contains(cityDropdown.toLowerCase())
                                                    && restaurantService.getScore(p.getId()) >= compScore
                                    )
                            ).collect(Collectors.toList());
                        }
                    }

                }
            }
        }

        filteredRestaurants.sort((r1, r2) -> {
            Integer s1, s2;
            s1 = restaurantService.getScore(r1.getId());
            s2 = restaurantService.getScore(r2.getId());
            return s2.compareTo(s1);
        });
        model.addAttribute("citySelected", citySelected);
        model.addAttribute("scoreSelected", scoreSelected);
        model.addAttribute("firstTime", first);
        model.addAttribute("restaurants", filteredRestaurants);
        List<Restaurant> restaurantsList = new ArrayList<>();

        filteredRestaurants.forEach(r -> {
            Restaurant rest = new Restaurant();
            rest.setId(r.getId());
            rest.setName(r.getName());
            rest.setLatitude(r.getLatitude());
            rest.setLongitude(r.getLongitude());
            restaurantsList.add(rest);
        });

        model.addAttribute("restaurantsList", restaurantsList);
        return "home";
    }


    private Boolean searchCategories(Set<Category> categories, String param) {
        for (Category category : categories) {
            if (category.getName().toLowerCase().contains(param))
                return true;
        }
        return false;
    }

    private String getUserRole(Authentication auth) {
        if (!auth.getPrincipal().equals("anonymousUser")) {
            User u = (org.springframework.security.core.userdetails.User) auth.getPrincipal();
            com.ucbcba.demo.entities.User user = userService.findByUsername(u.getUsername());
            return user.getRole().toLowerCase();
        }
        return "notLogged";
    }
}