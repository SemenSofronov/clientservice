package com.sofronov.clientservice.service;

import com.sofronov.clientservice.dao.ClientDAO;
import com.sofronov.clientservice.dao.ClientTypeDAO;
import com.sofronov.clientservice.entity.Client;
import com.sofronov.clientservice.entity.ClientType;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.Date;
import java.util.Optional;

@Service
public class ClientService {

    private ClientDAO clientDAO;
    private ClientTypeDAO clientTypeDAO;

    @Autowired
    public ClientService(ClientDAO clientDAO, ClientTypeDAO clientTypeDAO) {
        this.clientDAO = clientDAO;
        this.clientTypeDAO = clientTypeDAO;
    }

    public Iterable<Client> getClients() {
        return clientDAO.findAll();
    }

    public Client update(Long clientId, Client client) {
        Optional<Client> optionalClient = clientDAO.findById(clientId);
        if (optionalClient.isPresent()) {
            Client oldClient = optionalClient.get();

            oldClient.setFullName(client.getFullName());
            oldClient.setShortName(client.getShortName());
            oldClient.setInn(client.getInn());
            oldClient.setOkpo(client.getOkpo());
            oldClient.setModificationDate(new Date());

            return clientDAO.save(oldClient);
        }

        return null;
    }

    public Client create(Client client) {

        if (client.getClientType() != null) {
            Optional<ClientType> optionalClientType = clientTypeDAO.findById(client.getClientType().getId());
            optionalClientType.ifPresent(client::setClientType);
        }

        client.setCreationDate(new Date());

        return clientDAO.save(client);
    }

    public Boolean delete(Long clientId) {
        Optional<Client> optionalClient = clientDAO.findById(clientId);
        if (optionalClient.isPresent()) {
            clientDAO.delete(optionalClient.get());
            return true;
        }
        return false;
    }
}
