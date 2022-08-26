package PasqualeMonniello.SpearPhishingBackend.repository;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.JpaSpecificationExecutor;

import PasqualeMonniello.SpearPhishingBackend.model.Eval;

public interface EvalsRepository extends JpaRepository<Eval, Long>,JpaSpecificationExecutor<Eval>{

}
