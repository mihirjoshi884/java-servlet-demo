package com.mikejuliet.configurations;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

@Getter
public class DatabaseConfiguration {

    private final String driverClassName = "com.mysql.cj.jdbc.Driver";
    private final String url = "jdbc:mysql://localhost:3306/EployeeServletDemo";
    private final String user = "root";
    private final String password = "Mimioscar@030203";
}
