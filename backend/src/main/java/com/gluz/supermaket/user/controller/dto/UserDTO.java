package com.gluz.supermaket.user.controller.dto;

import com.fasterxml.jackson.annotation.JsonProperty;
import com.gluz.supermaket.bag.controller.dto.BagDTO;
import com.gluz.supermaket.bag.domain.Bag;
import lombok.Getter;
import lombok.Setter;

@Setter
@Getter

public class UserDTO {

    private Long id;
    private String name;
    private String email;
    private String role;
    private BagDTO bag;

    @JsonProperty(access = JsonProperty.Access.WRITE_ONLY)
    private String password;
}
