package com.sofronov.clientservice.controller;

import com.sofronov.clientservice.entity.Client;
import com.sofronov.clientservice.entity.ClientOrder;
import com.sofronov.clientservice.service.ClientService;
import com.sofronov.clientservice.service.OrderService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;

import javax.validation.Valid;

@RestController
@RequestMapping(value = "clients")
public class ClientController {

    private ClientService clientService;
    private OrderService orderService;

    @Autowired
    public ClientController(ClientService clientService, OrderService orderService) {
        this.clientService = clientService;
        this.orderService = orderService;
    }

    @GetMapping(value = "/list")
    public Iterable<Client> getClients() {
        return clientService.getClients();
    }

    @GetMapping(value = "/order-list/{clientId}")
    public Iterable<ClientOrder> getClientOrders(@PathVariable("clientId") Long clientId) {
        return orderService.getOrdersByClientId(clientId);
    }

    @GetMapping(value = "/order-list")
    public Iterable<ClientOrder> getOrders() {
        return orderService.getOrders();
    }

    @PostMapping(value = "/update/{clientId}", consumes = "application/json")
    public Client update(@PathVariable("clientId") Long clientId, @Valid @RequestBody Client client) {
        return clientService.update(clientId, client);
    }

    @PostMapping(value = "/create", consumes = "application/json")
    public Client create(@Valid @RequestBody Client client) {
        return clientService.create(client);
    }

    @GetMapping(value = "/delete/{clientId}", consumes = "application/json")
    public Boolean delete(@PathVariable("clientId") Long clientId) {
        return clientService.delete(clientId);
    }
}
