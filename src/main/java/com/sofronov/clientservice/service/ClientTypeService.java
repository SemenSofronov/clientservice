package com.sofronov.clientservice.service;

import com.sofronov.clientservice.dao.ClientTypeDAO;
import com.sofronov.clientservice.entity.ClientType;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.Optional;

@Service
public class ClientTypeService {

    private ClientTypeDAO clientTypeDAO;

    @Autowired
    public ClientTypeService(ClientTypeDAO clientTypeDAO) {
        this.clientTypeDAO = clientTypeDAO;
    }

    public Iterable<ClientType> getClientTypes() {
        return clientTypeDAO.findAll();
    }

    public ClientType update(Long clientTypeId, ClientType clientType) {
        Optional<ClientType> optionalClientType = clientTypeDAO.findById(clientTypeId);
        if (optionalClientType.isPresent()) {
            ClientType oldClientType = optionalClientType.get();

            oldClientType.setFullName(clientType.getFullName());
            oldClientType.setShortName(clientType.getShortName());
            oldClientType.setClientTypeCode(clientType.getClientTypeCode());

            return clientTypeDAO.save(oldClientType);
        }

        return null;
    }

    public ClientType create(ClientType clientType) {
        return clientTypeDAO.save(clientType);
    }

    public Boolean delete(Long clientTypeId) {
        Optional<ClientType> optionalClientType = clientTypeDAO.findById(clientTypeId);
        if (optionalClientType.isPresent()) {
            clientTypeDAO.delete(optionalClientType.get());
            return true;
        }
        return false;
    }
}
