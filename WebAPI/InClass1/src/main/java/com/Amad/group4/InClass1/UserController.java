package com.Amad.group4.InClass1;

import java.util.List;
import java.util.Optional;

import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

@RestController
public class UserController {
	
	@Autowired
	private UserRepository repository;
	
	@Autowired
	private BCryptPasswordEncoder bCryptPasswordEncoder;
	

	@PostMapping(path="/users/sign-up")
	public void addUser(@Valid @RequestBody ApplicationUser user) {
		
		Optional<ApplicationUser> exists = repository.findById(user.getUserId());
		if (exists.isPresent()) {
			
			throw new UserAlreadyExists("user already exists");
		}
		user.setPassword(bCryptPasswordEncoder.encode(user.getPassword()));
		repository.save(user);
		
	}
	
	@GetMapping(path="/users")
	public ApplicationUser retrieveUsers(@RequestParam(value="id", required=true) String id){
		
		Optional<ApplicationUser> user =  repository.findById(id);
		
		if (!user.isPresent()) {
			
			throw new UserNotFoundException("user with id: " + id + " not found");
		}
		
		return user.get();
	}	
	
	@PutMapping(path="/users")
	
	public void updateUser(@Valid @RequestBody ApplicationUser user) {
		
		Optional<ApplicationUser> oldUser = repository.findById(user.getUserId()); 
		
        if (!oldUser.isPresent()) {
			
			throw new UserNotFoundException("user with id: " + user.getUserId() + " not found");
		}
		ApplicationUser newUser = oldUser.get();
		newUser.setAddress(user.getAddress());
		newUser.setAge(user.getAge());
		newUser.setName(user.getName());
		newUser.setWeight(user.getWeight());
		newUser.setPassword(user.getPassword());
		
		repository.save(newUser);
		
	}
	
}
