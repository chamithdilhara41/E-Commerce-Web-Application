package lk.ijse.ecommercewebapplication.entity;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@AllArgsConstructor
@NoArgsConstructor
@Data
public class Product {
    private int id;
    private String name;
    private String category;
    private double price;
    private int stock;
    private String ImageUrl; // Field to store the image path
}
