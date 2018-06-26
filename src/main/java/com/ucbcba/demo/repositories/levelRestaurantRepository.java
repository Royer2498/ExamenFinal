package com.ucbcba.demo.repositories;
import org.springframework.data.repository.CrudRepository;
import javax.transaction.Transactional;
import com.ucbcba.demo.entities.levelRestaurant;

@Transactional
public interface levelRestaurantRepository extends CrudRepository<levelRestaurant,Integer> {

}
