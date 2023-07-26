package com.gluz.supermaket.user.domain;

import com.gluz.supermaket.bag.domain.Bag;
import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

import javax.persistence.*;
import java.io.Serializable;

@AllArgsConstructor
@NoArgsConstructor

@Getter
@Setter
@Entity
@Table(name = "users")
public class User implements Serializable {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;

    @Column(name = "name", nullable = false)
    private String name;

    @Column(name = "email", nullable = false, unique = true)
    private String email;

    @Column(name = "password")
    private String password;

    @Column(name = "role", nullable = false)
    private String role;

    @JoinColumn(name = "bag_id", foreignKey = @ForeignKey(name = "fk_user_bag"))
    @OneToOne(cascade = {CascadeType.DETACH}, fetch = FetchType.LAZY)
    private Bag bag;
}
