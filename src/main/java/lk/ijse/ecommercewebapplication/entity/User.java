package lk.ijse.ecommercewebapplication.entity;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@AllArgsConstructor
@NoArgsConstructor
@Data

public class User {
    private String name;
    private String username;
    private String email;
    private String mobile;
    private String password;
    private String role;
}
