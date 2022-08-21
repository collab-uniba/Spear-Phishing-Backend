package PasqualeMonniello.SpearPhishingBackend.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
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

import PasqualeMonniello.SpearPhishingBackend.model.BigFive;
import PasqualeMonniello.SpearPhishingBackend.repository.BigFiveRepository;

@RestController
@RequestMapping("/api")
public class BigFiveController {
	
	@Autowired
	BigFiveRepository bigfiveRepository;
	
	@CrossOrigin
	@GetMapping("/BF/all")
	public List<BigFive> getAllBigFive(){
		return bigfiveRepository.findAll();
	}
	
	@CrossOrigin
	@GetMapping("/BF/{email}")
	public BigFive getBigFive(@PathVariable(value="email") String email){
		return bigfiveRepository.findById(email).orElseThrow(()-> new RuntimeException("Personality not found"));
	}
	
	@CrossOrigin
	@PostMapping("/BF")
	public BigFive postBigFive(@RequestBody BigFive bf) {
		return bigfiveRepository.save(bf);
	}
	
	@CrossOrigin
	@DeleteMapping("/BF/{email}")
	public ResponseEntity<?> deleteBigFive(@PathVariable(value="email") String email){
		BigFive bf = bigfiveRepository.findById(email).orElseThrow(()-> new RuntimeException("Personality not found"));
		
		bigfiveRepository.delete(bf);
		
		return ResponseEntity.ok().build();
	
	}
	
	@CrossOrigin
	@PutMapping("/BF/{email}")
	public BigFive updateBigFive(@PathVariable(value="email") String email, @RequestBody BigFive bf) {
		BigFive bf2 = bigfiveRepository.findById(email).orElseThrow(()-> new RuntimeException("Personality not found"));
		
		bf2.setU_email(email);
		bf2.setAgreebleness(bf.getAgreebleness());
		bf2.setExtraversion(bf.getExtraversion());
		bf2.setConsciousness(bf.getConsciousness());
		bf2.setImagination(bf.getImagination());
		bf2.setNevroticism(bf.getNevroticism());
		
		return bigfiveRepository.save(bf2);
	}
}
