package PasqualeMonniello.SpearPhishingBackend.repository;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.JpaSpecificationExecutor;
import org.springframework.stereotype.Repository;

import PasqualeMonniello.SpearPhishingBackend.model.Email;

@Repository
public interface EmailsRepository extends JpaRepository<Email, Long>, JpaSpecificationExecutor<Email>{

}
