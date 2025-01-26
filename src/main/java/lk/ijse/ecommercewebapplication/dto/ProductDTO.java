package lk.ijse.ecommercewebapplication.dto;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@AllArgsConstructor
@NoArgsConstructor
@Data
public class ProductDTO {
    private int id;
    private String name;
    private String category;
    private double price;
    private int stock;
    private String getImageUrl; // Field to store the image path
}
