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

import PasqualeMonniello.SpearPhishingBackend.model.Eval;
import PasqualeMonniello.SpearPhishingBackend.model.EvalKey;
import PasqualeMonniello.SpearPhishingBackend.repository.EvalsRepository;

@RestController
@RequestMapping("/api")
public class EvalsController {

	@Autowired
	EvalsRepository evalRepository;
	
	@CrossOrigin
	@GetMapping("/evals/{email}/{id}")
	public Eval getEvalByIds(@PathVariable(value="email") String target, @PathVariable(value="id") Long emailId) {
		return evalRepository.findById(new EvalKey(target,emailId)).orElseThrow(()-> new RuntimeException(""));
	}
	
	@CrossOrigin
	@GetMapping("/evals/{email}")
	public List<Eval> getEvalsByTarget(@PathVariable(value="email") String target) {
		EvalsSpec spec = new EvalsSpec(new SearchCriteria("FK_email",":",target));
		return evalRepository.findAll(spec);
	}
	
	@CrossOrigin
	@GetMapping("/evals/{id}")
	public List<Eval> getEvalsByEmail(@PathVariable(value="id") Long emailId) {
		EvalsSpec spec = new EvalsSpec(new SearchCriteria("FK_id",":",emailId));
		return evalRepository.findAll(spec);
	}
	
	@CrossOrigin
	@PostMapping("/eval")
	public Eval postEval(@RequestBody Eval e) {
		return evalRepository.save(e);
	}
	
	@CrossOrigin
	@DeleteMapping("/eval/{email}/{id}")
	public ResponseEntity<?> postEval(@PathVariable(value="email") String target, @PathVariable(value="id") Long emailId) {
		Eval e = evalRepository.findById(new EvalKey(target,emailId)).orElseThrow(()-> new RuntimeException(""));
		
		evalRepository.delete(e);
		
		return ResponseEntity.ok().build();
	
	}
	
	@CrossOrigin
	@PutMapping("/eval/{email}/{id}")
	public Eval updateEmail(@PathVariable(value="email") String target, @PathVariable(value="id") Long emailId, @RequestBody Eval ev) {
		Eval e = evalRepository.findById(new EvalKey(target,emailId)).orElseThrow(()-> new RuntimeException(""));
		e.setFK_id(ev.getFK_id());
		e.setFK_email(ev.getFK_email());
		e.setEvalPhish(ev.isEvalPhish());
		return evalRepository.save(e);
	}
}
