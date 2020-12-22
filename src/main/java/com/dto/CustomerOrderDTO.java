package com.dto;

import lombok.Data;

@Data
public class CustomerOrderDTO {
    private Long customerOrderId;
    private ShippingAddressDTO shippingAddressDTO;
}
