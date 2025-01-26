package lk.ijse.ecommercewebapplication.entity;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

import java.io.InputStream;

@AllArgsConstructor
@NoArgsConstructor
@Data
public class Category {
    private String name;
    private InputStream image;
}
