package PasqualeMonniello.SpearPhishingBackend.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.jpa.repository.Query;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.CrossOrigin;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import PasqualeMonniello.SpearPhishingBackend.Builders.EmailNotfFoundException;
import PasqualeMonniello.SpearPhishingBackend.model.Email;
import PasqualeMonniello.SpearPhishingBackend.repository.EmailsRepository;

@RestController
@RequestMapping("/api")
public class EmailController {

	@Autowired
	EmailsRepository emailRepository;
	@CrossOrigin
	@GetMapping("/emails/{target}")
	public List<Email> getAllEmail(@PathVariable(value="target") String target) {
		EmailSpec spec = new EmailSpec(new SearchCriteria("FK_target", ":",target));
		return emailRepository.findAll(spec);
	}
	
	
	
	@CrossOrigin
	@GetMapping("/email/{id}")
	public Email getEmailById(@PathVariable(value="id") Long emailId) {
		return emailRepository.findById(emailId).orElseThrow(() -> new EmailNotfFoundException());
	}
	
}
