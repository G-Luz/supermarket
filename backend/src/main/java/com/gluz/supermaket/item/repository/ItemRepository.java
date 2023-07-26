package com.gluz.supermaket.item.repository;

import com.gluz.supermaket.item.domain.Item;
import com.gluz.supermaket.product.domain.Product;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public interface ItemRepository extends JpaRepository<Item, Long> {

    @Query(value = "SELECT * FROM items it WHERE it.product_id = :prodID", nativeQuery = true)
    Item countAllItemsByProductId(@Param("prodID") long prodID);

    @Query(value = "SELECT it FROM Item it WHERE it.bag.id = :bagID")
    List<Item> findItemsByBagID(@Param("bagID") int bagID);

}