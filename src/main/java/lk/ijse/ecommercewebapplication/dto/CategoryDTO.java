package lk.ijse.ecommercewebapplication.dto;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

import java.io.InputStream;

@AllArgsConstructor
@NoArgsConstructor
@Data
public class CategoryDTO {
    private String name;
    private InputStream image;
}
