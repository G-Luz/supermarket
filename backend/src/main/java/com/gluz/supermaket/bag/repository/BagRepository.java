package com.gluz.supermaket.bag.repository;

import com.gluz.supermaket.bag.domain.Bag;
import com.gluz.supermaket.user.domain.User;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;
import org.springframework.stereotype.Repository;

@Repository
public interface BagRepository extends JpaRepository<Bag, Long> {

    @Query(value = "SELECT * FROM Bags b WHERE b.user_id = :userID", nativeQuery = true)
    public Bag findBagByUserID(@Param("userID") int userID);

}