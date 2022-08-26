package PasqualeMonniello.SpearPhishingBackend.controller;

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

import PasqualeMonniello.SpearPhishingBackend.Builders.UserNotFoundException;
import PasqualeMonniello.SpearPhishingBackend.model.User;
import PasqualeMonniello.SpearPhishingBackend.repository.UsersRepository;

@RestController
@RequestMapping("/api")
public class UserController {
	
	@Autowired
	UsersRepository userRepository;
	
	@CrossOrigin
	@GetMapping("/users/{email}")
	public User getUserById(@PathVariable(value="email") String target) {
		return userRepository.findById(target).orElseThrow(()-> new UserNotFoundException());
	}
	
	@CrossOrigin
	@PostMapping("/user")
	public User uploadUser(@RequestBody User us) {
		return userRepository.save(us);
	}
	
	@CrossOrigin
	@DeleteMapping("/user/{email}")
	public ResponseEntity<?> deleteUser(@PathVariable(value="email") String target){
		User u = userRepository.findById(target).orElseThrow(()-> new UserNotFoundException());
		
		userRepository.delete(u);
		
		return ResponseEntity.ok().build();
	}
	
	@CrossOrigin
	@PutMapping("/user/{email}")
	public User updateUser(@PathVariable(value="email") String target, @RequestBody User us) {
		User u = userRepository.findById(target).orElseThrow(()-> new UserNotFoundException());
		u.setEmail(us.getEmail());
		u.setFname(us.getFname());
		u.setLname(us.getLname());
		u.setPhonenumber(us.getPhonenumber());
		u.setPosition(u.getPosition());
		return userRepository.save(u);
	}
}
