package com.dto;

import com.model.ShippingAddress;
import lombok.Data;

@Data
public class ShippingAddressDTO {
    private String address;
    private String city;
    private String state;
    private String country;
    private String zipcode;

    public ShippingAddress toShippingAddress(ShippingAddress shippingAddress) {
        shippingAddress.setAddress(this.getAddress());
        shippingAddress.setCity(this.getCity());
        shippingAddress.setCountry(this.getCountry());
        shippingAddress.setState(this.getState());
        shippingAddress.setZipcode(this.getZipcode());
        return shippingAddress;
    }
}
