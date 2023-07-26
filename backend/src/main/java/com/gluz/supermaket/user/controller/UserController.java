package com.gluz.supermaket.user.controller;

import com.gluz.supermaket.user.controller.dto.UserDTO;
import com.gluz.supermaket.user.service.UserService;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;

import java.util.Optional;

import static com.gluz.supermaket.config.JWTConstants.*;

@RestController
@RequestMapping(path = USERS_URL)
public class UserController {

    private UserService usersService;

    public UserController(UserService usersService) {
        this.usersService = usersService;
    }

    @PostMapping(path = SIGN_UP_URL)
    public ResponseEntity registerNewUser(@RequestBody UserDTO dto) {
        return ResponseEntity.ok().body(usersService.registerNewUser(dto));
    }

    @PostMapping(path = SIGN_IN_URL)
    public ResponseEntity userLogin(@RequestBody UserDTO dto) {
        return ResponseEntity.ok().body(usersService.userLogin(dto));
    }

    @GetMapping
    public ResponseEntity<Optional<UserDTO>> findUserByEmail(@RequestParam String email) {
        return ResponseEntity.ok().body(usersService.findUserByEmail(email));
    }

    @PutMapping
    public ResponseEntity updateUser(@RequestBody UserDTO dto) {
        return ResponseEntity.ok().body(usersService.updateUser(dto));
    }


}
