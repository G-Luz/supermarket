package com.gluz.supermaket.item.domain;

import com.gluz.supermaket.bag.domain.Bag;
import com.gluz.supermaket.product.domain.Product;
import lombok.Getter;
import lombok.Setter;

import javax.persistence.*;
import java.util.Objects;

@Setter
@Getter
@Entity
@Table(name = "items")
public class Item {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;

    private int itemCount;

    @JoinColumn(name = "product_id", foreignKey = @ForeignKey(name = "fk_items_product"))
    @OneToOne(cascade = {CascadeType.DETACH, CascadeType.REFRESH}, fetch = FetchType.LAZY)
    private Product product;

    @JoinColumn(name = "bag_id")
    @ManyToOne(cascade = {CascadeType.DETACH, CascadeType.REFRESH}, fetch = FetchType.LAZY)
    private Bag bag;

    @Override
    public boolean equals(Object o) {
        if (this == o) return true;
        if (!(o instanceof Item)) return false;
        Item items = (Item) o;
        return Objects.equals(id, items.id);
    }

    @Override
    public int hashCode() {
        return Objects.hash(id);
    }
}
