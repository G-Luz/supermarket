package com.gluz.supermaket.bag.service;

import com.gluz.supermaket.bag.domain.Bag;
import com.gluz.supermaket.bag.controller.dto.BagDTO;
import com.gluz.supermaket.item.domain.Item;
import com.gluz.supermaket.bag.repository.BagRepository;
import com.gluz.supermaket.user.domain.User;
import com.gluz.supermaket.user.repository.UserRepository;
import com.gluz.supermaket.utils.ConvertEntities;
import org.springframework.stereotype.Service;

import java.util.Optional;

@Service
public class BagService implements ConvertEntities<BagDTO, Bag> {

    private BagRepository bagRepository;
    private UserRepository userRepository;

    public BagService(BagRepository bagRepository, UserRepository userRepository) {
        this.bagRepository = bagRepository;
        this.userRepository = userRepository;
    }

    public BagDTO saveBagItems(BagDTO dto) {
        Bag bag = bagRepository.save(convertToEntity(dto));
        return convertToDTO(bag);
    }

    public Optional<BagDTO> fetchBagByUser(int userID) {
        Bag bag = bagRepository.findBagByUserID(userID);
        User user = userRepository.findById((long) userID).get();

        if (user != null) {
            bag.setUser(user);
        }

        if (bag != null) {
            return Optional.ofNullable(convertToDTO(bag));
        }
        return Optional.empty();
    }

    @Override
    public Bag convertToEntity(BagDTO dto) {
        Bag bag = new Bag();
        double totalPrice = 0;
        int totalItems = 0;
        bag.setId(dto.getId());
//        bag.setItems(dto.getItems());
//        for (Item item : dto.getItems()) {
//            totalItems++;
//            totalPrice += item.getProduct().getPrice();
//        }
        bag.setTotalPrice(totalPrice);
//        bag.setUser(dto.getUser());
        bag.setTotalItems(totalItems);
        return bag;
    }

    @Override
    public BagDTO convertToDTO(Bag entity) {
        BagDTO dto = new BagDTO();
        double totalPrice = 0;
        int totalItems = 0;

        dto.setId(entity.getId());
//        dto.setItems(entity.getItems());
//        for (Item item : entity.getItems()) {
//            totalItems++;
//            totalPrice += item.getProduct().getPrice();
//        }
        dto.setTotalPrice(totalPrice);
        dto.setItemCount(totalItems);
//        dto.setUser(entity.getUser());
        return dto;
    }
}
