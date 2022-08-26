package PasqualeMonniello.SpearPhishingBackend.repository;

import org.springframework.data.jpa.repository.JpaRepository;

import PasqualeMonniello.SpearPhishingBackend.model.User;

public interface UsersRepository  extends JpaRepository<User, String>{

}
