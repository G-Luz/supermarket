package com.gluz.supermaket.bag.domain;

import com.fasterxml.jackson.annotation.JsonIgnore;
import com.fasterxml.jackson.annotation.JsonIgnoreProperties;
import com.gluz.supermaket.item.domain.Item;
import com.gluz.supermaket.user.domain.User;
import lombok.Getter;
import lombok.Setter;

import javax.persistence.*;
import java.util.List;
import java.util.Objects;


@Getter
@Setter

@Entity
@Table(name = "bags")
//@JsonIgnoreProperties({"hibernateLazyInitializer", "handler"})
public class Bag {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;

    @Column(name = "total_items")
    private int totalItems;

    @Column(name = "totalPrice")
    private double totalPrice;

    @OneToOne(mappedBy = "bag")
    @JsonIgnore
    private User user;

    @JoinColumn(name = "bag_id", foreignKey = @ForeignKey(name = "fk_bag_items"), referencedColumnName = "id")
    @OneToMany(cascade = CascadeType.REFRESH, fetch = FetchType.LAZY)
    private List<Item> items;

    @Override
    public boolean equals(Object o) {
        if (this == o) return true;
        if (!(o instanceof Bag)) return false;
        Bag bag = (Bag) o;
        return Objects.equals(id, bag.id);
    }

    @Override
    public int hashCode() {
        return Objects.hash(id);
    }
}
