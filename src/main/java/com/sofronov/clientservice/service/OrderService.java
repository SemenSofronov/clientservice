package com.sofronov.clientservice.service;

import com.sofronov.clientservice.entity.ClientOrder;
import org.springframework.cloud.openfeign.FeignClient;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;

@FeignClient(name = "orders", url = "localhost:8081/orders")
public interface OrderService {

    @GetMapping(value = "/list")
    Iterable<ClientOrder> getOrders();

    @GetMapping(value = "/client-list/{clientId}")
    Iterable<ClientOrder> getOrdersByClientId(@PathVariable("clientId") Long clientId);

    @PostMapping(value = "/update/{orderId}", consumes = "application/json")
    ClientOrder update(@PathVariable("orderId") Long orderId, @RequestBody ClientOrder clientOrder);

    @PostMapping(value = "/create", consumes = "application/json")
    ClientOrder create(@RequestBody ClientOrder clientOrder);

    @GetMapping(value = "/delete/{orderId}", consumes = "application/json")
    Boolean delete(@PathVariable("orderId") Long orderId);
}
