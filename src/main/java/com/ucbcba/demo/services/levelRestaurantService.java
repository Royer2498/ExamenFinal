package com.ucbcba.demo.services;

import com.ucbcba.demo.entities.levelRestaurant;

public interface levelRestaurantService {

    Iterable<levelRestaurant> listAllLevelRestaurants();

    void saveLevelRestaurant(levelRestaurant levelRestaurant);

    levelRestaurant getLevelRestaurant(Integer id);

    void deleteLevelRestaurant(Integer id);
}
