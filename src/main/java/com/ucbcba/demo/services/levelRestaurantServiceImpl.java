package com.ucbcba.demo.services;
import com.ucbcba.demo.entities.levelRestaurant;
import com.ucbcba.demo.repositories.PhotoRepository;
import com.ucbcba.demo.repositories.levelRestaurantRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Service;

@Service
public class levelRestaurantServiceImpl implements levelRestaurantService{

    private levelRestaurantRepository levelRestaurantRepository;

    @Autowired
    @Qualifier(value = "levelRestaurantRepository")
    public void setLevelRestaurantRepository(levelRestaurantRepository levelRestaurantRepository) {
        this.levelRestaurantRepository = levelRestaurantRepository;
    }


    @Override
    public Iterable<levelRestaurant> listAllLevelRestaurants() {
        return levelRestaurantRepository.findAll();
    }

    @Override
    public void saveLevelRestaurant(levelRestaurant levelRestaurant) {
        levelRestaurantRepository.save(levelRestaurant);
    }

    @Override
    public levelRestaurant getLevelRestaurant(Integer id) {
        return levelRestaurantRepository.findOne(id);
    }

    @Override
    public void deleteLevelRestaurant(Integer id) {
        levelRestaurantRepository.delete(id);
    }
}
