package com.sofronov.clientservice.dao;

import com.sofronov.clientservice.entity.ClientType;
import org.springframework.data.repository.CrudRepository;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

@Repository
@Transactional
public interface ClientTypeDAO extends CrudRepository<ClientType, Long> {
}
