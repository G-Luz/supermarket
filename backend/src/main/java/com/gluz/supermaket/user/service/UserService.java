package com.gluz.supermaket.user.service;

import com.gluz.supermaket.bag.service.BagService;
import com.gluz.supermaket.user.domain.User;
import com.gluz.supermaket.user.controller.dto.UserDTO;
import com.gluz.supermaket.user.repository.UserRepository;
import com.gluz.supermaket.utils.ConvertEntities;
import org.hibernate.tool.schema.internal.exec.ScriptTargetOutputToFile;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.security.core.userdetails.UsernameNotFoundException;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Service;

import java.util.Optional;

@Service
public class UserService implements ConvertEntities<UserDTO, User>, UserDetailsService {
    private UserRepository usersRepository;
    private BagService bagService;
    private BCryptPasswordEncoder bCryptPasswordEncoder;


    UserService(UserRepository usersRepository, BagService bagService, BCryptPasswordEncoder bCryptPasswordEncoder) {
        this.usersRepository = usersRepository;
        this.bagService = bagService;
        this.bCryptPasswordEncoder = bCryptPasswordEncoder;
    }

    public String registerNewUser(UserDTO dto) {
        usersRepository.saveAndFlush(convertToEntity(dto));
        return "Usuário criado com sucesso!";
    }

    public UserDTO updateUser(UserDTO dto) {
        return convertToDTO(usersRepository.save(convertToEntity(dto)));
    }

    public UserDTO userLogin(UserDTO dto) {
        return convertToDTO(usersRepository.findByEmail(dto.getEmail()));
    }

    public Optional<UserDTO> findUserByEmail(String email) {
        User user = usersRepository.findByEmail(email);
        if(user != null){
            return Optional.ofNullable(convertToDTO(user));
        }
        return Optional.empty();
    }

    @Override
    public User convertToEntity(UserDTO dto) {
        User user = new User();
        user.setId(dto.getId());
        user.setName(dto.getName());
        user.setEmail(dto.getEmail());
        user.setRole(dto.getRole());

        System.out.println("CARAIO PORQ???? " + dto.getPassword());

        if (dto.getBag() != null) {
            user.setBag(bagService.convertToEntity(dto.getBag()));
        }
        if (dto.getPassword() != null) {
            user.setPassword(bCryptPasswordEncoder
                    .encode(dto.getPassword()));

        }
        return user;
    }

    @Override
    public UserDTO convertToDTO(User entity) {
        UserDTO usersDTO = new UserDTO();
        usersDTO.setId(entity.getId());
        usersDTO.setName(entity.getName());
        usersDTO.setEmail(entity.getEmail());
        usersDTO.setRole(entity.getRole());
        if (entity.getBag() != null) {
            usersDTO.setBag(bagService.convertToDTO(entity.getBag()));
        }
        usersDTO.setPassword(entity.getPassword());
        return usersDTO;
    }

    @Override
    public UserDetails loadUserByUsername(String email) throws UsernameNotFoundException {
        final User user = usersRepository.findByEmail(email);
        if (user == null) {
            throw new UsernameNotFoundException(email);
        }
        UserDetails userDetails = org.springframework.security.core.userdetails.User
                .withUsername(user.getEmail())
                .password(user.getPassword())
                .authorities(user.getRole())
                .build();
        return userDetails;
    }
}
