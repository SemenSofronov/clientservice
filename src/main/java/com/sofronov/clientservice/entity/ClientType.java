package com.sofronov.clientservice.entity;

import javax.persistence.*;
import javax.validation.constraints.NotEmpty;

@Entity
@Table(name = "client_type")
public class ClientType {

    @Id
    @GeneratedValue
    private Long id;

    @NotEmpty(message = "Please provide a short name")
    @Column(name = "short_name", nullable = false, length = 60)
    private String shortName;

    @Column(name = "full_name")
    private String fullName;

    @Column(name = "client_type_code", length = 10)
    private String clientTypeCode;

    public Long getId() {
        return id;
    }

    public void setId(Long id) {
        this.id = id;
    }

    public String getShortName() {
        return shortName;
    }

    public void setShortName(String shortName) {
        this.shortName = shortName;
    }

    public String getFullName() {
        return fullName;
    }

    public void setFullName(String fullName) {
        this.fullName = fullName;
    }

    public String getClientTypeCode() {
        return clientTypeCode;
    }

    public void setClientTypeCode(String clientTypeCode) {
        this.clientTypeCode = clientTypeCode;
    }
}
