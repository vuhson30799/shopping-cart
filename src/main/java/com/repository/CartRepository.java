package com.repository;

import com.model.Cart;
import com.model.Customer;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public interface CartRepository extends JpaRepository<Cart, Long> {
    List<Cart> findAllByCustomer(Customer customer);
    Page<Cart> findByCustomerAndStatusIsNot(Customer customer, String status, Pageable pageable);
    Page<Cart> findAllByStatusIsNot(String status, Pageable pageable);
}
