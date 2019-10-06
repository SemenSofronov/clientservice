package com.sofronov.clientservice.controller;

import com.sofronov.clientservice.entity.ClientType;
import com.sofronov.clientservice.service.ClientTypeService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;

import javax.validation.Valid;

@RestController
@RequestMapping(value = "client-types")
public class ClientTypeController {

    private ClientTypeService clientTypeService;

    @Autowired
    public ClientTypeController(ClientTypeService clientTypeService) {
        this.clientTypeService = clientTypeService;
    }

    @GetMapping(value = "/list")
    public Iterable<ClientType> getClientTypes() {
        return clientTypeService.getClientTypes();
    }

    @PostMapping(value = "/update/{clientTypeId}", consumes = "application/json")
    public ClientType update(@PathVariable("clientTypeId") Long clientTypeId, @Valid @RequestBody ClientType clientType) {
        return clientTypeService.update(clientTypeId, clientType);
    }

    @PostMapping(value = "/create", consumes = "application/json")
    public ClientType create(@Valid @RequestBody ClientType clientType) {
        return clientTypeService.create(clientType);
    }

    @GetMapping(value = "/delete/{clientTypeId}", consumes = "application/json")
    public Boolean delete(@PathVariable("clientTypeId") Long clientTypeId) {
        return clientTypeService.delete(clientTypeId);
    }
}
