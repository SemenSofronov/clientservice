package com.sofronov.clientservice.dao;

import com.sofronov.clientservice.entity.Client;
import org.springframework.data.repository.CrudRepository;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

@Repository
@Transactional
public interface ClientDAO extends CrudRepository<Client, Long> {
}
