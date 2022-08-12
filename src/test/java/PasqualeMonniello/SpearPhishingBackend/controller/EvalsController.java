package PasqualeMonniello.SpearPhishingBackend.controller;

import java.util.ArrayList;
import java.util.List;
import java.util.Set;
import java.util.stream.Collectors;

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
import PasqualeMonniello.SpearPhishingBackend.repository.EvalsRepository;

@RestController
@RequestMapping("/api")
public class EvalsController {

	@Autowired
	EvalsRepository evalRepository;
	
	@CrossOrigin
	@GetMapping("/eval/{id}")
	public Eval getEvalByIds(@PathVariable(value="id") Long evalId) {
		return evalRepository.findById(evalId).orElseThrow(()-> new RuntimeException("Evaluation not found"));
	}
	
	@CrossOrigin
	@GetMapping("/evals/{email}/{id}")
	public Eval getEvalCombined(@PathVariable(value="email") String target, @PathVariable(value="id") Long emailId) {
		EvalsSpec spec = new EvalsSpec(new SearchCriteria("FK_email",":",target));
		List<Eval> list1 = evalRepository.findAll(spec);
		EvalsSpec spec2 = new EvalsSpec(new SearchCriteria("FK_id",":",emailId));
		List<Eval> list2 = evalRepository.findAll(spec2);
		Set<Eval> res = list1.stream().distinct().filter(list2::contains).collect(Collectors.toSet());
		return (new ArrayList<Eval>(res)).get(0);
	}
	
	@CrossOrigin
	@GetMapping("/evals/email/{email}")
	public List<Eval> getEvalsByTarget(@PathVariable(value="email") String target) {
		EvalsSpec spec = new EvalsSpec(new SearchCriteria("FK_email",":",target));
		return evalRepository.findAll(spec);
	}
	
	@CrossOrigin
	@GetMapping("/evals/id/{id}")
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
	@DeleteMapping("/eval/{id}")
	public ResponseEntity<?> postEval(@PathVariable(value="id") Long evalId) {
		Eval e = evalRepository.findById(evalId).orElseThrow(()-> new RuntimeException("Evaluation not found"));
		
		evalRepository.delete(e);
		
		return ResponseEntity.ok().build();
	
	}
	
	@CrossOrigin
	@PutMapping("/eval/{id}")
	public Eval updateEmail(@PathVariable(value="id") Long evalId, @RequestBody Eval ev) {
		Eval e = evalRepository.findById(evalId).orElseThrow(()-> new RuntimeException("Evaluation not found"));
		e.setFK_id(ev.getFK_id());
		e.setFK_email(ev.getFK_email());
		e.setEvalPhish(ev.isEvalPhish());
		return evalRepository.save(e);
	}
}
